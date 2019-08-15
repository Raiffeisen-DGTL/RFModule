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

@end

@implementation ObjCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor greenColor];


    RFTestMVCModuleViewController *objcVC = [RFTestMVCModuleViewController new];
    ViewController *swiftVC = [ViewController new];
    
    
    id <RFModule> objcModule = [[ModuleHandler alloc] initWithView:objcVC input:objcVC output:nil];
    
    objcModule.moduleOutput = self;
    DefaultPresentTransition *transition = [DefaultPresentTransition new];

    id <RFModule> swiftModule = [[ModuleHandler alloc] initWithView:swiftVC input:swiftVC output:nil];
    swiftModule.moduleOutput = self;

    transition.destination = objcModule.view;
    transition.source = self;
    objcModule.transition = transition;

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [objcModule.transition performAnimated:YES completion:nil];
    });

//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [swiftModule.transition performAnimated:YES completion:nil];
//    });

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
