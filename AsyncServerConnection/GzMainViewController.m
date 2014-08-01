//
//  GzMainViewController.m
//  AsyncServerConnection
//
//  Created by Gazolla on 01/08/14.
//  Copyright (c) 2014 Gazolla. All rights reserved.
//

#import "GzMainViewController.h"
#import "GzAlbum.h"

@implementation GzMainViewController


-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.textView = [[UITextView alloc]initWithFrame:CGRectMake(0,30,320,400)];
    self.textView.font = [UIFont fontWithName:@"Helvetica" size:12];
    self.textView.font = [UIFont boldSystemFontOfSize:12];
    self.textView.backgroundColor = [UIColor whiteColor];
    self.textView.scrollEnabled = YES;
    self.textView.pagingEnabled = YES;
    self.textView.editable = YES;
    
    for (GzAlbum *album in self.albuns) {
        self.textView.text = [self.textView.text stringByAppendingString:[album.collectionName stringByAppendingString:@"\n"]];
        self.textView.text = [self.textView.text stringByAppendingString:[album.artistName stringByAppendingString:@"\n"]];
        self.textView.text = [self.textView.text stringByAppendingString:[album.collectionPrice stringByAppendingString:@"\n\n"]];
    }
    
    
    [self.view addSubview:self.textView];
}

@end
