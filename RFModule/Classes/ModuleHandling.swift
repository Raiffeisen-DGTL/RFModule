//
//  RFModuleHandling.swift
//  Pods-RFModule_Example
//
//  Created by RFMacBook on 17.03.2018.
//

import Foundation

@objc
public protocol ModuleHandling: NSObjectProtocol {
    
    var view: UIViewController? { get set }
    weak var input: AnyObject? { get set }
    
    var setModuleOutput: ((_ moduleOutput: AnyObject?) -> Void)? { get set }
    
}
