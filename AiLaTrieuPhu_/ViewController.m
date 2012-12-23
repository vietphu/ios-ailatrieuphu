//
//  ViewController.m
//  AiLaTrieuPhu_
//
//  Created by Phan Thanh Cong on 12/8/12.
//  Copyright (c) 2012 Phan Thanh Cong. All rights reserved.
//

#import "ViewController.h"
#import "ViewControllerPlay.h"

@interface ViewController ()

@end

@implementation ViewController

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
- (IBAction)playGame:(id)sender {
    ViewControllerPlay *play = [[ViewControllerPlay alloc] init];
    [self presentViewController:play animated:YES completion:nil];
    
}

@end
