//
//  RFModuleHandler.swift
//  Pods-RFModule_Example
//
//  Created by RFMacBook on 17.03.2018.
//

import Foundation


@objc
public class RFModuleHandler: NSObject, RFModule, RFModuleHandling {

    public var view: UIViewController?

    public var transition: RFModuleTransitioning? {
        get {
            return self.view?.rf_transition
        }
        set {
            self.view?.rf_transition = newValue
        }
    }
    
    public var appearance: AnyObject? {
        get {
            return self.view?.rf_appearance
        }
        set {
            self.view?.rf_appearance = newValue
        }
    }

    public weak var input: AnyObject?

    public weak var output: AnyObject? {
        didSet{
            setModuleOutput?(output)
        }
    }

    public var setModuleOutput: ((AnyObject?) -> Void)?

}

