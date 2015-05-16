//
//  ZooniverseClientImageDownloadSet.h
//  ios-galaxyzoo
//
//  Created by Murray Cumming on 16/05/2015.
//  Copyright (c) 2015 Murray Cumming. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZooniverseClientImageDownloadSet : NSObject

- (ZooniverseClientImageDownloadSet *) init;

//Mapping task id (NSString) to ZooniverseClientImageDownload.
@property (nonatomic, strong) NSMutableDictionary *dictTasks;

typedef void (^ ZooniverseClientImageDownloadSetQueryDoneBlock)();

@property (nonatomic, strong) ZooniverseClientImageDownloadSetQueryDoneBlock callbackBlock;

@end