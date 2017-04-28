//
//  duanziDetialViewController.m
//  内涵段子
//
//  Created by app on 17/4/24.
//  Copyright © 2017年 mine. All rights reserved.
//

#import "duanziDetialViewController.h"
#import "UIButton+WebCache.h"

@interface duanziDetialViewController ()

@end

@implementation duanziDetialViewController

- (void)viewDidLoad {
    self.navigationController.navigationBar.hidden=NO;

    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    [self initUI];
    [self chuanzhi];
}
- (void)chuanzhi{
    
    UILabel *useName = [self.view viewWithTag:98007];
    useName.text =[self.mode.user objectForKey:@"name"];
   
    UIButton *headBtn = [self.view viewWithTag:666];
    NSString *useHeadString = [self.mode.user objectForKey:@"avatar_url"];
    /**
     *  将图片网址取出来，并且转化为图片，由第三方哭完成
     */
    [headBtn sd_setImageWithURL:[NSURL URLWithString:useHeadString]forState:UIControlStateNormal placeholderImage:nil];
   
    
    UILabel *textLab = [self.view viewWithTag:9527];
        textLab.text = self.mode.text;
    
    UILabel *commends = [self.view viewWithTag:9528];
    commends.text = self.mode.comments;
    
        
   
    
}
- (void)initUI{
    // Do any additional setup after loading the view.
    /**
     创建用户的 ID
     */
    UILabel *useID = [[UILabel alloc]initWithFrame:CGRectMake(applicationWidth/6, 64, applicationWidth/2, applicationHeight/20)];
    [self.view addSubview:useID];
    useID.text = @"我的名义";
    useID.tag = 98007;
   // useID.textColor = [UIColor redColor];
    
    /**
     创建头像，的按钮，并设置tag
     */
    UIButton *headBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 64, applicationWidth/10, applicationWidth/10)];
    headBtn.tag=666;
    //headBtn.backgroundColor = [UIColor grayColor];
    headBtn.layer.cornerRadius = applicationWidth/20 ;
    headBtn.clipsToBounds = YES;
    [self.view addSubview:headBtn];
    UILabel *duanziDetilLab = [[UILabel alloc]initWithFrame:CGRectMake(10, applicationHeight/13, applicationWidth-20, applicationHeight/2.4)];
    duanziDetilLab.tag = 9527;
    duanziDetilLab.numberOfLines=0;
    //duanziDetilLab.backgroundColor =  [UIColor yellowColor];
    [self.view addSubview:duanziDetilLab];
    /**
     *   评论的lab
     */
    UILabel *pingluHeader = [[UILabel alloc]initWithFrame:CGRectMake(10, applicationHeight/13+applicationHeight/2.4, applicationWidth-20, 1)];
    pingluHeader.backgroundColor = [UIColor grayColor];
    [self.view addSubview:pingluHeader];
    UILabel *pinglunDetilLab = [[UILabel alloc]initWithFrame:CGRectMake(10, applicationHeight/13+applicationHeight/2.4, applicationWidth-20, applicationHeight/2.4/4.2)];
    pinglunDetilLab.tag = 9528;
    pinglunDetilLab.numberOfLines=0;
   // pinglunDetilLab.backgroundColor =  [UIColor redColor];
    [self.view addSubview:pinglunDetilLab];
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
