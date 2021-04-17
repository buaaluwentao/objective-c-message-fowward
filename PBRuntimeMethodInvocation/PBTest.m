//
//  PBTest.m
//  PBRuntimeMethodInvocation
//
//  Created by wentao lu on 2021/4/17.
//

#import "PBTest.h"
#import <objc/runtime.h>
#import "PBPerson.h"
#import "PBNoMehtod.h"

NSString *name(id self, SEL sel) {
    return @"小刚";
}

@interface PBTest()
@property (nonatomic, strong) PBPerson *target;
@property (nonatomic, strong) PBNoMehtod *noMethod;
@end

@implementation PBTest

- (instancetype)init {
    if (self = [super init]) {
        _target = [[PBPerson alloc] init];
        _target.age = 18;
    }
    return self;
}

//1. 告诉编译器请勿生成实例变量、getName和setName方法
@dynamic name;
@dynamic age;
@dynamic home;

//动态方法解析
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == @selector(name)) {
        class_addMethod(self.class, sel, (IMP)name, "s@:");
        return YES;
    }

    return [super resolveInstanceMethod:sel];
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    if (aSelector == @selector(age)) {
        return _target;
    }
    
    return [super forwardingTargetForSelector:aSelector];
}

- (PBNoMehtod *)noMethod {
    if (!_noMethod) {
        _noMethod = [[PBNoMehtod alloc] init];
    }
    return _noMethod;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if (aSelector == @selector(home)) {
        return [self.noMethod methodSignatureForSelector:@selector(methodNotFounded)];
    }
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    if (anInvocation.selector == @selector(home)) {
        anInvocation.selector = @selector(methodNotFounded);
        [anInvocation invokeWithTarget:self.noMethod];
        return;
    }
    [super forwardInvocation:anInvocation];
}

- (void)noSelector {}

@end
