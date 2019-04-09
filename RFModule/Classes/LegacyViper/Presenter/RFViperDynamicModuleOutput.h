//
//  RFViperDynamicModuleOutput.h
//  rmobile
//
//  Created by cremnet on 05.04.17.
//  Copyright © 2017 Paul Nefedov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RFViperDynamicModuleOutput <NSObject>

- (void) module:(id)module didUpdateContent:(id)content;

@end
