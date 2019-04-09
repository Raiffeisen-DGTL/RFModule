//
//  RFProductConfigurableModule.h
//  rmobile
//
//  Created by cremnet on 17.02.17.
//  Copyright © 2017 Paul Nefedov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RFProduct;

@protocol RFProductConfigurableModule <NSObject>

- (void) configureModuleWithProduct:(id <RFProduct>)product;

@end
