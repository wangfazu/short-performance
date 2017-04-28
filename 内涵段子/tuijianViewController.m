
//
//  tuijianViewController.m
//  内涵段子
//
//  Created by app on 17/4/24.
//  Copyright © 2017年 mine. All rights reserved.
//

#import "tuijianViewController.h"
#import "UIButton+WebCache.h"
#import "duanziDetialViewController.h"
@interface tuijianViewController ()

@end

@implementation tuijianViewController
{
    UIScrollView *titleScroll;
    UIScrollView *mainScroll;
    
    UITableView *duanziTableView;
    UITableView *videoTableView;
    UITableView *tempTbv;;
    UIWebView *jinhuaweb;
    
    NSDictionary *jsonObject;
    NSMutableArray *modalArr;
    NSMutableArray *modalArrVideo;
}
- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden=YES;
    
    self.tabBarController.tabBar.hidden=NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self initDataSoure];
}

- (void)initUI{
    self.title = @"推荐";
    
    /**
     初始化titleScroll
     */
    self.view.backgroundColor = [UIColor colorWithRed:212 green:210 blue:195 alpha:1];
    titleScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, applicationWidth, applicationHeight/10+24)];
    titleScroll.backgroundColor = [UIColor colorWithRed:212 green:210 blue:195 alpha:1];
    titleScroll.delegate=self;
    titleScroll.contentSize = CGSizeMake(2*applicationWidth, applicationHeight/10);
    [self.view addSubview:titleScroll];
    /**
     *  时scroll不在自由移动，会根据导航偏移
     */
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    /**
     测试lab
     */
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, applicationHeight/10, applicationHeight/10)];
    //lab.backgroundColor= [UIColor grayColor];
    [titleScroll addSubview:lab];
     NSArray *aarry = @[@"关注",@"推荐",@"视频",@"段友秀",@"直播",@"图片",@"精华",@"段子",@"游戏",@"同城"];
    for (int i = 0; i<10; i++) {
       

        /**
        
         */
        UIButton *btttn = [[UIButton alloc]initWithFrame:CGRectMake(14+applicationWidth/5*i,40, applicationHeight/10, applicationHeight/10-16)];
       // btttn.backgroundColor = [UIColor greenColor];
        btttn.tag=100+i;
        [btttn setTitle:aarry[i] forState:normal];
        //colorWithRed:86 green:57 blue:53 alpha:1
        [btttn setTitleColor:[UIColor brownColor]forState:UIControlStateNormal];
        [btttn addTarget:self action:@selector(btttnClick:) forControlEvents:UIControlEventTouchUpInside];
        [titleScroll addSubview:btttn];
    }
    /**
     *  初始化
     *
     *  @return mainScroll
     */
    mainScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 24+applicationHeight/10, applicationWidth, applicationHeight)];
    mainScroll.backgroundColor = [UIColor purpleColor];
    mainScroll.delegate=self;
    mainScroll.contentSize = CGSizeMake(10*applicationWidth, applicationHeight);
    [self.view addSubview:mainScroll];
    /**
     创建+个 Button 便于区分，当前所在的位置
     */
        for (int i = 0; i<10; i++) {

        
        UIButton *btttn = [[UIButton alloc]initWithFrame:CGRectMake(14+applicationWidth*i, 0, applicationHeight/10, applicationHeight/10)];
        btttn.backgroundColor = [UIColor greenColor];
        btttn.tag=100+i;
        [btttn setTitle:[NSString stringWithFormat:@"%d",i] forState:normal];
        [mainScroll addSubview:btttn];
    }
    /**
     *  初始化duanziTableView
     *
     *  @return duanziTable
     */
    duanziTableView = [[UITableView alloc]initWithFrame:CGRectMake(applicationWidth*0, -30, applicationWidth, applicationHeight) style:UITableViewStyleGrouped];
    duanziTableView.delegate = self;
    duanziTableView.dataSource = self;
    [mainScroll addSubview:duanziTableView];
    /**
     初始化videoTable
     
     - returns: videoTableView
     */
    videoTableView = [[UITableView alloc]initWithFrame:CGRectMake(applicationWidth*2, -30, applicationWidth, applicationHeight) style:UITableViewStyleGrouped];
    videoTableView.delegate = self;
    videoTableView.dataSource = self;
