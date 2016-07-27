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
    [self.tableView registerNib:[UINib nibWithNibName:@"BYCellReuseTutorialTableViewCell" bundle:nil] forCellReuseIdentifier:@"BYCellReuseTutorialTableViewCell"];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BYCellReuseTutorialTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BYCellReuseTutorialTableViewCell"];
    
    NSString *name = [NSString stringWithFormat:@"%03d.png", indexPath.row];
    
    cell.titleLabel.text =  name;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //execute the request in a background thread
        NSString *stringUrl = [baseUrl stringByAppendingString:name];
        NSURL  *url = [NSURL URLWithString:stringUrl];
        NSData *urlData = [NSData dataWithContentsOfURL:url];
        
        UIImage *image = [UIImage imageWithData:urlData];
        dispatch_async(dispatch_get_main_queue(), ^{
            //set the image in the main thread
            if([cell.titleLabel.text isEqualToString:name]){
                //we do not set the image if the cell has not been recycled to another item
                cell.iconImageView.image = image;
            }
        });
    });
    
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 167;
}

@end
