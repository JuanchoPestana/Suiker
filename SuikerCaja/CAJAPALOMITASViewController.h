//
//  CAJAPALOMITASViewController.h
//  SuikerCaja
//
//  Created by Juan Pestana on 8/23/15.
//  Copyright (c) 2015 DPSoftware. All rights reserved.
//

#import "ViewController.h"
#import "sqlite3.h"


@interface CAJAPALOMITASViewController : ViewController



@property (weak, nonatomic) IBOutlet UIStepper *stepper_chico;
- (IBAction)chico:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *chico;




@property (weak, nonatomic) IBOutlet UIStepper *stepper_grande;
- (IBAction)grande:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *grande;




- (IBAction)carritoFinal:(id)sender;





@end
