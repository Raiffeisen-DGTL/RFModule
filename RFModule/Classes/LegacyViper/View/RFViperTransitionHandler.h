//
//  RFViperTransitionHandler.h
//  rmobile
//
//  Created by cremnet on 07.04.17.
//  Copyright © 2017 Paul Nefedov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RFViperModuleView.h"
#import "RFViperModuleInput.h"
@protocol RFModule;


extern NSTimeInterval const RFTabTransitionDuration;


typedef NS_ENUM(NSUInteger, RFModalTransitionStyle) {
    RFModalTransitionStyleCrossDissolve = 0,
    RFModalTransitionStyleBlurFade,
    RFModalTransitionStyleSystem
};

typedef void (^RFModuleConfigurationBlock)(id moduleInput);

@class RFCollectionViewDataDisplayManager;

@protocol RFViperTransitionHandler
// Module input object
@property (nonatomic, strong) id<RFViperModuleInput> moduleInput;
// Method removes/closes module
- (void)closeCurrentModule:(BOOL)animated;
@optional

/**
 Present module modally over full screen.

 @param module Module to present.
 @param style Determins the animation type of transition.
 @param configureBlock Configure module if needed.
 @return Module that is beeing presented.
 */
- (id <RFViperModule>) presentModule:(id<RFModule>)module
                               style:(RFModalTransitionStyle)style
                      configureBlock:(RFModuleConfigurationBlock)configureBlock;

/**
 Present module modally over full screen. Transition animation defaults to RFModalTransitionStyleSystem. For different kind of animation use -presentModule:style:configureBlock:
 
 @param module Module to present.
 @param configureBlock Configure module if needed.
 @return Module that is beeing presented.
 */
- (id <RFViperModule>) presentModule:(id<RFModule>)module
                      configureBlock:(RFModuleConfigurationBlock)configureBlock;


/**
 Present module modally over full screen. Convinience method without any customizations.
 
 @param module Module to present.
 @return Module that is beeing presented.
 */
- (id <RFViperModule>) presentModule:(id<RFModule>)module;




- (id <RFViperModule>) presentTabModule:(id<RFModule>)module
                          containerView:(UIView *)containerView
                              direction:(NSUInteger)direction
                         configureBlock:(RFModuleConfigurationBlock)configureBlock;


- (id <RFViperModule>) presentModule:(id<RFModule>)module
                     inContainerView:(UIView *)view
                      configureBlock:(RFModuleConfigurationBlock)configureBlock;


- (id <RFViperModule>)pushModuleToNavigation:(id<RFModule>)module
                              configureBlock:(RFModuleConfigurationBlock)configureBlock
                                    animated:(BOOL)animated;
- (id <RFViperModule>)pushModuleToNavigation:(id<RFModule>)module
                              configureBlock:(RFModuleConfigurationBlock)configureBlock;
- (id <RFViperModule>)pushModuleToNavigation:(id<RFModule>)module;


- (id <RFViperModule>)pushModule:(id<RFModule>)module
                    toNavigation:(UINavigationController *)navigation
                  configureBlock:(RFModuleConfigurationBlock)configureBlock
                        animated:(BOOL)animated;
- (id <RFViperModule>)pushModule:(id<RFModule>)module
					toNavigation:(UINavigationController *)navigation
				  configureBlock:(RFModuleConfigurationBlock)configureBlock;


- (id<RFViperModule>)openBottomShade:(id<RFModule>)module
                      withNavigation:(BOOL)navigation
                      configureBlock:(RFModuleConfigurationBlock)configureBlock;
- (id<RFViperModule>)openBottomShade:(id<RFModule>)module
                      configureBlock:(RFModuleConfigurationBlock)configureBlock;
- (id<RFViperModule>)openBottomShade:(id<RFViperModule>)module;



- (UIViewController <RFViperModuleView> *) openModule:(UIViewController <RFViperModuleView> *)moduleView
                                               forDDM:(RFCollectionViewDataDisplayManager *)dataManager
                                       configureBlock:(RFModuleConfigurationBlock)configureBlock;

- (UIViewController <RFViperModuleView> *) openModule:(UIViewController <RFViperModuleView> *)moduleView
                                               forDDM:(RFCollectionViewDataDisplayManager *)dataManager
                                       cellIdentifier:(NSString *)cellIdentifier
                                       configureBlock:(RFModuleConfigurationBlock)configureBlock;

- (void) dissmissCurrentModule:(BOOL)animated;

@end
