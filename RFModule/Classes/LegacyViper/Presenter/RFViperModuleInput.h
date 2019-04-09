//
//  RFViperModuleInput.h
//  rmobile
//
//  Created by RFMacBook on 28.08.17.
//  Copyright © 2017 Raiffeisenbank. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol RFViperModuleOutput;

@protocol RFViperModuleInput <NSObject>

@optional
- (void)setModuleOutput:(id <RFViperModuleOutput>)moduleOutput;

@end
