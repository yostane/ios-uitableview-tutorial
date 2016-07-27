//
//  BYCellReuseTutorialViewController.m
//  CellReuseTutorial
//
//  Created by yassine benabbas on 24/08/2014.
//  Copyright (c) 2014 org.yostane.ios.tutorial. All rights reserved.
//

#import "BYCellReuseTutorialViewController.h"
#import "BYCellReuseTutorialTableViewCell.h"

NSString *baseUrl = @"http://yassine.benabbas.free.fr/tutoriel/cell_reuse_ios/thumbnails/";

@implementation BYCellReuseTutorialViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 167;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *cellViewController = [[UIViewController alloc] initWithNibName:@"BYCellReuseTutorialTableViewCell" bundle:nil];
    BYCellReuseTutorialTableViewCell *cell = (BYCellReuseTutorialTableViewCell *) cellViewController.view;
    
    NSString *name = [NSString stringWithFormat:@"%03d.png", indexPath.row];
    
    NSString *stringUrl = [baseUrl stringByAppendingString:name];
    NSURL  *url = [NSURL URLWithString:stringUrl];
    NSData *urlData = [NSData dataWithContentsOfURL:url];
    
    UIImage *image = [UIImage imageWithData:urlData];
    
    cell.iconImageView.image = image;
    cell.titleLabel.text =  name;
    
    return cell;
}

@end
