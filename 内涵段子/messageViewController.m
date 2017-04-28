
//
//  messageViewController.m
//  内涵段子
//
//  Created by app on 17/4/24.
//  Copyright © 2017年 mine. All rights reserved.
//

#import "messageViewController.h"

@interface messageViewController ()

@end

@implementation messageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    NSString *normalImg = [[NSBundle mainBundle] pathForResource:@"changmen1" ofType:@"png"];
//    
//    uint64_t fileSize = [[[NSFileManager defaultManager] attributesOfItemAtPath:normalImg error:nil] fileSize];
//    
//    
//    UIImage *demoImage = [UIImage imageNamed:@"changmen1.png"];
//    UIImageView *pngView = [[UIImageView alloc] initWithImage:demoImage];
//    pngView.frame = CGRectMake(0, 0, demoImage.size.width, demoImage.size.height);
//    
//    [self.view addSubview:pngView];
//    UILabel *pngLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(pngView.frame) + 5,300, 10)];
//    pngLabel.text = [NSString stringWithFormat:@"%@ format file size: %.2f KB ",[[normalImg pathExtension] uppercaseString],(double)fileSize / 1024];
//    [pngLabel setFont:[UIFont systemFontOfSize:12]];
//    [self.view addSubview:pngLabel];
//    
//    
//    _webPImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(pngView.frame) + 20,demoImage.size.width, demoImage.size.height)];
//    [self.view addSubview:_webPImageView];
//    
//    _webPLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_webPImageView.frame) + 5,300, 10)];
//    
//    [_webPLabel1 setFont:[UIFont systemFontOfSize:12]];
//    [self.view addSubview:_webPLabel1];
//    
//    
//    [UIImage imageToWebP:demoImage quality:75.0 alpha:1.0 preset:WEBP_PRESET_PHOTO completionBlock:^(NSData *result) {
//        [self displayImageWithData:result];
//        
//    } failureBlock:^(NSError *error) {
//        
//    }];
    
}
///**
// *  Description
// */- (void)displayImageWithData:(NSData *)webPData
//{
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *webPPath = [paths[0] stringByAppendingPathComponent:@"image.webp"];
//    if ([webPData writeToFile:webPPath atomically:YES]) {
//        [UIImage imageWithWebP:webPPath completionBlock:^(UIImage *result) {
//            uint64_t fileSize = [[[NSFileManager defaultManager] attributesOfItemAtPath:webPPath error:nil] fileSize];
//            
//            _webPLabel1.text = [NSString stringWithFormat:@"%@ format file size: %.2f KB ",[[webPPath pathExtension] uppercaseString],(double)fileSize / 1024];
//            [_webPImageView setImage:result];
//        } failureBlock:^(NSError *error) {
//            
//        }];
//    }
//    
//    
//}
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
