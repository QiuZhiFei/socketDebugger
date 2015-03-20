//
//  ViewController.m
//  SocketDebuger
//
//  Created by zhifei on 15/3/19.
//  Copyright (c) 2015年 ZhiFei(qiuzhifei521@gmail.com). All rights reserved.
//

#import "ViewController.h"
#import "GCDAsyncSocket.h"
#import "SocketLogger.h"

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  [[SocketLogger sharedSocketLogger] connectToHost:@"192.168.0.57"
                                            onPort:6666
                                             error:nil];

  
  // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
  [super touchesBegan:touches withEvent:event];
  
  [SocketLogger log:@"123"];
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
