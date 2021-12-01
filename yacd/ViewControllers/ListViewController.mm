//
//  ListViewController.m
//  yacd
//
//  Created by admin on 2021/6/29.
//  Copyright © 2021 Selander. All rights reserved.
//

#import "ListViewController.h"
#import "PlistViewController.h"

@interface ListViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, copy) NSMutableArray * plistArray;
@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UITableView * table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height)];
    [self.view addSubview:table];
    table.delegate = self;
    table.dataSource = self;
    [table reloadData];
    
    NSMutableArray * aaa = [[NSMutableArray alloc] init];
    for (int i = 0 ; i < self.installedApplications.count; ++i) {
        auto application = self.installedApplications[i];
        if ([[application bundleIdentifier] containsString:@"com.apple"]) {
            continue;
        } else {
            [aaa addObject:application];
        }
    }
    self.filteredInstalledApplications = [[NSArray alloc] initWithArray:aaa];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellMe"];
    auto application = self.filteredInstalledApplications[indexPath.row];
    
    NSData *data = [application primaryIconDataForVariant:0x20];
    CGImageRef imageRef = LICreateIconFromCachedBitmap(data);
    CGFloat scale = [UIScreen mainScreen].scale;
    UIImage *image = [[UIImage alloc] initWithCGImage:imageRef scale:scale orientation:UIImageOrientationUp];
    
    cell.imageView.image = image;
    cell.textLabel.text = [application localizedName];
    cell.detailTextLabel.text = [application bundleIdentifier];
    cell.contentView.backgroundColor = [UIColor greenColor];
    
    auto path = [application canonicalExecutablePath];
    NSArray * arr = [path componentsSeparatedByString:@"/"];
    NSMutableString * s = [[NSMutableString alloc] init];
    for (int i = 1; i < arr.count-1; ++i) {
        [s appendFormat:@"/%@", arr[i]];
    }
    NSString * plistPath = [NSString stringWithFormat:@"%@/Info.plist", s];
    NSLog(@"%@", plistPath);
    NSMutableDictionary * dir = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    if ([[NSString stringWithFormat:@"%@", dir] containsString:@"NSUserTrackingUsageDescription"]) {
        cell.contentView.backgroundColor = [UIColor redColor];
    }
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.filteredInstalledApplications.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    auto application = self.filteredInstalledApplications[indexPath.row];
    
    auto path = [application canonicalExecutablePath];
    NSArray * arr = [path componentsSeparatedByString:@"/"];
    NSMutableString * s = [[NSMutableString alloc] init];
    for (int i = 1; i < arr.count-1; ++i) {
        [s appendFormat:@"/%@", arr[i]];
    }
    NSString * plistPath = [NSString stringWithFormat:@"%@/Info.plist", s];
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    PlistViewController * vv = [[PlistViewController alloc] init];
    vv.plistString = [NSString stringWithFormat:@"%@", data];
    [self.navigationController pushViewController:vv animated:YES];
}

@end
