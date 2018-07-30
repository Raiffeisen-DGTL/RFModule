//
//  RFModuleFactory.swift
//  Pods-RFModule_Example
//
//  Created by RFMacBook on 17.03.2018.
//

import Foundation

@objc
public protocol ModuleFactory: NSObjectProtocol {

    func module(storyboard: UIStoryboard?) -> Module?

    func module(storyboard: UIStoryboard?, identifier: String) -> Module?

    func module(factory: Any?, selector: Selector) -> Module?

    func module(viewController: UIViewController?) -> Module?

}
