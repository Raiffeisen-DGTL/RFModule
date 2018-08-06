//
//  RFModuleBridge.swift
//  Pods-RFModule_Example
//
//  Created by RFMacBook on 17.03.2018.
//

import Foundation

@objc(RFModuleBridge)
public protocol ModuleBridge: NSObjectProtocol {

    func bridge(_ instance: AnyObject?) -> RFModule?

    @objc(registerDefinition:)
    func register(definition: @escaping (_ instance: AnyObject, _ handler: RFModuleHandling) -> Bool) -> Void

}
