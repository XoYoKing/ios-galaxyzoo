//
//  Utils.m
//  ios-galaxyzoo
//
//  Created by Murray Cumming on 12/05/2015.
//  Copyright (c) 2015 Murray Cumming. All rights reserved.
//

#import "Utils.h"
#import "Config.h"
#import <UIKit/UIKit.h>

@implementation Utils

+ (void)fetchRequestSortByDateTimeRetrieved:(NSFetchRequest *)fetchRequest {
    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"datetimeRetrieved" ascending:YES]];
}

+ (void)fetchRequestSortByDoneAndDateTimeRetrieved:(NSFetchRequest *)fetchRequest {
    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"uploaded" ascending:NO],
                                     [NSSortDescriptor sortDescriptorWithKey:@"done" ascending:NO],
                                     [NSSortDescriptor sortDescriptorWithKey:@"datetimeRetrieved" ascending:YES]];
}

+ (void)openUrlInBrowser:(NSString *)strUrl {
    NSURL *url = [NSURL URLWithString:strUrl];

    if (![[UIApplication sharedApplication] openURL:url]) {
        NSLog(@"openUrlInBrowser: Failed to open url: %@", url.description);
    }
}

+ (void)openDiscussionPage:(NSString *)zooniverseId {
    NSString *strUrl = [NSString stringWithFormat:@"%@%@",
                        [Config talkUri],
                        zooniverseId];
    [Utils openUrlInBrowser:strUrl];
}

+ (NSString *)filenameForIconName:(NSString *)iconName {
    return [NSString stringWithFormat:@"icon_%@", iconName, nil];
}

@end
