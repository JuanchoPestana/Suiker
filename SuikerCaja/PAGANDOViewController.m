//
//  PAGANDOViewController.m
//  SuikerCaja
//
//  Created by Juan Pestana on 8/23/15.
//  Copyright (c) 2015 DPSoftware. All rights reserved.
//

#import "PAGANDOViewController.h"


double total_pagar = 0.0;

NSString *empleado;
NSString *tipo_pago;


@interface PAGANDOViewController (){
    sqlite3 *suiker_carrito;
    NSString *dbPathString;
}

@end

@implementation PAGANDOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createOrOpenDBPAGOS];
    
    [self selfActualizar];
    
    
    // ESCONDER TODO
    
    _recibo.hidden = YES;
    _boton_calcular_cambio.hidden = YES;
    _cambio.hidden = YES;
    _label_cambio.hidden = YES;
    _boton_continuar.hidden = YES;
    _boton_ticket_si.hidden = YES;
    _boton_ticket_no.hidden = YES;
    _email.hidden = YES;
    _boton_email.hidden = YES;
    _boton_finalizar.hidden = YES;
    _boton_lupita.hidden = YES;
    _boton_gina.hidden = YES;
    _boton_marcelo.hidden = YES;
    _boton_esteban.hidden = YES;
    _boton_maria.hidden = YES;
    _boton_carolina.hidden = YES;
    
    
    
    
    
    
    
    
    
    
    
}



-(void)createOrOpenDBPAGOS{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    dbPathString = [docPath stringByAppendingPathComponent:@"total.db"];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &suiker_carrito)==SQLITE_OK) {
            const char *sql_stmt = "CREATE TABLE IF NOT EXISTS TOTAL (ID INTEGER PRIMARY KEY AUTOINCREMENT, TOTAL DOUBLE)";
            sqlite3_exec(suiker_carrito, sql_stmt, NULL, NULL, &error);
            sqlite3_close(suiker_carrito);
        }
    }
}



-(void)selfActualizar{
    
    sqlite3_stmt *statement;
    
    if (sqlite3_open([dbPathString UTF8String], &suiker_carrito)==SQLITE_OK) {
        
        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM TOTAL"];
        const char* query_sql = [querySql UTF8String];
        
        
        if (sqlite3_prepare(suiker_carrito, query_sql, -1, &statement, NULL)==SQLITE_OK) {
            while (sqlite3_step(statement)==SQLITE_ROW) {
                
                
                // MUFFINS
                NSNumber *total = [NSNumber numberWithDouble:(double)sqlite3_column_double(statement, 1)];
                
                _total.text = [NSString stringWithFormat:@"$ %@", total];
                
                total_pagar = [total doubleValue];
                
                
            }
        }
    }
    
}


- (void)reiniciarDBPAGOS{
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &suiker_carrito)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM TOTAL"];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(suiker_carrito, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            
            NSLog(@"BASE PAGOS REINICIADA");
            
        }
        sqlite3_close(suiker_carrito);
    }
    
}



- (void)reiniciarDB{
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &suiker_carrito)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM SUIKERFINAL"];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(suiker_carrito, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            
            NSLog(@"BASE REINICIADA");
            
        }
        sqlite3_close(suiker_carrito);
    }
    
}



/////////////////////////////////////////// SECCION DE TIPOS DE PAGO //////////////////////////////////////




















