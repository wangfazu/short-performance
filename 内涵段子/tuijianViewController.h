//
//  tuijianViewController.h
//  内涵段子
//
//  Created by app on 17/4/24.
//  Copyright © 2017年 mine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dataMode.h"
typedef void(^returnString)(dataMode *mode);

@interface tuijianViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@property (nonatomic,copy) returnString  returnNameHeadCommend;
//@property (nonatomic,assign) dataMode *mode;//

@end
