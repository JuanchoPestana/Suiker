//
//  ViewController.m
//  SuikerCaja
//
//  Created by Juan Pestana on 8/6/15.
//  Copyright (c) 2015 DPSoftware. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    
    sqlite3 *suiker_carrito;
    NSString *dbPathString;
}

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self createOrOpenDB];
    
    /////////////////////////////// INICIA REINICIAR DB ///////////////////////////////////////////////
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &suiker_carrito)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM SUIKERFINAL"];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(suiker_carrito, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            
            NSLog(@"BASE REINICIADA");
            
        }
        sqlite3_close(suiker_carrito);
    }
    
    /////////////////////////////// TERMINA REINICIAR DB ///////////////////////////////////////////////

    
    
    [self inicializar];


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


- (void)inicializar{
    
    
    int cero = 0;
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &suiker_carrito)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO SUIKERFINAL (MUFFIN_CHOCOLATE, MUFFIN_MARMOLEADO, MUFFIN_COCO, MUFFIN_ZANAHORIA, MUFFIN_PLATANO_BETUN, MUFFIN_PLATANO_TOPPING, MUFFIN_RED_VELVET, MUFFIN_NUTELLA, MUFFIN_LIMON, MUFFIN_COFFEE_CAKE, MUFFIN_COFFEE_CAKE_MARMOLEADO, MUFFIN_BLUEBERRY, MINI_MUFFIN_CHOCOLATE, MINI_MUFFIN_MARMOLEADO, MINI_MUFFIN_COCO, MINI_MUFFIN_ZANAHORIA, MINI_MUFFIN_PLATANO_BETUN, MINI_MUFFIN_PLATANO_TOPPING, MINI_MUFFIN_RED_VELVET, MINI_MUFFIN_NUTELLA, MINI_MUFFIN_LIMON, MINI_MUFFIN_COFFEE_CAKE, MINI_MUFFIN_COFFEE_CAKE_MARMOLEADO, MINI_MUFFIN_BLUEBERRY, PALOMITAS_GRANDE_MACADAMIA_ARANDANO, PALOMITAS_GRANDE_NUEZ_ALMENDRA, PALOMITAS_GRANDE_PISTACHE, PALOMITAS_GRANDE_NATURAL, PALOMITAS_GRANDE_NUEZ_INDIA, PALOMITAS_CHICA_MACADAMIA_ARANDANO, PALOMITAS_CHICA_NUEZ_ALMENDRA, PALOMITAS_CHICA_PISTACHE, PALOMITAS_CHICA_NATURAL, PALOMITAS_CHICA_NUEZ_INDIA, BROWNIE, GALLETAS_CHOCOLATE_CACAHUATE, GALLETAS_CHISPAS_CHOCOLATE, GALLETAS_MACADAMIA_CHOCOLATE_BLANCO, CONO_GALLETAS, BOTE_PVC_CHICO, BOTE_PVC_MEDIANO, BOTE_PVC_GRANDE, BOTE_VIDRIO_CHICO, BOTE_VIDRIO_MEDIANO, BOTE_VIDRIO_GRANDE, CAJA_PALOMITAS_CHICA, CAJA_PALOMITAS_GRANDE, CAJA_MINI_MUFFIN_CHOCOLATE, CAJA_MINI_MUFFIN_MARMOLEADO, CAJA_MINI_MUFFIN_COCO, CAJA_MINI_MUFFIN_ZANAHORIA, CAJA_MINI_MUFFIN_PLATANO_BETUN, CAJA_MINI_MUFFIN_PLATANO_TOPPING, CAJA_MINI_MUFFIN_RED_VELVET, CAJA_MINI_MUFFIN_NUTELLA, CAJA_MINI_MUFFIN_LIMON, CAJA_MINI_MUFFIN_COFFEE_CAKE, CAJA_MINI_MUFFIN_COFFEE_CAKE_MARMOLEADO, CAJA_MINI_MUFFIN_BLUEBERRY, BOLSA_ALMENDRAS, BOLSA_PASITAS, REFRESCOS, AGUA, AGUA_COCO, PERRIER, VARIABLE) values ('%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d', '%d')", cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero, cero ];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(suiker_carrito, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
        NSLog(@"BASE INICIALIZADA");
            
        }
        
        sqlite3_close(suiker_carrito);
    }
    
}



@end
