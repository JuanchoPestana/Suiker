//
//  BROWNIEViewController.h
//  SuikerCaja
//
//  Created by Juan Pestana on 8/7/15.
//  Copyright (c) 2015 DPSoftware. All rights reserved.
//

#import "ViewController.h"
#import "sqlite3.h"


@interface BROWNIEViewController : ViewController


@property (weak, nonatomic) IBOutlet UILabel *brownie;

@property (weak, nonatomic) IBOutlet UIStepper *stepper_brownie;

- (IBAction)brownie:(id)sender;









- (IBAction)carritoFinal:(id)sender;









@end
