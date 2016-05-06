//
//  number.m
//  LCDClock
//
//  Created by Vladyslav Gusakov on 1/25/16.
//  Copyright © 2016 Vladyslav Gusakov. All rights reserved.
//

#import "Digit.h"

@implementation Digit
{
    double horSegWidth;// = 26.0;
    double horSegHeight;// = 15.0;
    double vertSegWidth;// = 14.0;
    double vertSegHeight;// = 30.0;
}

-(id) init {
    self = [super init];
    if (self) {
        
        if (self.scale == 0) {
            self.scale = 1;
        }
        
        horSegWidth = 26.0;
        horSegHeight = 15.0;
        vertSegWidth = 14.0;
        vertSegHeight = 30.0;
        
        self.segment1 = [[UIImageView alloc] initWithFrame:CGRectMake(self.scale * 11, self.scale * 0, self.scale * horSegWidth, self.scale * horSegHeight)];
        self.segment1.image = [UIImage imageNamed:@"horizontalSegment.png"];
        self.segment1.backgroundColor = [UIColor clearColor];
        self.segment1.image = [self.segment1.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];


        self.segment2 = [[UIImageView alloc] initWithFrame:CGRectMake(self.scale * 1, self.scale * 8, self.scale * vertSegWidth, self.scale * vertSegHeight)];
        self.segment2.image = [UIImage imageNamed:@"verticalSegment.png"];
        self.segment2.backgroundColor = [UIColor clearColor];
        self.segment2.image = [self.segment2.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        
        self.segment3 = [[UIImageView alloc] initWithFrame:CGRectMake(self.scale * 32, self.scale * 8, self.scale * vertSegWidth, self.scale * vertSegHeight)];
        self.segment3.image = [UIImage imageNamed:@"verticalSegment.png"];
        self.segment3.backgroundColor = [UIColor clearColor];
        self.segment3.image = [self.segment3.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];

        
        self.segment4 = [[UIImageView alloc] initWithFrame:CGRectMake(self.scale * 10, self.scale * 32, self.scale * horSegWidth, self.scale * horSegHeight)];
        self.segment4.image = [UIImage imageNamed:@"horizontalSegment.png"];
        self.segment4.backgroundColor = [UIColor clearColor];
        self.segment4.image = [self.segment4.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];

        
        self.segment5 = [[UIImageView alloc] initWithFrame:CGRectMake(self.scale * 0, self.scale * 39, self.scale * vertSegWidth, self.scale * vertSegHeight)];
        self.segment5.image = [UIImage imageNamed:@"verticalSegment.png"];
        self.segment5.backgroundColor = [UIColor clearColor];
        self.segment5.image = [self.segment5.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];

        
        self.segment6 = [[UIImageView alloc] initWithFrame:CGRectMake(self.scale * 30, self.scale * 40, self.scale * vertSegWidth, self.scale * vertSegHeight)];
        self.segment6.image = [UIImage imageNamed:@"verticalSegment.png"];
        self.segment6.backgroundColor = [UIColor clearColor];
        self.segment6.image = [self.segment6.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];

        
        self.segment7 = [[UIImageView alloc] initWithFrame:CGRectMake(self.scale * 8, self.scale * 63, self.scale * horSegWidth, self.scale * horSegHeight)];
        self.segment7.image = [UIImage imageNamed:@"horizontalSegment.png"];
        self.segment7.backgroundColor = [UIColor clearColor];
        self.segment7.image = [self.segment7.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];

        [self setDigitTo:-1];
        
        self.segmentNum = [NSMutableArray arrayWithObjects: self.segment1, self.segment2, self.segment3, self.segment4, self.segment5, self.segment6, self.segment7, nil];
        
    }
    return self;
}

-(id) initWithScale: (double) scale {
    
    self.scale = scale;
    self = [self init];

    return self;
}

-(void) setDigitTo: (NSInteger) number{
    
    if (number < 0 || number > 10) {
        return;
    }
    
    switch (number) {
        case 1: {
            self.segment1.hidden = YES;
            self.segment2.hidden = YES;
            self.segment3.hidden = NO;
            self.segment4.hidden = YES;
            self.segment5.hidden = YES;
            self.segment6.hidden = NO;
            self.segment7.hidden = YES;
        }
            break;
            
        case 2: {
            self.segment1.hidden = NO;
            self.segment2.hidden = YES;
            self.segment3.hidden = NO;
            self.segment4.hidden = NO;
            self.segment5.hidden = NO;
            self.segment6.hidden = YES;
            self.segment7.hidden = NO;
        }
            break;
            
        case 3: {
            self.segment1.hidden = NO;
            self.segment2.hidden = YES;
            self.segment3.hidden = NO;
            self.segment4.hidden = NO;
            self.segment5.hidden = YES;
            self.segment6.hidden = NO;
            self.segment7.hidden = NO;
        }
            break;
            
        case 4: {
            self.segment1.hidden = YES;
            self.segment2.hidden = NO;
            self.segment3.hidden = NO;
            self.segment4.hidden = NO;
            self.segment5.hidden = YES;
            self.segment6.hidden = NO;
            self.segment7.hidden = YES;
        }
            break;
            
        case 5: {
            self.segment1.hidden = NO;
            self.segment2.hidden = NO;
            self.segment3.hidden = YES;
            self.segment4.hidden = NO;
            self.segment5.hidden = YES;
            self.segment6.hidden = NO;
            self.segment7.hidden = NO;
        }
            break;
            
        case 6: {
            self.segment1.hidden = NO;
            self.segment2.hidden = NO;
            self.segment3.hidden = YES;
            self.segment4.hidden = NO;
            self.segment5.hidden = NO;
            self.segment6.hidden = NO;
            self.segment7.hidden = NO;
        }
            break;
            
        case 7: {
            self.segment1.hidden = NO;
            self.segment2.hidden = YES;
            self.segment3.hidden = NO;
            self.segment4.hidden = YES;
            self.segment5.hidden = YES;
            self.segment6.hidden = NO;
            self.segment7.hidden = YES;
        }
            break;
            
        case 8: {
            self.segment1.hidden = NO;
            self.segment2.hidden = NO;
            self.segment3.hidden = NO;
            self.segment4.hidden = NO;
            self.segment5.hidden = NO;
            self.segment6.hidden = NO;
            self.segment7.hidden = NO;
        }
            break;
            
        case 9: {
            self.segment1.hidden = NO;
            self.segment2.hidden = NO;
            self.segment3.hidden = NO;
            self.segment4.hidden = NO;
            self.segment5.hidden = YES;
            self.segment6.hidden = NO;
            self.segment7.hidden = NO;
        }
            break;
            
        case 0: {
            self.segment1.hidden = NO;
            self.segment2.hidden = NO;
            self.segment3.hidden = NO;
            self.segment4.hidden = YES;
            self.segment5.hidden = NO;
            self.segment6.hidden = NO;
            self.segment7.hidden = NO;
        }
            break;
            
        case -1: {
            self.segment1.hidden = YES;
            self.segment2.hidden = YES;
            self.segment3.hidden = YES;
            self.segment4.hidden = YES;
            self.segment5.hidden = YES;
            self.segment6.hidden = YES;
            self.segment7.hidden = YES;
        }
            break;

            
        default:
            break;
    }
    
}

@end
