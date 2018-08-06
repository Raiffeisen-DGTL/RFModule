//
//  RFModuleFactory.swift
//  Pods-RFModule_Example
//
//  Created by RFMacBook on 17.03.2018.
//

import Foundation

@objc(RFModuleFactory)
public protocol ModuleFactory: NSObjectProtocol {

    func module(storyboard: UIStoryboard?) -> RFModule?

    func module(storyboard: UIStoryboard?, identifier: String) -> RFModule?

    func module(factory: Any?, selector: Selector) -> RFModule?

    func module(viewController: UIViewController?) -> RFModule?

}
