//
//  ViewController.m
//  PBRuntimeMethodInvocation
//
//  Created by wentao lu on 2021/4/17.
//

#import "ViewController.h"
#import "PBTest.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    PBTest *test = [[PBTest alloc] init];
    NSLog(@"%@", [test name]);
    NSLog(@"%@", @([test age]));
    [test home];
    //    NSLog(@"%@");
//
}


@end
