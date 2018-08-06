//
//  ModuleHandler.swift
//  Pods-RFModule_Example
//
//  Created by RFMacBook on 17.03.2018.
//

import Foundation


@objc
public class ModuleHandler: NSObject, RFModule, RFModuleHandling {

    @objc
    public var view: UIViewController?

    @objc
    public var transition: ModuleTransitioning? {
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

    @objc(input)
    public weak var inputObjc: AnyObject?

    @objc(output)
    public weak var outputObjc: AnyObject? {
        didSet{
            setModuleOutput?(output)
        }
    }

    @objc
    public var setModuleOutput: ((AnyObject?) -> Void)?

}

public class Module<I: Any, O: Any>: RFModule, ModuleHandling {
    public typealias Input = I
    public typealias Output = O
    
    
    public var input: I? { get { return inputObjc as? I} set { inputObjc = newValue as AnyObject }}
    public var output: O? { get { return outputObjc as? O} set { outputObjc = newValue as AnyObject }}
    
    @objc(input)
    public weak var inputObjc: AnyObject?
    @objc(output)
    public weak var outputObjc: AnyObject? {
        didSet{
            setModuleOutput?(output)
        }
    }
    
    public var setModuleOutput: ((O?) -> Void)?
    
    
    public var view: UIViewController?
    
    
    public var transition: ModuleTransitioning? {
        get {
            return self.view?.rf_transition
        }
        set {
            self.view?.rf_transition = newValue
        }
    }
    
    public init(view: UIViewController, input: I, setModuleOutput: ((O?) -> Void)?) {
        self.view = view
        self.input = input
        self.setModuleOutput = setModuleOutput
    }
    
    public var appearance: AnyObject? {
        get {
            return self.view?.rf_appearance
        }
        set {
            self.view?.rf_appearance = newValue
        }
    }
}
