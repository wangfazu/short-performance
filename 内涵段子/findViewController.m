
//
//  findViewController.m
//  内涵段子
//
//  Created by app on 17/4/24.
//  Copyright © 2017年 mine. All rights reserved.
//

#import "findViewController.h"

@interface findViewController ()

@end

@implementation findViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIWebView *web=[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, applicationWidth, applicationHeight)];
    
    
    //加载网页http://private73.miicool.xyz/htm_mob/7/1704/2371321.html
    NSURL *url=[NSURL URLWithString:@"http://www.baidu.com"];
    
    NSURLRequest *req=[NSURLRequest requestWithURL:url];
    [web loadRequest:req];
    
    [self.view addSubview:web];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