- (IBAction)pagar:(id)sender {
    
    
    
    
    
    
    
    
    
    
    
    
    [self reiniciarDB];
}
- (IBAction)visa:(id)sender {
    
    _boton_visa.hidden = YES;
    _boton_mastercard.hidden = YES;
    _boton_efectivo.hidden = YES;
    
    
    _boton_ticket_si.hidden = NO;
    _boton_ticket_no.hidden = NO;
    
    tipo_pago = @"VISA";
    
    
}
- (IBAction)mastercard:(id)sender {
    
    _boton_visa.hidden = YES;
    _boton_mastercard.hidden = YES;
    _boton_efectivo.hidden = YES;
    
    _boton_ticket_si.hidden = NO;
    _boton_ticket_no.hidden = NO;
    
    tipo_pago = @"MASTERCARD";
}
- (IBAction)efectivo:(id)sender {
    
    _boton_visa.hidden = YES;
    _boton_mastercard.hidden = YES;
    _boton_efectivo.hidden = YES;
    
    
    _recibo.hidden = NO;
    _boton_calcular_cambio.hidden = NO;
    
    tipo_pago = @"EFECTIVO";
    
    
}
- (IBAction)calcularCambio:(id)sender {
    
    // CALCULOS
    
    double recibo = [self.recibo.text doubleValue];
    
    double cambio = recibo - total_pagar;
    
    _cambio.text = [NSString stringWithFormat:@"%0.2f", cambio];
    
    // HIDDEN NO
    _cambio.hidden = NO;
    _label_cambio.hidden = NO;
    _boton_continuar.hidden = NO;
    
    
    
    
    
    
    
    
    
}
- (IBAction)continuar:(id)sender {
    
    _boton_ticket_no.hidden = NO;
    _boton_ticket_si.hidden = NO;

    
    // HIDDEN YES
    _recibo.hidden = YES;
    _cambio.hidden = YES;
    _label_cambio.hidden = YES;
    _boton_continuar.hidden = YES;
    _boton_calcular_cambio.hidden = YES;
    
    
    
    
}
- (IBAction)ticket_si:(id)sender {
    
    _boton_ticket_no.hidden = YES;
    _boton_ticket_si.hidden = YES;
    
    
    _email.hidden = NO;
    _boton_email.hidden = NO;
    
    
    
    
}

- (IBAction)ticket_no:(id)sender {
    
    
    _boton_ticket_no.hidden = YES;
    _boton_ticket_si.hidden = YES;
    
    
    _boton_lupita.hidden = NO;
    _boton_gina.hidden = NO;
    _boton_esteban.hidden = NO;
    _boton_marcelo.hidden = NO;
    _boton_maria.hidden = NO;
    _boton_carolina.hidden = NO;
    
    
}
- (IBAction)enviar_email:(id)sender {
    
    
    // METODO DE ENVIAR TICKET A EMAIL
    
    
    
    
    // HIDDENS
    _boton_lupita.hidden = NO;
    _boton_gina.hidden = NO;
    _boton_esteban.hidden = NO;
    _boton_marcelo.hidden = NO;
    _boton_maria.hidden = NO;
    _boton_carolina.hidden = NO;
    
    
    _email.hidden = YES;
    _boton_email.hidden = YES;
    
    
    
    
    
    
    
}

- (IBAction)lupita:(id)sender {
    _boton_lupita.hidden = YES;
    _boton_gina.hidden = YES;
    _boton_marcelo.hidden = YES;
    _boton_esteban.hidden = YES;
    _boton_maria.hidden = YES;
    _boton_carolina.hidden = YES;
    
    empleado = @"Lupita";
    _boton_finalizar.hidden = NO;

    
    
}
- (IBAction)gina:(id)sender {
    _boton_lupita.hidden = YES;
    _boton_gina.hidden = YES;
    _boton_marcelo.hidden = YES;
    _boton_esteban.hidden = YES;
    _boton_maria.hidden = YES;
    _boton_carolina.hidden = YES;
    
    empleado = @"Gina";
    _boton_finalizar.hidden = NO;

    
}
- (IBAction)esteban:(id)sender {
    _boton_lupita.hidden = YES;
    _boton_gina.hidden = YES;
    _boton_marcelo.hidden = YES;
    _boton_esteban.hidden = YES;
    _boton_maria.hidden = YES;
    _boton_carolina.hidden = YES;
    
    empleado = @"Esteban";
    _boton_finalizar.hidden = NO;

    
}
- (IBAction)marcelo:(id)sender {
    _boton_lupita.hidden = YES;
    _boton_gina.hidden = YES;
    _boton_marcelo.hidden = YES;
    _boton_esteban.hidden = YES;
    _boton_maria.hidden = YES;
    _boton_carolina.hidden = YES;
    
    empleado = @"Marcelo";
    _boton_finalizar.hidden = NO;

}
- (IBAction)maria:(id)sender {
    _boton_lupita.hidden = YES;
    _boton_gina.hidden = YES;
    _boton_marcelo.hidden = YES;
    _boton_esteban.hidden = YES;
    _boton_maria.hidden = YES;
    _boton_carolina.hidden = YES;
    
    empleado = @"Maria";
    
    _boton_finalizar.hidden = NO;

}
- (IBAction)carolina:(id)sender {
    _boton_lupita.hidden = YES;
    _boton_gina.hidden = YES;
    _boton_marcelo.hidden = YES;
    _boton_esteban.hidden = YES;
    _boton_maria.hidden = YES;
    _boton_carolina.hidden = YES;
    
    empleado = @"Carolina";
    
    _boton_finalizar.hidden = NO;
    
    
}
@end
