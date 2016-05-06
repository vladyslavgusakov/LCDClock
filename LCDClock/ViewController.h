//
//  ViewController.h
//  LCDClock
//
//  Created by Vladyslav Gusakov on 1/25/16.
//  Copyright © 2016 Vladyslav Gusakov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Digit.h"

@interface ViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource, NSCoding> {
    NSInteger d1;
    NSInteger d2;
    NSInteger d3;
    NSInteger d4;
    NSInteger d5;
    NSInteger d6;
    
    NSDateFormatter *dateFormatter;
    
    Digit *digit1;
    Digit *digit2;
    Digit *digit3;
    Digit *digit4;
    Digit *digit5;
    Digit *digit6;
    
    NSString *dig1Str;
    NSString *dig2Str;
    NSString *dig3Str;
    NSString *dig4Str;
    NSString *dig5Str;
    NSString *dig6Str;
    
    NSInteger backgroundCounter;
    NSInteger digitsColorCounter;
    
    BOOL flag;
    BOOL isOn;
    
    NSArray *timeZoneArray;
    
    BOOL isSetAuto;
}

@property (strong, nonatomic) IBOutlet UIView *mainView;
@property (strong, nonatomic) IBOutlet UIImageView *separatorView;
@property (weak, nonatomic) IBOutlet UIView *digit1View;
@property (weak, nonatomic) IBOutlet UIView *digit2View;
@property (weak, nonatomic) IBOutlet UIView *digit3View;
@property (weak, nonatomic) IBOutlet UIView *digit4View;
@property (weak, nonatomic) IBOutlet UIImageView *amPmView;
@property (weak, nonatomic) IBOutlet UIView *digit5View;
@property (weak, nonatomic) IBOutlet UIView *digit6View;
@property (weak, nonatomic) IBOutlet UISwitch *enableButton;
@property (weak, nonatomic) IBOutlet UIPickerView *timeZonePickerView;
@property (weak, nonatomic) IBOutlet UISwitch *timeZoneAutoButton;
@property (weak, nonatomic) IBOutlet UIButton *currentTimeZone;
@property (weak, nonatomic) IBOutlet UIView *timeZoneSelectView;

@property (nonatomic) NSArray *backgroundColors;
@property (nonatomic)  NSMutableArray *digitsArr;
@property (nonatomic)  NSArray *digitsViewArr;

@property (nonatomic) NSString *timeZoneSelected;

-(void) setTime: (NSTimer *) timer;
-(void) changeDigitsColor;
-(void) createDigit: (Digit *) digit forView: (UIView *) digitView;
- (IBAction)switchButtonChanged:(id)sender;
- (IBAction)timeZoneButtonValueChanged:(id)sender;
- (IBAction)DoneButtonClicked:(id)sender;

- (IBAction)currentTimeZoneClicked:(id)sender;

@end

