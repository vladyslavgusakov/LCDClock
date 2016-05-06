//
//  ViewController.m
//  LCDClock
//
//  Created by Vladyslav Gusakov on 1/25/16.
//  Copyright © 2016 Vladyslav Gusakov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    NSArray *digitViews;
}

@end

@implementation ViewController

//#pragma clang diagnostic ignored "-Wobjc-designated-initializers"

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.mainView.layer.cornerRadius = 10.0f;

    //set up graphics and stored values
    [self initialSetup];
    
    //time zone set up
    [self timeZoneSetUp];
    
    //add gestures
    [self addGestures];
    
    //assign images to uiimageviews
    [self setImages];
    
    //create digits
    [self createDigits];
    
    //change digits color
    [self changeDigitsColor];

    //set timer
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                                  target: self
                                                selector:@selector(setTime:)
                                                userInfo: nil repeats:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) setTime: (NSTimer *) timer {
    
//    [dateFormatter setDateFormat:@"hh:mm:ss a"];
//    NSLog(@"%@",[dateFormatter stringFromDate:[NSDate date]]);
    
    
    //blinking separator
    
    if (flag == FALSE) {
        self.separatorView.hidden = YES;
    }
    else {
        self.separatorView.hidden = NO;
    }
    
    flag = !flag;
    
    if (self.enableButton.on == TRUE ) {
        [dateFormatter setDateFormat:@"HH"];
    }
    else {
        [dateFormatter setDateFormat:@"hh"];
    }
    
    dig1Str = [NSString stringWithFormat:@"%c", [[dateFormatter stringFromDate:[NSDate date]] characterAtIndex:0]];
    d1 = [dig1Str integerValue];
    
    [self.digitsArr[0] setDigitTo:d1 ];

    dig2Str = [NSString stringWithFormat:@"%c", [[dateFormatter stringFromDate:[NSDate date]] characterAtIndex:1]];
    d2 = [dig2Str integerValue];
    
    [self.digitsArr[1] setDigitTo:d2 ];
    
    
    [dateFormatter setDateFormat:@"mm"];
    
    dig3Str = [NSString stringWithFormat:@"%c", [[dateFormatter stringFromDate:[NSDate date]] characterAtIndex:0]];
    d3 = [dig3Str integerValue];
    
    [self.digitsArr[2] setDigitTo:d3 ];
    
    dig4Str = [NSString stringWithFormat:@"%c", [[dateFormatter stringFromDate:[NSDate date]] characterAtIndex:1]];
    d4 = [dig4Str integerValue];
    
    [self.digitsArr[3] setDigitTo:d4 ];

    [dateFormatter setDateFormat:@"ss"];
    
    dig5Str = [NSString stringWithFormat:@"%c", [[dateFormatter stringFromDate:[NSDate date]] characterAtIndex:0]];
    d5 = [dig5Str integerValue];
    
    [self.digitsArr[4] setDigitTo:d5 ];
    
    dig6Str = [NSString stringWithFormat:@"%c", [[dateFormatter stringFromDate:[NSDate date]] characterAtIndex:1]];
    d6 = [dig6Str integerValue];
    
    [self.digitsArr[5] setDigitTo:d6 ];
    
    if (self.enableButton.on == FALSE) {
        
        [dateFormatter setDateFormat:@"a"];
        
        if ([[dateFormatter stringFromDate:[NSDate date]] isEqualToString:@"PM"]) {
            self.amPmView.image = [UIImage imageNamed:@"pm.png"];
            self.amPmView.image = [self.amPmView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        }
        else {
            self.amPmView.image = [UIImage imageNamed:@"am.png"];
            self.amPmView.image = [self.amPmView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        }
        self.amPmView.hidden = NO;
    }
    else {
        self.amPmView.hidden = YES;
    }
}

- (void)handleSwipe: (UIPanGestureRecognizer *) swipeGesture
{
    
    UISwipeGestureRecognizerDirection direction = [(UISwipeGestureRecognizer *) swipeGesture direction];
    
    switch (direction) {
        case UISwipeGestureRecognizerDirectionRight:
        {
            
            if (++backgroundCounter > self.backgroundColors.count - 1) {
                backgroundCounter = 0;
            }
            NSLog(@"swipe right detected");
            self.view.backgroundColor = self.backgroundColors[backgroundCounter];
            
            [[NSUserDefaults standardUserDefaults] setInteger: backgroundCounter forKey:@"backgroundCounter"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
        }
            break;
            
        case UISwipeGestureRecognizerDirectionLeft:
        {
            if (--backgroundCounter < 0) {
                backgroundCounter = self.backgroundColors.count - 1;
            }
            self.view.backgroundColor = self.backgroundColors[backgroundCounter];
            NSLog(@"swipe left detected");
            
            [[NSUserDefaults standardUserDefaults] setInteger: backgroundCounter forKey:@"backgroundCounter"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            
            
        }
            break;
            
        case UISwipeGestureRecognizerDirectionUp:
        {
            if (--digitsColorCounter < 0) {
                digitsColorCounter = self.backgroundColors.count - 1;
            }
            NSLog(@"swipe up detected");
            
            [self.separatorView setTintColor:self.backgroundColors[digitsColorCounter]];
            [self.amPmView setTintColor:self.backgroundColors[digitsColorCounter]];
            
            [self changeDigitsColor];
            
            [[NSUserDefaults standardUserDefaults] setInteger: digitsColorCounter forKey:@"digitsColorCounter"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
        }
            break;
            
        case UISwipeGestureRecognizerDirectionDown:
        {
            if (++digitsColorCounter > self.backgroundColors.count - 1) {
                digitsColorCounter = 0;
            }
            NSLog(@"swipe down detected");
            
            [self.separatorView setTintColor:self.backgroundColors[digitsColorCounter]];
            [self.amPmView setTintColor:self.backgroundColors[digitsColorCounter]];
            
            [self changeDigitsColor];
            
            [[NSUserDefaults standardUserDefaults] setInteger: digitsColorCounter forKey:@"digitsColorCounter"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
            break;

        default:
            break;
    }
}

-(void) changeDigitsColor {
    
    for (Digit *digit in self.digitsArr) {
        for (UIImageView *iv in digit.segmentNum) {
            [iv setTintColor:self.backgroundColors[digitsColorCounter]];
        }
    }
}

-(void) createDigit: (Digit *) digit forView: (UIView *) digitView {

    for (int i = 1; i <= 7; i++) {
        [digitView addSubview: [digit valueForKey:[NSString stringWithFormat:@"segment%i", i]]];
    }
}

- (IBAction)switchButtonChanged:(id)sender {
    if (self.enableButton.on) {
        isOn = true;
    }
    else {
        isOn = false;
    }
    
    [[NSUserDefaults standardUserDefaults] setBool: isOn forKey:@"isOn"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (IBAction)timeZoneButtonValueChanged:(id)sender {
    if (!self.timeZoneAutoButton.on) {
        self.timeZoneSelectView.hidden = NO;
        isSetAuto = false;
    }
    else {
        [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"America/New_York"]];
        [self.currentTimeZone setTitle:@"New York" forState:UIControlStateNormal];
        isSetAuto = true;
    }
    
    [[NSUserDefaults standardUserDefaults] setBool: isSetAuto forKey:@"isSetAuto"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

- (IBAction)DoneButtonClicked:(id)sender {
    self.timeZoneSelectView.hidden = YES;
    [self saveData];
}

- (IBAction)currentTimeZoneClicked:(id)sender {
    
    if (!self.timeZoneAutoButton.on) {
        self.timeZoneSelectView.hidden = NO;
    }
}

-(void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    self.timeZoneSelected = [timeZoneArray objectAtIndex:row];
    [self.currentTimeZone setTitle:self.timeZoneSelected forState:UIControlStateNormal];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:self.timeZoneSelected]];
    
}

-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return timeZoneArray.count;
}

-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

-(NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return timeZoneArray[row];
    
}

- (void) saveData {
    NSMutableDictionary *dataDict = [[NSMutableDictionary alloc] initWithCapacity:1];
    if (self.timeZoneSelected != nil) {
        [dataDict setObject:self.timeZoneSelected forKey:@"timezone"];  // save the games array
    }
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectoryPath = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectoryPath stringByAppendingPathComponent:@"appData"];
    
    [NSKeyedArchiver archiveRootObject:dataDict toFile:filePath];
}

- (void) loadData {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectoryPath = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectoryPath stringByAppendingPathComponent:@"appData"];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        NSDictionary *savedData = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        
        if ([savedData objectForKey:@"timezone"] != nil) {
            self.timeZoneSelected = [savedData objectForKey:@"timezone"];
        }
    }
}

-(void) addGestures {
    
    //swipe right
    UISwipeGestureRecognizer *swipeRightGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeRightGestureRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    
    [self.view addGestureRecognizer:swipeRightGestureRecognizer];
    
    //swipe left
    UISwipeGestureRecognizer *swipeLeftGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeLeftGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    
    [self.view addGestureRecognizer:swipeLeftGestureRecognizer];
    
    //swipe up
    UISwipeGestureRecognizer *swipeUpGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeRightGestureRecognizer.direction = UISwipeGestureRecognizerDirectionUp;
    
    [self.view addGestureRecognizer:swipeUpGestureRecognizer];
    
    //swipe down
    UISwipeGestureRecognizer *swipeDownGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    
    swipeDownGestureRecognizer.direction = UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:swipeDownGestureRecognizer];

}

-(void) initialSetup {
    
    //set all available background colors
    self.backgroundColors = [NSArray arrayWithObjects: [UIColor whiteColor], [UIColor grayColor], [UIColor greenColor], [UIColor blueColor], [UIColor yellowColor], [UIColor redColor], nil];

    //populate array with all digits, separator and am,pm views
    digitViews = @[self.digit1View, self.digit2View, self.digit3View, self.digit4View, self.separatorView, self.amPmView, self.digit5View, self.digit6View];
    
    //set background color of digits to clear
    for (UIView *digitView in digitViews) {
        digitView.backgroundColor = [UIColor clearColor];
    }
    
    //24hr mode
    [self.enableButton setOn:[[NSUserDefaults standardUserDefaults] boolForKey:@"isOn"]];
    
    //get background and digits color from nsuserdefaults
    backgroundCounter = [[NSUserDefaults standardUserDefaults]
                         integerForKey:@"backgroundCounter"];
    self.view.backgroundColor = self.backgroundColors[backgroundCounter];
    
    digitsColorCounter = [[NSUserDefaults standardUserDefaults]
                          integerForKey:@"digitsColorCounter"];
    
}

-(void) setImages {
    
    // set separator image
    flag = TRUE;  // for blinking separator
    self.separatorView.image = [UIImage imageNamed:@"separator.png"];
    self.separatorView.image = [self.separatorView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [self.separatorView setTintColor:self.backgroundColors[digitsColorCounter]];

    //set image for AM PM
    self.amPmView.image = [UIImage imageNamed:@"pm.png"];
    self.amPmView.image = [self.amPmView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [self.amPmView setTintColor:self.backgroundColors[digitsColorCounter]];

}

-(void) timeZoneSetUp {
    
    //set timezone
    self.timeZonePickerView.delegate = self;
    self.timeZonePickerView.dataSource = self;
    self.timeZoneSelectView.hidden = YES;
    
    timeZoneArray = [NSTimeZone knownTimeZoneNames];
    
    [self.timeZoneAutoButton setOn:[[NSUserDefaults standardUserDefaults] boolForKey:@"isSetAuto"]];
    
    //load timezone from documents
    [self loadData];
    
    //set date formatter
    dateFormatter = [NSDateFormatter new];
    
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:self.timeZoneSelected]];
    [self.currentTimeZone setTitle:self.timeZoneSelected forState:UIControlStateNormal];

}

-(void) createDigits {
    
    //create hh, mm, ss digits
    self.digitsArr = [NSMutableArray new];
    
    for (int i = 1; i <= 6; i ++) {
        Digit *digit = [[Digit alloc] initWithScale: (i > 4 ? 0.55 : 1)];
        [self createDigit:digit forView: [self valueForKey:[NSString stringWithFormat:@"digit%iView", i]]];
        [self.digitsArr addObject:digit];
    }

}

@end
