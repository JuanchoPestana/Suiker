//
//  PALOMITAViewController.h
//  SuikerCaja
//
//  Created by Juan Pestana on 8/7/15.
//  Copyright (c) 2015 DPSoftware. All rights reserved.
//

#import "ViewController.h"
#import "sqlite3.h"


@interface PALOMITAViewController : ViewController


@property (weak, nonatomic) IBOutlet UILabel *grande_macadamia_arandano;
@property (weak, nonatomic) IBOutlet UIStepper *steper_grande_macadamia_arandano;
- (IBAction)grande_macadamia_arandano:(id)sender;




@property (weak, nonatomic) IBOutlet UILabel *grande_nuez_almendra;
@property (weak, nonatomic) IBOutlet UIStepper *stepper_grande_nuez_almendra;
- (IBAction)grande_nuez_almendra:(id)sender;




@property (weak, nonatomic) IBOutlet UILabel *grande_pistache;
@property (weak, nonatomic) IBOutlet UIStepper *stepper_grande_pistache;
- (IBAction)grande_pistache:(id)sender;




@property (weak, nonatomic) IBOutlet UILabel *grande_natural;
@property (weak, nonatomic) IBOutlet UIStepper *stepper_grande_natural;
- (IBAction)grande_natural:(id)sender;





@property (weak, nonatomic) IBOutlet UILabel *grande_nuez_india;
@property (weak, nonatomic) IBOutlet UIStepper *stepper_grande_nuez_india;
- (IBAction)grande_nuez_india:(id)sender;






@property (weak, nonatomic) IBOutlet UILabel *chica_macadamia_arandano;
@property (weak, nonatomic) IBOutlet UIStepper *stepper_chica_macadamia_arandano;
- (IBAction)chica_macadamia_arandano:(id)sender;





@property (weak, nonatomic) IBOutlet UILabel *chica_nuez_almendra;
@property (weak, nonatomic) IBOutlet UIStepper *stepper_chica_nuez_almendra;
- (IBAction)chica_nuez_almendra:(id)sender;



@property (weak, nonatomic) IBOutlet UILabel *chica_pistache;
@property (weak, nonatomic) IBOutlet UIStepper *stepper_chica_pistache;
- (IBAction)chica_pistache:(id)sender;




@property (weak, nonatomic) IBOutlet UILabel *chica_natural;

@property (weak, nonatomic) IBOutlet UIStepper *stepper_chica_natural;
- (IBAction)chica_natural:(id)sender;




@property (weak, nonatomic) IBOutlet UILabel *chica_nuez_india;
@property (weak, nonatomic) IBOutlet UIStepper *stepper_chica_nuez_india;
- (IBAction)chica_nuez_india:(id)sender;





- (IBAction)carritoFinal:(id)sender;

@end
