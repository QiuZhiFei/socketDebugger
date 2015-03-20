//
//  ViewController.m
//  SocketClientDemo
//
//  Created by zhifei on 15/3/20.
//  Copyright (c) 2015年 ZhiFei(qiuzhifei521@gmail.com). All rights reserved.
//

#import "ViewController.h"

#import <SocketDebuger/SocketLogger.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)log:(id)sender {
  [SocketLogger log:@"123"];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
