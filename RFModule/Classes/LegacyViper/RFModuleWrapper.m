//
//  RFModuleWrapper.m
//  rmobile
//
//  Created by RFMacBook on 25.05.17.
//  Copyright © 2017 Raiffeisenbank. All rights reserved.
//

#import <objc/runtime.h>
#import "RFModuleWrapper.h"
#import "RFViperTransitionHandler.h"
#import "RFViperModule.h"

@import Utils;

@interface RFModuleWrapper()

@property (nonatomic, strong) UIViewController <RFViperModuleView, RFViperTransitionHandler> *viewController;
@property (nonatomic, weak) NSObject <RFViperModule> *moduleInput;


@end

@implementation RFModuleWrapper

@dynamic view;
@synthesize moduleTransitionBlock=_moduleTransitionBlock;

+ (instancetype)bridge:(id)object {
	if ([object isProxy]) {
		return object;
	}

	id module = [self alloc];

	if ([object isKindOfClass:[UIViewController class]]) {
		[module setViewController:object];
	}
	else if ([object respondsToSelector:@selector(view)]
			 && [[object view] isKindOfClass:[UIViewController class]]) { // i belive this is presenter
		[module setViewController:(id)((id <RFViperModule>)object).view];
	}
	else {
		RFAssert(NO, @"Can't bridge %@ to module", object);
        return nil;
	}

	return module;
}

- (UIViewController<RFViperModuleView, RFViperTransitionHandler> *)view {
	return self.viewController;
}

- (instancetype)initWithStoryboard:(UIStoryboard *)storyboard {
    self.viewController = [storyboard instantiateInitialViewController];
    
    [self didInitialize];
    
    return self;
}

- (instancetype)initWithStoryboard:(UIStoryboard *)storyboard identifier:(NSString *)identifier {
    self.viewController = [storyboard instantiateViewControllerWithIdentifier:identifier];
    
    [self didInitialize];
    
    return self;
}

- (instancetype)initWithViewController:(UIViewController <RFViperModuleView, RFViperTransitionHandler> *)viewController{
    self.viewController = viewController;

    [self didInitialize];

    return self;
}

- (instancetype)initWithFactory:(id)factory selector:(SEL)selector {
    RFAssert([factory respondsToSelector:selector],
             @"Factory %@ does not responds to selector %@",
             factory, NSStringFromSelector(selector));

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    self.viewController = [factory performSelector:selector];
#pragma clang diagnostic pop
    
    [self didInitialize];
    
    return self;
}

- (id<RFViperModule>)moduleInput {
    if (!_moduleInput) {
        if ([self.viewController respondsToSelector:@selector(output)]) {
            _moduleInput = [self.viewController output];
        }
        else {
            _moduleInput = (id) self.viewController;
        }
    }
    return _moduleInput;
}



- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector
{
	if (selector == @selector(setModuleTransitionBlock:)
	|| selector == @selector(moduleTransitionBlock)) {
		return [self methodSignatureForSelector:selector];
	}
	struct objc_method_description hasMethod = protocol_getMethodDescription(@protocol(RFViperModuleAbstract), selector, NO, YES);
	if (hasMethod.name != NULL) {
		return [NSMethodSignature signatureWithObjCTypes:hasMethod.types];
	}

    return [self.moduleInput methodSignatureForSelector:selector];
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
	if (invocation.selector == @selector(setModuleTransitionBlock:)
		|| invocation.selector == @selector(moduleTransitionBlock)) {
		return [invocation invokeWithTarget:self];
	}
	if (invocation.selector == @selector(respondsToSelector:)) {
		SEL selector;
		[invocation getArgument:&selector atIndex:2];
		if (selector == @selector(setModuleTransitionBlock:)
			|| selector == @selector(moduleTransitionBlock)) {
			BOOL b = YES;
			[invocation setReturnValue:&b];
			return;
		}
	}
    [invocation invokeWithTarget:self.moduleInput];
}

#pragma mark - Proxying

RFGenericProxy * moduleProxy(id self, SEL _cmd)
{
    RFGenericProxy *proxy = objc_getAssociatedObject(self, @selector(proxy));
    if (!proxy) {
        proxy = [RFGenericProxy proxy];
        objc_setAssociatedObject(self, @selector(proxy), proxy,
                                 OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return proxy;
}



#pragma makr - DidInit

- (void) didInitialize {

    if (![self.moduleInput respondsToSelector:@selector(proxy)]) {
        class_addMethod([self.moduleInput class],
                        @selector(proxy),
                        (IMP) moduleProxy,
                        "@@:");
    }
    

}

- (void)setModuleTransitionBlock:(RFModuleTransitionBlock)transitionHandlerBlock {
	_moduleTransitionBlock = transitionHandlerBlock;
}


- (void)configureBlock:(void (^)(id<RFViperModule>module, id parameters))block parameters:(id)parameters {
	if (block) {
		block(self, parameters);
	}
}

- (id <RFViperTransitionHandler>)transitionHandler {
    return (id) self.view;
}

@end


@implementation RFModuleWrapper (RFModule)

- (id<ModuleTransitioning>)transition {
    return self.view.rf_transition;
}

- (void)setTransition:(id<ModuleTransitioning>)transition {
    self.view.rf_transition = transition;
}

- (id)appearance {
    return self.view.rf_appearance;
}

- (void)setAppearance:(id)appearance {
    self.view.rf_appearance = appearance;
}

- (id)input {
    return self.moduleInput;
}

- (void)setOutput:(id)output {
    [self setModuleOutput:output];
}

- (id)output {
    return nil;
}

@end
