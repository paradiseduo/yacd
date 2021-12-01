//
//  ListViewController.h
//  yacd
//
//  Created by admin on 2021/6/29.
//  Copyright © 2021 Selander. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <dlfcn.h>
#import <sys/mman.h>
#import <PsychicStapler/PsychicStapler.h>

NS_ASSUME_NONNULL_BEGIN

@interface ListViewController : UIViewController
@property (nonatomic, strong) NSDictionary <NSString*, PIDInfo*> *processDictionary;
@property (nonatomic, strong) NSArray <id<LSApplicationProxyProtocol>>*installedApplications;
@property (nonatomic, strong) NSArray <id<LSApplicationProxyProtocol>>* filteredInstalledApplications;
@end

NS_ASSUME_NONNULL_END
