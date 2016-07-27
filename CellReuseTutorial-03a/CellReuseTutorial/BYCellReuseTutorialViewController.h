//
//  BYCellReuseTutorialViewController.h
//  CellReuseTutorial
//
//  Created by yassine benabbas on 24/08/2014.
//  Copyright (c) 2014 org.yostane.ios.tutorial. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BYCellReuseTutorialViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
