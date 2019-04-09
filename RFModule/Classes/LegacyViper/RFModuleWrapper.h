//
//  RFModuleWrapper.h
//  rmobile
//
//  Created by RFMacBook on 25.05.17.
//  Copyright © 2017 Raiffeisenbank. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RFViperModule.h"
#import "RFViperModuleView.h"

@protocol RFModule;
@protocol RFViperTransitionHandler;

@interface RFModuleWrapper : NSProxy <RFViperModule>

+ (instancetype) bridge:(id)module;

- (instancetype) initWithStoryboard:(UIStoryboard *)storyboard;

- (instancetype) initWithStoryboard:(UIStoryboard *)storyboard identifier:(NSString *)identifier;

- (instancetype) initWithFactory:(id)factory selector:(SEL)selector;

- (instancetype) initWithViewController:(UIViewController <RFViperModuleView> *)viewController;


- (void)configureBlock:(void (^)(id<RFViperModule>module, id parameters))block parameters:(id)parameters;

@property (nonatomic, weak, readonly) id <RFViperTransitionHandler> transitionHandler;

@end


@interface RFModuleWrapper (RFModule) <RFModule>
@end
