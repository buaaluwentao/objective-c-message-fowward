//
//  PBNoMehtod.m
//  PBRuntimeMethodInvocation
//
//  Created by wentao lu on 2021/4/17.
//

#import "PBNoMehtod.h"

@implementation PBNoMehtod
- (void)doesNotRecognizeSelector:(SEL)aSelector {
    NSLog(@"the  was was not recognezied ...");
}

- (void)methodNotFounded {
    NSLog(@"the  was was not recognezied ...");
}

/*- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    return
}*/

- (void)home {
    
}

@end
