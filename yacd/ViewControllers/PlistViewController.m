//
//  PlistViewController.m
//  yacd
//
//  Created by admin on 2021/6/29.
//  Copyright © 2021 Selander. All rights reserved.
//

#import "PlistViewController.h"

@interface PlistViewController ()

@end

@implementation PlistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UITextView * text = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height)];
    text.editable = NO;
    [self.view addSubview:text];
    text.text = self.plistString;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
