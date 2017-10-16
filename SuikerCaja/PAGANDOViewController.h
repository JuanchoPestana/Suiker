//
//  PAGANDOViewController.h
//  SuikerCaja
//
//  Created by Juan Pestana on 8/23/15.
//  Copyright (c) 2015 DPSoftware. All rights reserved.
//

#import "ViewController.h"
#import "sqlite3.h"

@interface PAGANDOViewController : ViewController


@property (weak, nonatomic) IBOutlet UILabel *total;


- (IBAction)pagar:(id)sender;



// VISA
@property (weak, nonatomic) IBOutlet UIButton *boton_visa;
- (IBAction)visa:(id)sender;


// MASTERCARD
@property (weak, nonatomic) IBOutlet UIButton *boton_mastercard;
- (IBAction)mastercard:(id)sender;


// EFECTIVO
@property (weak, nonatomic) IBOutlet UIButton *boton_efectivo;
- (IBAction)efectivo:(id)sender;

// CAMBIO
@property (weak, nonatomic) IBOutlet UITextField *recibo;
- (IBAction)calcularCambio:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *boton_calcular_cambio;

@property (weak, nonatomic) IBOutlet UILabel *label_cambio;
@property (weak, nonatomic) IBOutlet UILabel *cambio;

// CONTINUAR
@property (weak, nonatomic) IBOutlet UIButton *boton_continuar;
- (IBAction)continuar:(id)sender;


// TICEKT

@property (weak, nonatomic) IBOutlet UIButton *boton_ticket_si;
@property (weak, nonatomic) IBOutlet UIButton *boton_ticket_no;

- (IBAction)ticket_si:(id)sender;
- (IBAction)ticket_no:(id)sender;

// CORREO ELECTRONICO
@property (weak, nonatomic) IBOutlet UITextField *email;

@property (weak, nonatomic) IBOutlet UIButton *boton_email;
- (IBAction)enviar_email:(id)sender;


// FINALIZAR
@property (weak, nonatomic) IBOutlet UIButton *boton_finalizar;




// PERSONAS
@property (weak, nonatomic) IBOutlet UIButton *boton_lupita;
- (IBAction)lupita:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *boton_gina;
- (IBAction)gina:(id)sender;


@property (weak, nonatomic) IBOutlet UIButton *boton_esteban;
- (IBAction)esteban:(id)sender;


@property (weak, nonatomic) IBOutlet UIButton *boton_marcelo;
- (IBAction)marcelo:(id)sender;


@property (weak, nonatomic) IBOutlet UIButton *boton_maria;
- (IBAction)maria:(id)sender;


@property (weak, nonatomic) IBOutlet UIButton *boton_carolina;
- (IBAction)carolina:(id)sender;







@end
