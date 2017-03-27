//
//  ListViewController.m
//  Week2Assesment-Archie
//
//  Created by NEXTAcademy on 3/27/17.
//  Copyright © 2017 NEXTKRG. All rights reserved.
//

#import "ListViewController.h"

@interface ListViewController () <SFSafariViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editBarButton;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextField *lunchDate;
@property (weak, nonatomic) IBOutlet UITextField *editName;


@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitle:self.selectedItem.name];
  
    self.editName.userInteractionEnabled = NO;
    self.lunchDate.userInteractionEnabled = NO;
    self.editName.hidden = YES;
    
    [self.imageView setImage:self.selectedItem.picture];
    [self.editName setText:self.selectedItem.name];
    [self.lunchDate setText:self.selectedItem.date];
}

- (IBAction)openSafari:(id)sender {
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"https://apple.com"]];
    
    if ([SFSafariViewController class] != nil) {
        SFSafariViewController *sfvc = [[SFSafariViewController alloc] initWithURL:URL];
        [self presentViewController:sfvc animated:YES completion:nil];
    } else {
        [[UIApplication sharedApplication] openURL:URL options:@{} completionHandler:nil];
    }
}
- (IBAction)changeTitle:(id)sender {
    NSString *newTitle = self.editName.text;
    if(self.delegate){
        [self.delegate useDelegate:newTitle];
    }
}
- (IBAction)edit:(id)sender {
    self.editBarButton.title = @"Done";
    if(!(self.editName.userInteractionEnabled)){
        self.editName.hidden = NO;
        self.editName.userInteractionEnabled = YES;
        self.lunchDate.userInteractionEnabled = YES;
    }else{
      
        self.editName.hidden = YES;
        self.editName.userInteractionEnabled =NO;
        self.selectedItem.name = self.editName.text;
        self.selectedItem.date = self.lunchDate.text;
        self.editBarButton.title = @"Edit";
        [self setTitle:self.selectedItem.name];
    }
}
@end
