//
//  RFViperModuleView.h
//  rmobile
//
//  Created by cremnet on 17.02.17.
//  Copyright © 2017 Paul Nefedov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RFViperModule.h"

@protocol RFViperModuleView <NSObject>

@property (nonatomic, strong) id <RFViperModule> output;

@end
