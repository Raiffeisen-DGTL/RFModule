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
    
    @objc(input)
    var inputObjc: AnyObject? { get }
    @objc(moduleOutput)
    var outputObjc: AnyObject? { get set }
    
}


public extension RFModule {
    
    var input: AnyObject? { return inputObjc }
    
    var output: AnyObject? { get { return outputObjc } set { outputObjc = newValue} }
}
