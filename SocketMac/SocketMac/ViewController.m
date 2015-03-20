//
//  ViewController.m
//  SocketMac
//
//  Created by zhifei on 15/3/19.
//  Copyright (c) 2015年 ZhiFei(qiuzhifei521@gmail.com). All rights reserved.
//

#import "ViewController.h"
#import "GCDAsyncSocket.h"

@interface ViewController () <GCDAsyncSocketDelegate>

@end

@implementation ViewController {
   GCDAsyncSocket *socket;
  GCDAsyncSocket *s;
}

- (void)touchesBeganWithEvent:(NSEvent *)event{
  socket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
  NSError *err = nil;
  if([socket acceptOnPort:6666 error:&err])
  {
    NSLog(@"开始监听");
  } else {
    NSLog(@"没有监听到");
  }
}
- (IBAction)play:(id)sender {
  
 
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  socket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
  NSError *err = nil;
  if([socket acceptOnPort:6666 error:&err])
  {
    NSLog(@"开始监听");
  } else {
    NSLog(@"没有监听到");
  }
  
  // Do any additional setup after loading the view.
}


- (void)socket:(GCDAsyncSocket *)sender didAcceptNewSocket:(GCDAsyncSocket *)newSocket
{
  NSLog(@"%@", [NSString stringWithFormat:@"建立与%@的连接",newSocket.connectedHost]);
  
  s = newSocket;
  [s readDataWithTimeout:-1 tag:0];
}

-(void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag
{
  NSString *receive = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
  
  NSString *reply = [NSString stringWithFormat:@"收到:%@",receive];
  
  [s writeData:[reply dataUsingEncoding:NSUTF8StringEncoding] withTimeout:-1 tag:0];
  [s readDataWithTimeout:-1 tag:0];
  
  NSLog(@"%@", reply);
}


- (void)setRepresentedObject:(id)representedObject {
  [super setRepresentedObject:representedObject];

  // Update the view, if already loaded.
}

@end
