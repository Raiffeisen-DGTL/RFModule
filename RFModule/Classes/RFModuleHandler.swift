//
//  RFModuleHandler.swift
//  Pods-RFModule_Example
//
//  Created by RFMacBook on 17.03.2018.
//

import Foundation


@objc
public class RFModuleHandler: NSObject, RFModule, RFModuleHandling {

    @objc
    public var view: UIViewController?

    @objc
    public var transition: RFModuleTransitioning? {
        get {
            return self.view?.rf_transition
        }
        set {
            self.view?.rf_transition = newValue
        }
    }

    @objc
    public var appearance: AnyObject? {
        get {
            return self.view?.rf_appearance
        }
        set {
            self.view?.rf_appearance = newValue
        }
    }

    @objc
    public weak var input: AnyObject?

    @objc
    public weak var output: AnyObject? {
        didSet{
            setModuleOutput?(output)
        }
    }

    @objc
    public var setModuleOutput: ((AnyObject?) -> Void)?

}

