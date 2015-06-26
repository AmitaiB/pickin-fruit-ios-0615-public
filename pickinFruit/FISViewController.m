//
//  FISViewController.m
//  pickinFruit
//
//  Created by Joe Burgess on 7/3/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#define ARC4RANDOM_MAX 0x100000000
#import "FISViewController.h"

@interface FISViewController ()

- (IBAction)spin:(id)sender;

@end

@implementation FISViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.fruitPicker.delegate = self;
    self.fruitPicker .dataSource = self;
    self.fruitsArray = @[@"Apple",
                         @"Orange",
                         @"Banana",
                         @"Pear",
                         @"Grape",
                         @"Kiwi", 
                         @"Mango", 
                         @"Blueberry", 
                         @"Raspberry"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.fruitsArray.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.fruitsArray[row]; 
}

- (IBAction)spin:(id)sender {
    [self spinMe];
}

-(void)spinMe {
    for (NSUInteger component = 0; component < 3; component++) {
        [self.fruitPicker selectRow:[self randomFloatBetweenNumber:0 andNumber:self.fruitsArray.count] inComponent:component animated:YES];        
    }
    
    [self checkIfWon];
}

 
-(void)checkIfWon
{
    NSUInteger firstRow = [self.fruitPicker selectedRowInComponent:0];
    NSUInteger secondRow = [self.fruitPicker selectedRowInComponent:1];
    NSUInteger thirdRow = [self.fruitPicker selectedRowInComponent:2];    
    if (firstRow == secondRow && secondRow == thirdRow) {
        //JACKPOT
        
    } else {
        //Try again
        
    };

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Now what?" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Re-spin", nil];

    [alert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        //cancel
        
    }
    if (buttonIndex == 1) {
        //re-spin
        [self spinMe];
    }
}

-(CGFloat)randomFloatBetweenNumber:(CGFloat)minRange andNumber:(CGFloat)maxRange
{
    return ((float)arc4random() / ARC4RANDOM_MAX) * (maxRange - minRange);
}




@end
