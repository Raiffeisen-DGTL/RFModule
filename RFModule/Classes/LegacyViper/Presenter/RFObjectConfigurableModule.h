//
//  RFObjectConfigurableModule.h
//  rmobile
//
//  Created by cremnet on 28.03.17.
//  Copyright © 2017 Paul Nefedov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RFModuleConfigureParameters.h"

@protocol RFObjectConfigurableModule <NSObject>

- (void) configureModuleWith:(id)object;

@end
