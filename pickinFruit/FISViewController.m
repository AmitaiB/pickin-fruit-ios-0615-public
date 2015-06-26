//
//  FISViewController.m
//  pickinFruit
//
//  Created by Joe Burgess on 7/3/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

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
    self.fruitPicker.dataSource = self;
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
    for (NSUInteger component = 0; component < 3; component++) {
        [self.fruitPicker selectRow:2  inComponent:component animated:YES];
    }
}
@end
