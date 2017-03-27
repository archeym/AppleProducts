//
//  list.m
//  Week2Assesment-Archie
//
//  Created by NEXTAcademy on 3/27/17.
//  Copyright © 2017 NEXTKRG. All rights reserved.
//

#import "list.h"

@implementation list


- (id) initWithName : (NSString *) name withDate : (NSString *) date withPicture : (UIImage *) picture{
    self = [super init];
    if (self){
        self.name = name;
        self.date = date;
        self.picture = picture;
    }
    return self;
}

@end
