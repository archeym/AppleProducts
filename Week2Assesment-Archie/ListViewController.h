//
//  ListViewController.h
//  Week2Assesment-Archie
//
//  Created by NEXTAcademy on 3/27/17.
//  Copyright © 2017 NEXTKRG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "list.h"
@protocol productDelegate <NSObject>;
-(void)useDelegate:(NSString*) rootTitle;
@end

@import SafariServices;

@interface ListViewController : UIViewController
@property list *selectedItem;
@property(weak, nonatomic) id<productDelegate>delegate;
@end
