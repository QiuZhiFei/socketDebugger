//
//  SocketLogger.h
//  
//
//  Created by zhifei on 15/3/19.
//
//

#import <Foundation/Foundation.h>

@interface SocketLogger : NSObject

+ (instancetype)sharedSocketLogger;

- (BOOL)connectToHost:(NSString*)host onPort:(uint16_t)port error:(NSError **)errPtr;

+ (void)log:(NSString *)string;

@end
