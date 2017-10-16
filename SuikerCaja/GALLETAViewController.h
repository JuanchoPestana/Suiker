//
//  GALLETAViewController.h
//  SuikerCaja
//
//  Created by Juan Pestana on 8/8/15.
//  Copyright (c) 2015 DPSoftware. All rights reserved.
//

#import "ViewController.h"
#import "sqlite3.h"


@interface GALLETAViewController : ViewController



@property (weak, nonatomic) IBOutlet UILabel *chocolate_cacahuate;
@property (weak, nonatomic) IBOutlet UIStepper *stepper_chocolate_cacahuate;
- (IBAction)chocolate_cacahuate:(id)sender;




@property (weak, nonatomic) IBOutlet UILabel *chispas_chocolate;
@property (weak, nonatomic) IBOutlet UIStepper *stepper_chispas_chocolate;
- (IBAction)chispas_chocolate:(id)sender;




@property (weak, nonatomic) IBOutlet UILabel *macadamia_chocolate_blanco;
@property (weak, nonatomic) IBOutlet UIStepper *stepper_macadamia_chocolate_blanco;
- (IBAction)macadamia_chocolate_blanco:(id)sender;






- (IBAction)carritoFinal:(id)sender;






@end
