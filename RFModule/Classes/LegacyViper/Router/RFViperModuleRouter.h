//
//  RFViperModuleRouter.h
//  rmobile
//
//  Created by cremnet on 07.04.17.
//  Copyright © 2017 Paul Nefedov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RFViperTransitionHandler.h"

@protocol RFViperModuleRouter <NSObject>

@property (nonatomic, weak) id <RFViperTransitionHandler> transitionHandler;

@end
