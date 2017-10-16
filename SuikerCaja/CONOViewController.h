//
//  CONOViewController.h
//  SuikerCaja
//
//  Created by Juan Pestana on 8/8/15.
//  Copyright (c) 2015 DPSoftware. All rights reserved.
//

#import "ViewController.h"
#import "sqlite3.h"


@interface CONOViewController : ViewController



@property (weak, nonatomic) IBOutlet UILabel *galletas_mantequilla;

@property (weak, nonatomic) IBOutlet UIStepper *stepper_galletas_mantequilla;
- (IBAction)galletas_mantequilla:(id)sender;





- (IBAction)carritoFinal:(id)sender;

@end
