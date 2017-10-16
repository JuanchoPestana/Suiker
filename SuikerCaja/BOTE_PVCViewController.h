//
//  BOTE_PVCViewController.h
//  SuikerCaja
//
//  Created by Juan Pestana on 8/8/15.
//  Copyright (c) 2015 DPSoftware. All rights reserved.
//

#import "ViewController.h"
#import "sqlite3.h"


@interface BOTE_PVCViewController : ViewController


@property (weak, nonatomic) IBOutlet UILabel *chico;
@property (weak, nonatomic) IBOutlet UIStepper *stepper_chico;

- (IBAction)chico:(id)sender;



@property (weak, nonatomic) IBOutlet UILabel *mediano;
@property (weak, nonatomic) IBOutlet UIStepper *stepper_mediano;
- (IBAction)mediano:(id)sender;



@property (weak, nonatomic) IBOutlet UILabel *grande;
@property (weak, nonatomic) IBOutlet UIStepper *stepper_grande;
- (IBAction)grande:(id)sender;



- (IBAction)carritoFinal:(id)sender;

@end
