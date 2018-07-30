//
//  RFModuleBridge.swift
//  Pods-RFModule_Example
//
//  Created by RFMacBook on 17.03.2018.
//

import Foundation

@objc
public protocol ModuleBridge: NSObjectProtocol {

    func bridge(_ instance: AnyObject?) -> Module?

    @objc(registerDefinition:)
    func register(definition: @escaping (_ instance: AnyObject, _ handler: ModuleHandling) -> Bool) -> Void

}
