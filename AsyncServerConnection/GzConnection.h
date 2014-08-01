//
//  Connection.h
//  JSON
//
//  Created by sebastiao Gazolla Costa Junior on 30/07/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



@interface GzConnection : NSObject

@property (strong) NSMutableArray *albuns;
@property (strong) NSURLConnection *urlConn;
@property (strong) NSMutableData *responseData;
@property BOOL isConnectionOK;

- (void)processJSON;
- (void)connect;

@end
