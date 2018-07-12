//
//  RFModule.swift
//  Pods-RFModule_Example
//
//  Created by RFMacBook on 17.03.2018.
//

import Foundation
import UIKit

@objc
public protocol RFModule: NSObjectProtocol {

    var view: UIViewController? { get }

    var transition: RFModuleTransitioning? { get set }
    var appearance: AnyObject? { get set }

    weak var input: AnyObject? { get }
    weak var output: AnyObject? { get set }
    
}
