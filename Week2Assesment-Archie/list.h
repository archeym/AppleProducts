//
//  list.h
//  Week2Assesment-Archie
//
//  Created by NEXTAcademy on 3/27/17.
//  Copyright © 2017 NEXTKRG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface list : NSObject

@property (strong,nonatomic) NSString *name;

@property (strong,nonatomic) NSString *date;
@property (strong,nonatomic)  UIImage *picture;

- (id) initWithName : (NSString *) name withDate : (NSString *) date withPicture : (UIImage *) picture ;

@end
