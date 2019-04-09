//
//  RFViperModule.h
//  rmobile
//
//  Created by cremnet on 31.03.17.
//  Copyright © 2017 Paul Nefedov. All rights reserved.
//

#import <Foundation/Foundation.h>
@import RFModule;

@protocol RFViperModuleView;

@protocol RFViperTransitionHandler;


/**
 this block will be invoked on module transition

 @param source ModuleTransitionHandler
 @param destinatio nModuleTransitionHandler
 */
typedef void (^RFModuleTransitionBlock)(id<RFViperTransitionHandler> source,
										id<RFViperTransitionHandler> destination);


/**
 this is abstract protocol do not implement RFModuleWrapper will override it
 */
@protocol RFViperModuleAbstract <RFModule, NSObject>

@property (nonatomic, copy) RFModuleTransitionBlock moduleTransitionBlock;

@end


/**
 use this protocol to wrap ViperModule or ViewController
 */
@protocol RFViperModule <RFViperModuleAbstract>

@property (nonatomic, weak) UIViewController <RFViperModuleView> *view;

@optional

- (void) setModuleOutput:(id)moduleOutput;

@end
