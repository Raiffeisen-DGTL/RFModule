//
//  RFViperModuleInteractor.h
//  rmobile
//
//  Created by cremnet on 07.04.17.
//  Copyright © 2017 Paul Nefedov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RFViperModule;

@protocol RFViperModuleInteractor <NSObject>

@property (nonatomic, weak) id <RFViperModule> output;

@end
