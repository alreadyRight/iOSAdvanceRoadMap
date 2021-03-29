//
//  ViewController.m
//  NSURLSession学习-01
//
//  Created by 周冰烽 on 2021/3/27.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)sessionTest1 {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    configuration.requestCachePolicy = NSURLRequestReloadIgnoringCacheData;
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    NSString *urlStr = @"http://localhost:8080/API/Test";
    NSURLSessionTask *task = [session dataTaskWithURL:[NSURL URLWithString:urlStr] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *res = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@", res);
        NSLog(@"%@", response);
    }];
    [task resume];
    
}

- (void)sessionTest2 {
    NSString *urlStr = @"http://localhost:8080/API/Test";
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
//    request.cachePolicy = NSURLRequestReloadIgnoringCacheData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self sessionTest1];
    
}


@end
