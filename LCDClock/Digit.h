//
//  number.h
//  LCDClock
//
//  Created by Vladyslav Gusakov on 1/25/16.
//  Copyright © 2016 Vladyslav Gusakov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"
@interface Digit : NSObject


@property (nonatomic) UIImageView *segment1;
@property (nonatomic) UIImageView *segment2;
@property (nonatomic) UIImageView *segment3;
@property (nonatomic) UIImageView *segment4;
@property (nonatomic) UIImageView *segment5;
@property (nonatomic) UIImageView *segment6;
@property (nonatomic) UIImageView *segment7;
@property (nonatomic) double scale;

@property (nonatomic) NSMutableArray *segmentNum;

-(void) setDigitTo: (NSInteger) number;
-(id) init;
-(id) initWithScale: (double) scale;


@end
