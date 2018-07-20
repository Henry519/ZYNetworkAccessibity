//
//  ViewController.m
//  ZYNetworkAccessibityDemo
//
//  Created by zie on 20/7/18.
//  Copyright © 2018年 zie. All rights reserved.
//

#import "ViewController.h"
#import "ZYNetworkAccessibity.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

static NSString * NSStringFromZYNetworkAccessibleState(ZYNetworkAccessibleState state) {
    return state == ZYNetworkUnknown    ? @"ZYNetworkUnknown"    :
           state == ZYNetworkAccessible ? @"ZYNetworkAccessible" :
           state == ZYNetworkRestricted ? @"ZYNetworkRestricted" : nil;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [ZYNetworkAccessibity setAlertEnable:YES];
    
    self.label.text = NSStringFromZYNetworkAccessibleState(ZYNetworkAccessibity.currentState);
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkChanged:) name:ZYNetworkAccessibityChangedNotification object:nil];
}

- (void)networkChanged:(NSNotification *)notification {
    
    ZYNetworkAccessibleState state = ZYNetworkAccessibity.currentState;
    self.label.text = NSStringFromZYNetworkAccessibleState(state);
}


@end