//
//  mineViewController.m
//  内涵段子
//
//  Created by app on 17/4/24.
//  Copyright © 2017年 mine. All rights reserved.
//

#import "mineViewController.h"
#import "UIImage+WebP.h"

@interface mineViewController ()

@end

@implementation mineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我的";
    UIImageView *image =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, applicationWidth, applicationHeight)];
   // image.image=
    [self.view addSubview:image];
    NSString *useHeadString = @"http://p3.pstatp.com/w720/1cd10000f8bcc6aa9f01.webp";
    /**
     *  将图片网址取出来，并且转化为图片，由第三方哭完成
     */
    
    
    
//UIImage *img=[UIImage sd_imageWithWebPData:]
    
    [image sd_setImageWithURL:[NSURL URLWithString:useHeadString]];
//    [image sd_setImageWithURL:[NSURL URLWithString:useHeadString]forState:UIControlStateNormal placeholderImage:nil];
    
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