//    videoTableView.backgroundColor=[UIColor redColor];
    [mainScroll addSubview:videoTableView];
    
    tempTbv=duanziTableView;
    /**
      初始化Web
     http://ic.snssdk.com/neihan/in_app/essence_list/
     - returns: 0
     */
    jinhuaweb=[[UIWebView alloc]initWithFrame:CGRectMake(applicationWidth*6, 0, applicationWidth, applicationHeight)];
    
   
    

}
- (void)initDataSoure{
    if (tempTbv ==  videoTableView) {
        
        modalArrVideo =[[NSMutableArray alloc]init];
//
        
        
        NSString *urlString=@"http://is.snssdk.com/neihan/stream/mix/v1/?mpic=1&webp=1&essence=1&content_type=-301&message_cursor=172612414&longitude=104.0529799931991&latitude=30.67145876122725&am_longitude=104.046214&am_latitude=30.665236&am_city=%E6%88%90%E9%83%BD%E5%B8%82&am_loc_time=1493190508070&count=30&min_time=1493191024&screen_width=720&double_col_mode=1&local_request_tag=1493191065557&iid=9745691586&device_id=33296995383&ac=wifi&channel=xiaomi&aid=7&app_name=joke_essay&version_code=618&version_name=6.1.8&device_platform=android&ssmix=a&device_type=MI+2S&device_brand=Xiaomi&os_api=21&os_version=5.0.2&uuid=860312022887598&openudid=3273fb078370d27e&manifest_version_code=618&resolution=720*1280&dpi=320&update_version_code=6184";
        /**
         *  对网址转码
         *
         *  @param NSString 。
         *
         *  @return 。
         */
        NSString * encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes( kCFAllocatorDefault, (CFStringRef)urlString, NULL, NULL,  kCFStringEncodingUTF8 ));
        [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:encodedString]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
            NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            
            
            NSData *aJsonData = [responseString dataUsingEncoding:NSUTF8StringEncoding];
            
            NSError *error = nil;
            jsonObject = [NSJSONSerialization JSONObjectWithData:aJsonData
                                                         options:NSJSONReadingMutableContainers
                          
                          
                                                           error:&error];
            // NSArray *arrcc = [jsonObject objectForKey:@"statuses"];
            NSArray *dataArr = [[jsonObject objectForKey:@"data"] objectForKey:@"data"];
            
            
            //[modalArr removeAllObjects];
            for (int i=0; i<dataArr.count; i++) {
                NSDictionary *dic=dataArr[i];
                
                dataMode *mode=[[dataMode alloc]init];
                
                NSArray *arr=dic[@"comments"];
                if (arr!=nil && [arr isKindOfClass:[NSArray class]] && arr.count>0) {
                    
                    NSDictionary *adic = [arr objectAtIndex:0];
                    NSString *str = [adic objectForKey:@"text"];
                    mode.comments=str;
                    
                    
                }
                mode.text=[dic[@"group"] objectForKey:@"text"];
                mode.group=dic[@"group"];
                mode.user=[dic[@"group"] objectForKey:@"user"];
                mode.mp4_url=[dic[@"group"] objectForKey:@"mp4_url"];
                
                
                NSLog(@"------------%@",[dic[@"group"] objectForKey:@"mp4_url"]);
                //    [modalArr removeObjectAtIndex:4];
                
                [modalArrVideo addObject:mode];
                //            if (dic[@"group"]==nil) {
                //                [modalArr removeLastObject ];
                //            }
                //             NSLog(@"%@ ",modalArr[i]);
            }
            
            
            
            
            /**
             *  获取用户
             */
            NSLog(@"name-----%@",[[[[[jsonObject objectForKey:@"data"]  objectForKey:@"data"][0] objectForKey:@"group"] objectForKey:@"user"] objectForKey:@"name"]);
            
            // weiboDetilString = [[jsonObject objectForKey:@"statuses"][0]  objectForKey:@"text"];
//            NSLog(@"%@",[jsonObject objectForKey:@"statuses"][0]); 
//            [duanziTableView reloadData];
            [videoTableView reloadData];
            
            
        }];

    }else{
        modalArr = [[NSMutableArray alloc]init];
        
        NSString *urlString=@"http://iu.snssdk.com/neihan/stream/mix/v1/?mpic=1&webp=1&essence=1&content_type=-102&message_cursor=172612414&longitude=104.05298677906215&latitude=30.67146577477534&am_longitude=104.046223&am_latitude=30.665236&am_city=成都市&am_loc_time=1493020804290&count=30&screen_width=720&double_col_mode=0&local_request_tag=1493020962112&iid=9745691586&device_id=33296995383&ac=wifi&channel=xiaomi&aid=7&app_name=joke_essay&version_code=618&version_name=6.1.8&device_platform=android&ssmix=a&device_type=MI+2S&device_brand=Xiaomi&os_api=21&os_version=5.0.2&uuid=860312022887598&openudid=3273fb078370d27e&manifest_version_code=618&resolution=720*1280&dpi=320&update_version_code=6184";
        /**
         *  对网址转码
         *
         *  @param NSString 。
         *
         *  @return 。
         */
        NSString * encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes( kCFAllocatorDefault, (CFStringRef)urlString, NULL, NULL,  kCFStringEncodingUTF8 ));
        [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:encodedString]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
            NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            
            
            NSData *aJsonData = [responseString dataUsingEncoding:NSUTF8StringEncoding];
            
            NSError *error = nil;
            jsonObject = [NSJSONSerialization JSONObjectWithData:aJsonData
                                                         options:NSJSONReadingMutableContainers
                          
                          
                                                           error:&error];
            // NSArray *arrcc = [jsonObject objectForKey:@"statuses"];
            NSArray *dataArr = [[jsonObject objectForKey:@"data"] objectForKey:@"data"];
            
            
            //[modalArr removeAllObjects];
            for (int i=0; i<dataArr.count; i++) {
                NSDictionary *dic=dataArr[i];
                
                dataMode *mode=[[dataMode alloc]init];
                
                NSArray *arr=dic[@"comments"];
                if (arr!=nil && [arr isKindOfClass:[NSArray class]] && arr.count>0) {
                    
                    NSDictionary *adic = [arr objectAtIndex:0];
                    NSString *str = [adic objectForKey:@"text"];
                    mode.comments=str;
                    
                    
                }
                mode.text=[dic[@"group"] objectForKey:@"text"];
                mode.group=dic[@"group"];
                mode.user=[dic[@"group"] objectForKey:@"user"];
                //    [modalArr removeObjectAtIndex:4];
                
                [modalArr addObject:mode];
                //            if (dic[@"group"]==nil) {
                //                [modalArr removeLastObject ];
                //            }
                //             NSLog(@"%@ ",modalArr[i]);
            }
            
            
            
            
            /**
             *  获取用户
             */
            NSLog(@"name-----%@",[[[[[jsonObject objectForKey:@"data"]  objectForKey:@"data"][0] objectForKey:@"group"] objectForKey:@"user"] objectForKey:@"name"]);
            
            // weiboDetilString = [[jsonObject objectForKey:@"statuses"][0]  objectForKey:@"text"];
            NSLog(@"%@",[jsonObject objectForKey:@"statuses"][0]);
            [duanziTableView reloadData];
            //        [videoTableView reloadData];
            
            
        }];
        

    }
    
    //加载网页http://ic.snssdk.com/neihan/in_app/essence_list/"
    NSURL *url=[NSURL URLWithString:@"http://www.baidu.com"];
    
    NSURLRequest *req=[NSURLRequest requestWithURL:url];
    [jinhuaweb loadRequest:req];
    
    [mainScroll addSubview:jinhuaweb];

    NSLog(@"finish to refrsh!!!");


}
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (duanziTableView) {
        return modalArr.count;
    }
    return modalArrVideo.count;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == duanziTableView) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];

        if (cell==nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            
            /**
             创建用户的 ID
             */
            UILabel *useID = [[UILabel alloc]initWithFrame:CGRectMake(applicationWidth/6, 10, applicationWidth/2, applicationHeight/20)];
            [cell addSubview:useID];
            useID.text = @"我的名义";
            useID.tag = 98007;
            useID.textColor = [UIColor redColor];
            /**
             *  通过for循环创建三个按钮 =》 点赞，评论，转发
             */
            for (int i=0; i<3; i++) {
                myBtn *goodSendCommentBtn = [[myBtn alloc]initWithFrame:CGRectMake(i*applicationWidth/3.5+55, applicationHeight*3/5, 55, 38)];
                //goodSendCommentBtn.backgroundColor = [UIColor orangeColor];
                
                goodSendCommentBtn.tag = 333+i;
                goodSendCommentBtn.index = indexPath.row ;;
                [goodSendCommentBtn addTarget:self action:@selector(goodSendCommentBtnClick:) forControlEvents:UIControlEventTouchUpInside];
                [cell addSubview:goodSendCommentBtn];
            }
            /**
             创建头像，的按钮，并设置tag
             */
            UIButton *headBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, applicationWidth/10, applicationWidth/10)];
            headBtn.tag=666;
            //headBtn.backgroundColor = [UIColor grayColor];
            headBtn.layer.cornerRadius = applicationWidth/20 ;
            headBtn.clipsToBounds = YES;
            [cell addSubview:headBtn];
            UILabel *duanziDetilLab = [[UILabel alloc]initWithFrame:CGRectMake(10, applicationHeight/13, applicationWidth-20, applicationHeight/2.4)];
            duanziDetilLab.tag = 9527;
            duanziDetilLab.numberOfLines=0;
            //duanziDetilLab.backgroundColor =  [UIColor yellowColor];
            [cell addSubview:duanziDetilLab];
            /**
             *   评论的lab
             */
            UILabel *pingluHeader = [[UILabel alloc]initWithFrame:CGRectMake(10, applicationHeight/9+applicationHeight/2.5, applicationWidth-20, 1)];
            pingluHeader.backgroundColor = [UIColor grayColor];
            [cell addSubview:pingluHeader];
            UILabel *pinglunDetilLab = [[UILabel alloc]initWithFrame:CGRectMake(10, applicationHeight/13+applicationHeight/2.4, applicationWidth-20, applicationHeight/2.4/4.2)];
            pinglunDetilLab.tag = 9528;
            pinglunDetilLab.numberOfLines=0;
            //pinglunDetilLab.backgroundColor =  [UIColor redColor];
            [cell addSubview:pinglunDetilLab];
            
            
        }
        
        dataMode *mode = modalArr[indexPath.row];
        UILabel *name = [cell viewWithTag:98007];
        name.text = [mode.user objectForKey:@"name"];
        NSString *st=[mode.user objectForKey:@"name"];
        
        NSLog(@"%ld",indexPath.row);
        UIButton *headBtn = [cell viewWithTag:666];
        NSString *useHeadString = [mode.user objectForKey:@"avatar_url"];
        //headBtn sd_setImageWithURL:<#(NSURL *)#> forState:<#(UIControlState)#>
        /**
         *  将图片网址取出来，并且转化为图片，由第三方哭完成
         */
        [headBtn sd_setImageWithURL:[NSURL URLWithString:useHeadString]forState:UIControlStateNormal placeholderImage:nil];
        UILabel *duanziDetilLab = [cell viewWithTag:9527];
        duanziDetilLab.text = mode.text;
        
        UILabel *godComments = [cell viewWithTag:(9528)];
        godComments.text =mode.comments;
        
        UIButton * goodSendCommentBtn1 =[cell viewWithTag:333] ;
        UIImage *goodImage = [UIImage imageNamed:@"点赞"];
        [goodSendCommentBtn1 setImage:goodImage forState:normal];
        
        UIButton * goodSendCommentBtn2 =[cell viewWithTag:334] ;
        UIImage *pinglun = [UIImage imageNamed:@"评论"];
        [goodSendCommentBtn2 setImage:pinglun forState:normal];
        
        UIButton * goodSendCommentBtn3 =[cell viewWithTag:335] ;
        UIImage *zhuanfaBtn = [UIImage imageNamed:@"转发"];
        [goodSendCommentBtn3 setImage:zhuanfaBtn forState:normal];
        
        cell.selectionStyle = UITableViewCellStyleDefault;
        return  cell;
    }
    else{
        UITableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:@"cell2"];

        if (cell2==nil) {
            cell2 = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell2"];
            
            /**
             创建用户的 ID
             */
            UILabel *useID = [[UILabel alloc]initWithFrame:CGRectMake(applicationWidth/6, 10, applicationWidth/2, applicationHeight/20)];
            [cell2 addSubview:useID];
            useID.text = @"我的名义";
            useID.tag = 198007;
            useID.textColor = [UIColor redColor];
            /**
             *  通过for循环创建三个按钮 =》 点赞，评论，转发
             */
            for (int i=0; i<3; i++) {
                myBtn *goodSendCommentBtn = [[myBtn alloc]initWithFrame:CGRectMake(i*applicationWidth/3.5+55, applicationHeight*3/5, 55, 38)];
                //goodSendCommentBtn.backgroundColor = [UIColor orangeColor];
                
                goodSendCommentBtn.tag = 1333+i;
                goodSendCommentBtn.index = indexPath.row ;;
                [goodSendCommentBtn addTarget:self action:@selector(goodSendCommentBtnClick:) forControlEvents:UIControlEventTouchUpInside];
                [cell2 addSubview:goodSendCommentBtn];
            }
            /**
             创建头像，的按钮，并设置tag
             */
            UIButton *headBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, applicationWidth/10, applicationWidth/10)];
            headBtn.tag=1666;
            //headBtn.backgroundColor = [UIColor grayColor];
            headBtn.layer.cornerRadius = applicationWidth/20 ;
            headBtn.clipsToBounds = YES;
            [cell2 addSubview:headBtn];
            UILabel *videoTitle = [[UILabel alloc]initWithFrame:CGRectMake(10, applicationHeight/13, applicationWidth-20, applicationWidth/11)];
            videoTitle.tag = 88888;
            videoTitle.numberOfLines=0;
            [cell2 addSubview:videoTitle];

            UIWebView *videoWeb = [[UIWebView alloc]initWithFrame:CGRectMake(10, applicationHeight/8, applicationWidth-20, applicationHeight/2.5)];
            videoWeb.tag = 19527;
            [cell2 addSubview:videoWeb];
            /**
             *   评论的lab
             */
            UILabel *pingluHeader = [[UILabel alloc]initWithFrame:CGRectMake(10, applicationHeight/13+applicationHeight/2.4+20, applicationWidth-23, 1)];
            pingluHeader.backgroundColor = [UIColor grayColor];
            [cell2 addSubview:pingluHeader];
            UILabel *pinglunDetilLab = [[UILabel alloc]initWithFrame:CGRectMake(10, applicationHeight/13+applicationHeight/2.4+20, applicationWidth-20, applicationHeight/2.4/4.5)];
            pinglunDetilLab.tag = 19528;
            pinglunDetilLab.numberOfLines=0;
           // pinglunDetilLab.backgroundColor =  [UIColor redColor];
            [cell2 addSubview:pinglunDetilLab];
            
            UIButton * goodSendCommentBtn1 =[cell2 viewWithTag:1333] ;
            UIImage *goodImage = [UIImage imageNamed:@"点赞"];
            [goodSendCommentBtn1 setImage:goodImage forState:normal];
            
            UIButton * goodSendCommentBtn2 =[cell2 viewWithTag:1334] ;
            UIImage *pinglun = [UIImage imageNamed:@"评论"];
            [goodSendCommentBtn2 setImage:pinglun forState:normal];
            
            UIButton * goodSendCommentBtn3 =[cell2 viewWithTag:1335] ;
            UIImage *zhuanfaBtn = [UIImage imageNamed:@"转发"];
            [goodSendCommentBtn3 setImage:zhuanfaBtn forState:normal];

            
           
            
            
            
        }
        
        dataMode *mode = modalArrVideo[indexPath.row];
        UILabel *name = [cell2 viewWithTag:198007];
        name.text = [mode.user objectForKey:@"name"];
        //NSString *st=[mode.user objectForKey:@"name"];
        
        NSLog(@"%ld",indexPath.row);
        UIButton *headBtn = [cell2 viewWithTag:1666];
        NSString *useHeadString = [mode.user objectForKey:@"avatar_url"];
        //headBtn sd_setImageWithURL:<#(NSURL *)#> forState:<#(UIControlState)#>
        /**
         *  将图片网址取出来，并且转化为图片，由第三方哭完成
         */
        [headBtn sd_setImageWithURL:[NSURL URLWithString:useHeadString]forState:UIControlStateNormal placeholderImage:nil];
      
        
        UILabel *godComments = [cell2 viewWithTag:(19528)];
        godComments.text =mode.comments;
        
        UILabel *textLab = [cell2 viewWithTag:88888];
        textLab.text = mode.text;
        //textLab.backgroundColor = [UIColor redColor];
        
        UIWebView *videoWeb = [cell2 viewWithTag:19527];
        //videoWeb.backgroundColor = [UIColor purpleColor];
        NSString *webString = mode.mp4_url;
        //加载网页
        NSURL *url=[NSURL URLWithString:webString];
        NSURLRequest *req=[NSURLRequest requestWithURL:url];
        [videoWeb loadRequest:req];
        
        cell2.selectionStyle = UITableViewCellStyleDefault;
        return  cell2;
        
        
        
    }

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return applicationHeight*2/3;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return applicationHeight/6;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView==duanziTableView) {
        duanziDetialViewController *duanziDetail = [[duanziDetialViewController alloc]init];
        duanziDetail.mode = modalArr[indexPath.row];
        [self.navigationController pushViewController:duanziDetail animated:YES];
    }
   
}
- (void)btttnClick:(UIButton *)btn{
    
    [UIView animateWithDuration:0.75 animations:^{
        /**
         *  通过button的 tag 来控制所要现实的当前页面
         
         
         */
        switch (btn.tag) {
            case 100:
                mainScroll.contentOffset = CGPointMake(applicationWidth*0, 0);
                break;
            case 101:
                mainScroll.contentOffset = CGPointMake(applicationWidth*1, 0);
                tempTbv=videoTableView;
                [self initDataSoure];
                break;
            case 102:
                mainScroll.contentOffset = CGPointMake(applicationWidth*2, 0);
                break;
            case 103:
                mainScroll.contentOffset = CGPointMake(applicationWidth*3, 0);
                break;
            case 104:
                mainScroll.contentOffset = CGPointMake(applicationWidth*4, 0);
                break;
            case 105:
                mainScroll.contentOffset = CGPointMake(applicationWidth*5, 0);
                break;
            case 106:
                mainScroll.contentOffset = CGPointMake(applicationWidth*6, 0);
                break;
            case 107:
                mainScroll.contentOffset = CGPointMake(applicationWidth*7, 0);
                break;
            case 108:
                mainScroll.contentOffset = CGPointMake(applicationWidth*8, 0);
                break;
            case 109:
                mainScroll.contentOffset = CGPointMake(applicationWidth*9, 0);
                break;
                
                
            default:
                break;
        }
    }];
    
}
- (void)goodSendCommentBtnClick:(UIButton *)btn{
   
    
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
