//
//  ObjCViewController.m
//  RFModule_Example
//
//  Created by RFMacBook on 17.03.2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

#import "ObjCViewController.h"
#import "RFTestMVCModuleViewController.h"

#import "RFModule_Example-Swift.h"

@import RFModule;



@interface RFTransition : NSObject <ModuleTransitioning>

@property (nonatomic, weak) UIViewController *source;
@property (nonatomic, weak) UIViewController *destination;

@end
@implementation RFTransition

@synthesize source=_source;
- (void)setSource:(UIViewController *)source {
    _source = source;
}
@synthesize destination=_destination;
- (void)setDestination:(UIViewController *)destination {
    _destination = destination;
}

- (void)performAnimated:(BOOL)animated completion:(void (^ _Nullable)(void))completion {
    [self.source presentViewController:self.destination animated:animated completion:^{
        //
    }];
}

- (void)reverseAnimated:(BOOL)animated completion:(void (^ _Nullable)(void))completion {
    [self.destination dismissViewControllerAnimated:animated completion:^{
        //
    }];
}

@end


@interface ObjCViewController ()

@property (nonatomic, strong) id <ModuleBridge> moduleBridge;

@end

@implementation ObjCViewController

- (id<ModuleBridge>)moduleBridge {
    if (!_moduleBridge) {
        _moduleBridge = [ModuleFactoryImplementation new];
    }
    return _moduleBridge;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor greenColor];

    [self.moduleBridge registerDefinition:^BOOL(id instance, id<RFModuleHandling> handler) {
        if ([RFModuleHelper configureHandler:handler withInstance:instance]) {
            return YES;
        }

        if ([instance isKindOfClass:[ViewController class]]) {
            handler.setModuleOutput = ^(id output) {
                [(ViewController *)instance setDelegate:output];
            };
            return YES;
        }

        if ([instance isKindOfClass:[RFTestMVCModuleViewController class]]) {
            handler.setModuleOutput = ^(id output) {
                [(RFTestMVCModuleViewController *) instance setDelegate:output];
            };
            return YES;
        }
        
        return NO;
    }];

    id <RFModule> module = [self.moduleBridge bridge:[RFTestMVCModuleViewController new]];
    module.outputObjc = self;
    DefaultPresentTransition *transition = [DefaultPresentTransition new];

    id <RFModule> swiftModule = [self.moduleBridge bridge:[ViewController new]];
    swiftModule.outputObjc = self;

    transition.destination = module.view;
    transition.source = self;
    
    module.transition = transition;

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [module.transition performAnimated:YES completion:nil];
    });

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
