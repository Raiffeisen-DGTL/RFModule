//
//  Module.swift
//  Pods-RFModule_Example
//
//  Created by RFMacBook on 17.03.2018.
//

import Foundation
import UIKit

@objc
public protocol RFModule: class {
    
    var view: UIViewController? { get }
    
    var transition: ModuleTransitioning? { get set }
    var appearance: AnyObject? { get set }
    
    var inputObjc: AnyObject? { get }
    var outputObjc: AnyObject? { get set }
    
}


public extension RFModule {
    
    public var input: AnyObject? { return inputObjc }
    
    public var output: AnyObject? { get { return outputObjc } set { outputObjc = newValue} }
}
