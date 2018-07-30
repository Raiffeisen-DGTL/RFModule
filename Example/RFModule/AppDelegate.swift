//
//  AppDelegate.swift
//  RFModule
//
//  Created by Golofaev on 03/17/2018.
//  Copyright (c) 2018 Golofaev. All rights reserved.
//

import UIKit
import RFModule

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    lazy var moduleFactory:ModuleBridge = {
        [unowned self] in
        return ModuleFactoryImplementation()
    }()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        self.moduleFactory.register { (instance, handler) -> Bool in
            if  instance is UIViewController {
                handler.view = instance as? UIViewController
                handler.input = instance
                return true
            }
//            if (instance is RFTestMVCModuleViewController) {
//                handler.setModuleOutput = { output in
//                    (instance as! RFTestMVCModuleViewController).delegate = output
//                    }
//            }
            return false
        }

        let module = self.moduleFactory.bridge(ObjCViewController())

        if let vc = module?.view {
            let deadlineTime = DispatchTime.now() + .seconds(2)
            DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
                self.window?.rootViewController?.present(vc, animated: true, completion: {
                    //
                })
            }
        }

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

