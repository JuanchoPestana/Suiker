//
//  GALLETAViewController.m
//  SuikerCaja
//
//  Created by Juan Pestana on 8/8/15.
//  Copyright (c) 2015 DPSoftware. All rights reserved.
//

#import "GALLETAViewController.h"

@interface GALLETAViewController (){
    sqlite3 *suiker_carrito;
    NSString *dbPathString;
}

@end

@implementation GALLETAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createOrOpenDB];
    
    _chocolate_cacahuate.text = @"0";
    _chispas_chocolate.text = @"0";
    _macadamia_chocolate_blanco.text = @"0";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





-(void)createOrOpenDB{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    dbPathString = [docPath stringByAppendingPathComponent:@"suikerFinal.db"];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &suiker_carrito)==SQLITE_OK) {
            const char *sql_stmt = "CREATE TABLE IF NOT EXISTS SUIKERFINAL (ID INTEGER PRIMARY KEY AUTOINCREMENT, MUFFIN_CHOCOLATE INT, MUFFIN_MARMOLEADO INT, MUFFIN_COCO INT, MUFFIN_ZANAHORIA INT, MUFFIN_PLATANO_BETUN INT, MUFFIN_PLATANO_TOPPING INT, MUFFIN_RED_VELVET INT, MUFFIN_NUTELLA INT, MUFFIN_LIMON INT, MUFFIN_COFFEE_CAKE INT, MUFFIN_COFFEE_CAKE_MARMOLEADO INT, MUFFIN_BLUEBERRY INT, MINI_MUFFIN_CHOCOLATE INT, MINI_MUFFIN_MARMOLEADO INT, MINI_MUFFIN_COCO INT, MINI_MUFFIN_ZANAHORIA INT, MINI_MUFFIN_PLATANO_BETUN INT, MINI_MUFFIN_PLATANO_TOPPING INT, MINI_MUFFIN_RED_VELVET INT, MINI_MUFFIN_NUTELLA INT, MINI_MUFFIN_LIMON INT, MINI_MUFFIN_COFFEE_CAKE INT, MINI_MUFFIN_COFFEE_CAKE_MARMOLEADO INT, MINI_MUFFIN_BLUEBERRY INT, PALOMITAS_GRANDE_MACADAMIA_ARANDANO INT, PALOMITAS_GRANDE_NUEZ_ALMENDRA INT, PALOMITAS_GRANDE_PISTACHE INT, PALOMITAS_GRANDE_NATURAL INT, PALOMITAS_GRANDE_NUEZ_INDIA INT, PALOMITAS_CHICA_MACADAMIA_ARANDANO INT, PALOMITAS_CHICA_NUEZ_ALMENDRA INT, PALOMITAS_CHICA_PISTACHE INT, PALOMITAS_CHICA_NATURAL INT, PALOMITAS_CHICA_NUEZ_INDIA INT, BROWNIE INT, GALLETAS_CHOCOLATE_CACAHUATE INT, GALLETAS_CHISPAS_CHOCOLATE INT, GALLETAS_MACADAMIA_CHOCOLATE_BLANCO INT, CONO_GALLETAS INT, BOTE_PVC_CHICO INT, BOTE_PVC_MEDIANO INT, BOTE_PVC_GRANDE INT, BOTE_VIDRIO_CHICO INT, BOTE_VIDRIO_MEDIANO INT, BOTE_VIDRIO_GRANDE INT, CAJA_PALOMITAS_CHICA INT, CAJA_PALOMITAS_GRANDE INT, CAJA_MINI_MUFFIN_CHOCOLATE INT, CAJA_MINI_MUFFIN_MARMOLEADO INT, CAJA_MINI_MUFFIN_COCO INT, CAJA_MINI_MUFFIN_ZANAHORIA INT, CAJA_MINI_MUFFIN_PLATANO_BETUN INT, CAJA_MINI_MUFFIN_PLATANO_TOPPING INT, CAJA_MINI_MUFFIN_RED_VELVET INT, CAJA_MINI_MUFFIN_NUTELLA INT, CAJA_MINI_MUFFIN_LIMON INT, CAJA_MINI_MUFFIN_COFFEE_CAKE INT, CAJA_MINI_MUFFIN_COFFEE_CAKE_MARMOLEADO INT, CAJA_MINI_MUFFIN_BLUEBERRY INT, BOLSA_ALMENDRAS INT, BOLSA_PASITAS INT, REFRESCOS INT, AGUA INT, AGUA_COCO INT, PERRIER INT, VARIABLE INT)";
            sqlite3_exec(suiker_carrito, sql_stmt, NULL, NULL, &error);
            sqlite3_close(suiker_carrito);
        }
    }
}








- (IBAction)chocolate_cacahuate:(id)sender {
    
    double valor = [_stepper_chocolate_cacahuate value];
    
    [_chocolate_cacahuate setText:[NSString stringWithFormat:@"%d", (int)valor]];
}
- (IBAction)chispas_chocolate:(id)sender {
    
    
    double valor = [_stepper_chispas_chocolate value];
    
    [_chispas_chocolate setText:[NSString stringWithFormat:@"%d", (int)valor]];
}
- (IBAction)macadamia_chocolate_blanco:(id)sender {
    
    double valor = [_stepper_macadamia_chocolate_blanco value];
    
    [_macadamia_chocolate_blanco setText:[NSString stringWithFormat:@"%d", (int)valor]];
}




- (IBAction)carritoFinal:(id)sender {
    
        
    int chocolate_cacahuate = [self.chocolate_cacahuate.text intValue];
    int chispas_chocolate =[self.chispas_chocolate.text intValue];
    int macadamia_chocolate_blanco = [self.macadamia_chocolate_blanco.text intValue];
    
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &suiker_carrito)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE SUIKERFINAL SET GALLETAS_CHOCOLATE_CACAHUATE = GALLETAS_CHOCOLATE_CACAHUATE + %d, GALLETAS_CHISPAS_CHOCOLATE = GALLETAS_CHISPAS_CHOCOLATE + %d, GALLETAS_MACADAMIA_CHOCOLATE_BLANCO = GALLETAS_MACADAMIA_CHOCOLATE_BLANCO + %d", chocolate_cacahuate, chispas_chocolate, macadamia_chocolate_blanco];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        
        if (sqlite3_exec(suiker_carrito, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"AGREGADO GALLETAS");
            
            
        }
        sqlite3_close(suiker_carrito);
    }
    
    
    
    
    

    
    
    
}
@end
