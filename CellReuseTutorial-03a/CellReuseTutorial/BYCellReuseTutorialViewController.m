//
//  BYCellReuseTutorialViewController.m
//  CellReuseTutorial
//
//  Created by yassine benabbas on 24/08/2014.
//  Copyright (c) 2014 org.yostane.ios.tutorial. All rights reserved.
//

#import "BYCellReuseTutorialViewController.h"
#import "BYCellReuseTutorialTableViewCell.h"
#import "ASIHTTPRequest.h"

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
        
        NSString *localPath = [[self applicationDocumentsDirectory] stringByAppendingPathComponent:name];
        UIImage *image = [[UIImage alloc] initWithContentsOfFile:localPath];
        if(image){
            dispatch_async(dispatch_get_main_queue(), ^{
                //set the image in the main thread
                if([cell.titleLabel.text isEqualToString:name]){
                    NSLog(@"Image loaded from disk");
                    cell.iconImageView.image = image;
                }
            });
        }else{
            ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
            request.downloadDestinationPath = localPath;
            NSLog(@"Downloading image");
            [request startSynchronous];
            
            if(request.responseStatusCode == 200){
                if([cell.titleLabel.text isEqualToString:name]){
                    //Load the thumbnail if the cell is still visible
                    UIImage *image = [[UIImage alloc] initWithContentsOfFile:localPath];
                    if(image){
                        dispatch_async(dispatch_get_main_queue(), ^{
                            //set the image in the main thread
                            if([cell.titleLabel.text isEqualToString:name]){
                                NSLog(@"Image downloaded and loaded from disk");
                                cell.iconImageView.image = image;
                            }
                        });
                    }
                }
            }
        }
    });
    
    return cell;
}

- (NSString *)applicationDocumentsDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    return basePath;
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
