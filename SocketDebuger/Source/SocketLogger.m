//
//  SocketLogger.m
//  
//
//  Created by zhifei on 15/3/19.
//
//

#import "SocketLogger.h"
#import "GCDAsyncSocket.h"


@interface SocketLogger () <GCDAsyncSocketDelegate>
@property (nonatomic, strong) GCDAsyncSocket *socket;
@end

@implementation SocketLogger

+ (instancetype)sharedSocketLogger
{
  static SocketLogger *logger = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    logger = [[SocketLogger alloc] init];
    logger.socket = [[GCDAsyncSocket alloc] initWithDelegate:self
                                               delegateQueue:dispatch_get_main_queue()];
  });
  return logger;
}

- (BOOL)connectToHost:(NSString*)host onPort:(uint16_t)port error:(NSError **)errPtr
{
  return [self.socket connectToHost:host
                             onPort:port
                              error:errPtr];
}

- (void)send:(NSString *)string
{
  [self.socket writeData:[string dataUsingEncoding:NSUTF8StringEncoding] withTimeout:-1 tag:0];
  [self.socket readDataWithTimeout:-1 tag:0];

}

+ (void)log:(NSString *)string
{
  [[SocketLogger sharedSocketLogger] send:string];
}

#pragma mark - GCDAsyncSocketDelegate

- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port
{
  [self.socket readDataWithTimeout:-1 tag:0];
}

@end
