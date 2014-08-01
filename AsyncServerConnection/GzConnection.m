//
//  Connection.m
//  JSON
//
//  Created by sebastiao Gazolla Costa Junior on 30/07/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GzConnection.h"
#import "GzAlbum.h"


@implementation GzConnection

dispatch_queue_t myQueue;


- (void)connect {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;

    myQueue = dispatch_queue_create("com.gazapps.myqueue.processjson", 0);
    NSURLRequest *request;
    self.responseData = [NSMutableData data] ;
    request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://itunes.apple.com/us/rss/topalbums/limit=200/json"] cachePolicy:NSURLRequestReloadIgnoringCacheData
                           timeoutInterval:60.0];
    self.urlConn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
}



- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	[self.responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	[self.responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
	NSLog(@"%@",[NSString stringWithFormat:@"Connection failed: %@", [error description]]);
    self.isConnectionOK = NO;
    self.albuns = nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    self.isConnectionOK = YES;
	self.albuns = nil;
	
	dispatch_async(myQueue, ^{ 
		[self processJSON];
		
		dispatch_sync(dispatch_get_main_queue(), ^{
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            [[NSNotificationCenter defaultCenter] postNotificationName:@"serverDataReceived" object:self];
		
        });
	});
}


- (void) processJSON {
    
    NSError* error;
    NSDictionary* allData = [NSJSONSerialization JSONObjectWithData:self.responseData
                                                            options:kNilOptions
                                                              error:&error];
    NSDictionary* feed = [allData objectForKey:@"feed"];
    NSArray *entry = [feed objectForKey:@"entry"];
    int counter = 0;

    self.albuns = [[NSMutableArray alloc] init];
    
    for (NSDictionary *object in entry) {
        counter ++;
        GzAlbum *album = [[GzAlbum alloc] init];
        album.artistName = [[object objectForKey:@"im:artist"] objectForKey:@"label"];
        album.collectionName = [[object objectForKey:@"title"] objectForKey:@"label"];
        album.collectionPrice = [[object objectForKey:@"im:price"] objectForKey:@"label"];
        
        [self.albuns addObject:album];
    }
    
    NSLog(@"numero de objetos: %i", counter);
    
}



@end
