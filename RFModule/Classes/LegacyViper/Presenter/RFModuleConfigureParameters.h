//
//  RFModuleConfigureParameters.h
//  rmobile
//
//  Created by RFMacBook on 29.08.17.
//  Copyright © 2017 Raiffeisenbank. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NSString * RFModuleConfigureParameter NS_STRING_ENUM;

FOUNDATION_EXPORT RFModuleConfigureParameter RFModuleConfigureType;
FOUNDATION_EXPORT RFModuleConfigureParameter RFModuleConfigureObserver;
FOUNDATION_EXPORT RFModuleConfigureParameter RFModuleConfigureEntity;
FOUNDATION_EXPORT RFModuleConfigureParameter RFModuleConfigureCallback;


typedef NSDictionary<RFModuleConfigureParameter, id> RFModuleConfigureParameters;

