//
//  MINI_MUFFINViewController.h
//  SuikerCaja
//
//  Created by Juan Pestana on 8/6/15.
//  Copyright (c) 2015 DPSoftware. All rights reserved.
//


#import "ViewController.h"
#import "sqlite3.h"


@interface MINI_MUFFINViewController : ViewController


@property (weak, nonatomic) IBOutlet UILabel *mini_muffin_chocolate;
@property (weak, nonatomic) IBOutlet UIStepper *stepper_mini_muffin_chocolate;
- (IBAction)mini_muffin_chocolate:(id)sender;



@property (weak, nonatomic) IBOutlet UILabel *mini_muffin_marmoleado;
@property (weak, nonatomic) IBOutlet UIStepper *stepper_mini_muffin_marmoleado;
- (IBAction)mini_muffin_marmoleado:(id)sender;



@property (weak, nonatomic) IBOutlet UILabel *mini_muffin_coco;
@property (weak, nonatomic) IBOutlet UIStepper *stepper_mini_muffin_coco;
- (IBAction)mini_muffin_coco:(id)sender;



@property (weak, nonatomic) IBOutlet UILabel *mini_muffin_zanahoria;
@property (weak, nonatomic) IBOutlet UIStepper *stepper_mini_muffin_zanahoria;
- (IBAction)mini_muffin_zanahoria:(id)sender;




@property (weak, nonatomic) IBOutlet UILabel *mini_muffin_platanoBetun;
@property (weak, nonatomic) IBOutlet UIStepper *stepper_mini_muffin_platanoBetun;
- (IBAction)mini_muffin_platanoBetun:(id)sender;



@property (weak, nonatomic) IBOutlet UILabel *mini_muffin_platanoTopping;
@property (weak, nonatomic) IBOutlet UIStepper *stepper_mini_muffin_platanoTopping;
- (IBAction)mini_muffin_platanoTopping:(id)sender;




@property (weak, nonatomic) IBOutlet UILabel *mini_muffin_redVelvet;
@property (weak, nonatomic) IBOutlet UIStepper *stepper_mini_muffin_redVelvet;
- (IBAction)mini_muffin_redVelvet:(id)sender;




@property (weak, nonatomic) IBOutlet UILabel *mini_muffin_nutella;
@property (weak, nonatomic) IBOutlet UIStepper *stepper_mini_muffin_nutella;
- (IBAction)mini_muffin_nutella:(id)sender;




@property (weak, nonatomic) IBOutlet UILabel *mini_muffin_limon;
@property (weak, nonatomic) IBOutlet UIStepper *stepper_mini_muffin_limon;
- (IBAction)mini_muffin_limon:(id)sender;




@property (weak, nonatomic) IBOutlet UILabel *mini_muffin_coffeeCake;
@property (weak, nonatomic) IBOutlet UIStepper *stepper_mini_muffin_coffeeCake;
- (IBAction)mini_muffin_coffeeCake:(id)sender;




@property (weak, nonatomic) IBOutlet UILabel *mini_muffin_coffeeCakeMarmoleado;
@property (weak, nonatomic) IBOutlet UIStepper *stepper_mini_muffin_coffeeCakeMarmoleado;
- (IBAction)mini_muffin_coffeeCakeMarmoleado:(id)sender;



@property (weak, nonatomic) IBOutlet UILabel *mini_muffin_blueberry;
@property (weak, nonatomic) IBOutlet UIStepper *stepper_mini_muffin_blueberry;
- (IBAction)mini_muffin_blueberry:(id)sender;


- (IBAction)carritoFinal:(id)sender;

@end
