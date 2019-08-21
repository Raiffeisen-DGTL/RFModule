//
//  RFModuleHandling.swift
//  Pods-RFModule_Example
//
//  Created by RFMacBook on 17.03.2018.
//

import Foundation
import UIKit

@objc
public protocol RFModuleHandling: NSObjectProtocol {
    
    var view: UIViewController? { get set }
    @objc(input)
    weak var inputObjc: AnyObject? { get set }
    
    @objc(moduleOutputBlock)
    var setModuleOutput: ((_ moduleOutput: AnyObject?) -> Void)? { get set }
    
}

public extension RFModuleHandling {
    var input: AnyObject? { get { return inputObjc } set { inputObjc = newValue} }
}


public protocol ModuleHandling: class {
    associatedtype Input
    associatedtype Output
    
    var view: UIViewController? { get set }
    var input: Input? { get set }
    
    var setModuleOutput: ((_ moduleOutput: Output?) -> Void)? { get set }
    
}
