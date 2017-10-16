//
//  VARIABLEViewController.h
//  SuikerCaja
//
//  Created by Juan Pestana on 8/24/15.
//  Copyright (c) 2015 DPSoftware. All rights reserved.
//

#import "ViewController.h"
#import "sqlite3.h"

@interface VARIABLEViewController : ViewController





@property (weak, nonatomic) IBOutlet UIStepper *stepper_variable;
- (IBAction)variable:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *variable;


@property (weak, nonatomic) IBOutlet UITextField *precio;





- (IBAction)carritoFinal:(id)sender;








@end
