//
//  CAJASViewController.m
//  SuikerCaja
//
//  Created by Juan Pestana on 8/8/15.
//  Copyright (c) 2015 DPSoftware. All rights reserved.
//

#import "CAJASViewController.h"

@interface CAJASViewController (){
    sqlite3 *suiker_carrito;
    NSString *dbPathString;
}

@end

@implementation CAJASViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createOrOpenDB];
    
    

    
    _chocolate.text = @"0";
    _marmoleado.text = @"0";
    _coco.text = @"0";
    _zanahoria.text = @"0";
    _platanoBetun.text = @"0";
    _platanoTopping.text = @"0";
    _red_velvet.text = @"0";
    _nutella.text = @"0";
    _limon.text = @"0";
    _coffee_cake.text = @"0";
    _coffee_cake_marmoleado.text = @"0";
    _blueberry.text = @"0";
    
    
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





- (IBAction)carritoFinal:(id)sender {
    
   
    
    int caja_chocolate = [self.chocolate.text intValue];
    int caja_marmoleado = [self.marmoleado.text intValue];
    int caja_coco = [self.coco.text intValue];
    int caja_zanahoria = [self.zanahoria.text intValue];
    int caja_platano_betun = [self.platanoBetun.text intValue];
    int caja_platano_topping = [self.platanoTopping.text intValue];
    int caja_red_velvet = [self.red_velvet.text intValue];
    int caja_nutella = [self.nutella.text intValue];
    int caja_limon = [self.limon.text intValue];
    int caja_coffee_cake = [self.coffee_cake.text intValue];
    int caja_coffee_cake_marmoleado = [self.coffee_cake_marmoleado.text intValue];
    int caja_blueberry = [self.blueberry.text intValue];

    
    
    
    
    
    // AQUI ME QUEDE.... ESTOY EN LO ROJO
    // BORRE LAS CAJAS DE PALOMITAS ENTONCES HAY QUE HACER UN VIEWCONTROLLLER NUEVO PARA LAS PURAS PALOMITAS
    
    
    
    
    //  INT,  INT,  INT,  INT,  INT,  INT,  INT,  INT,  INT,  INT,  INT,  INT
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &suiker_carrito)==SQLITE_OK) {
        NSLog(@"Entro");

        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE SUIKERFINAL SET CAJA_MINI_MUFFIN_CHOCOLATE = CAJA_MINI_MUFFIN_CHOCOLATE + %d, CAJA_MINI_MUFFIN_MARMOLEADO = CAJA_MINI_MUFFIN_MARMOLEADO + %d, CAJA_MINI_MUFFIN_COCO = CAJA_MINI_MUFFIN_COCO + %d, CAJA_MINI_MUFFIN_ZANAHORIA = CAJA_MINI_MUFFIN_ZANAHORIA + %d, CAJA_MINI_MUFFIN_PLATANO_BETUN = CAJA_MINI_MUFFIN_PLATANO_BETUN + %d, CAJA_MINI_MUFFIN_PLATANO_TOPPING = CAJA_MINI_MUFFIN_PLATANO_TOPPING + %d, CAJA_MINI_MUFFIN_RED_VELVET = CAJA_MINI_MUFFIN_RED_VELVET + %d, CAJA_MINI_MUFFIN_NUTELLA = CAJA_MINI_MUFFIN_NUTELLA + %d, CAJA_MINI_MUFFIN_LIMON = CAJA_MINI_MUFFIN_LIMON + %d, CAJA_MINI_MUFFIN_COFFEE_CAKE = CAJA_MINI_MUFFIN_COFFEE_CAKE + %d, CAJA_MINI_MUFFIN_COFFEE_CAKE_MARMOLEADO = CAJA_MINI_MUFFIN_COFFEE_CAKE_MARMOLEADO + %d, CAJA_MINI_MUFFIN_BLUEBERRY = CAJA_MINI_MUFFIN_BLUEBERRY + %d", caja_chocolate, caja_marmoleado, caja_coco, caja_zanahoria, caja_platano_betun, caja_platano_topping, caja_red_velvet, caja_nutella, caja_limon, caja_coffee_cake, caja_coffee_cake_marmoleado, caja_blueberry];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        
        if (sqlite3_exec(suiker_carrito, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"AGREGADO CAJAS");
            
            
        }
        sqlite3_close(suiker_carrito);
    }
    
    

}



- (IBAction)chocolate:(id)sender {
    
    double valor = [_stepper_chocolate value];
    
    [_chocolate setText:[NSString stringWithFormat:@"%d", (int)valor]];

}


- (IBAction)marmoleado:(id)sender {
    
    double valor = [_stepper_marmoleado value];
    
    [_marmoleado setText:[NSString stringWithFormat:@"%d", (int)valor]];
    
    
}


- (IBAction)coco:(id)sender {
    
    double valor = [_stepper_coco value];
    
    [_coco setText:[NSString stringWithFormat:@"%d", (int)valor]];

    
}


- (IBAction)zanahoria:(id)sender {
    
    double valor = [_stepper_zanahoria value];
    
    [_zanahoria setText:[NSString stringWithFormat:@"%d", (int)valor]];

}


- (IBAction)platano_betun:(id)sender {
    
    
    double valor = [_stepper_platano_betun value];
    
    [_platanoBetun setText:[NSString stringWithFormat:@"%d", (int)valor]];
    

}


- (IBAction)platano_topping:(id)sender {
    
    
    double valor = [_stepper_platano_topping value];
    
    [_platanoTopping setText:[NSString stringWithFormat:@"%d", (int)valor]];
    

    
}


- (IBAction)red_velvet:(id)sender {
    
    
    double valor = [_stepper_red_velvet value];
    
    [_red_velvet setText:[NSString stringWithFormat:@"%d", (int)valor]];
    

}


- (IBAction)nutella:(id)sender {
    
    
    double valor = [_stepper_nutella value];
    
    [_nutella setText:[NSString stringWithFormat:@"%d", (int)valor]];
    

    
}


- (IBAction)limon:(id)sender {
    
    
    double valor = [_stepper_limon value];
    
    [_limon setText:[NSString stringWithFormat:@"%d", (int)valor]];
    

}


- (IBAction)coffee_cake:(id)sender {
    
    
    double valor = [_stepper_coffee_cake value];
    
    [_coffee_cake setText:[NSString stringWithFormat:@"%d", (int)valor]];
    

}


- (IBAction)coffee_cake_marmoleado:(id)sender {
    
    
    double valor = [_stepper_coffee_cake_marmoleado value];
    
    [_coffee_cake_marmoleado setText:[NSString stringWithFormat:@"%d", (int)valor]];
    

    
    
}


- (IBAction)blueberry:(id)sender {
    
    
    double valor = [_stepper_blueberry value];
    
    [_blueberry setText:[NSString stringWithFormat:@"%d", (int)valor]];
    

    
}


@end
