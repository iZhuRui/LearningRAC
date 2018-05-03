//
//  ViewController.m
//  LearningRAC
//
//  Created by 朱锐 on 2018/5/3.
//  Copyright © 2018年 朱锐. All rights reserved.
//

#import "ViewController.h"

#import <ReactiveObjC/ReactiveObjC.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //RAC中最核心的类RACSignal
    
    RACSignal * signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        [subscriber sendNext:@"message"];
        
        [subscriber sendCompleted];
        
        return [RACDisposable disposableWithBlock:^{
            NSLog(@"信号销毁");
        }];
        
    }];
    
    [signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"接收到数据--%@",x);
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
