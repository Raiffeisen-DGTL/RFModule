//
//  ModuleFactoryImplementation.swift
//  Pods-RFModule_Example
//
//  Created by RFMacBook on 17.03.2018.
//

import Foundation


@objc
public class ModuleFactoryImplementation: NSObject, ModuleFactory, ModuleBridge {

    // MARK: Factory

    public func module(storyboard: UIStoryboard?) -> Module? {
        let viewController = storyboard?.instantiateInitialViewController()
        return self.bridge(viewController)
    }

    public func module(storyboard: UIStoryboard?, identifier: String) -> Module? {
        let viewController = storyboard?.instantiateViewController(withIdentifier: identifier)
        return self.bridge(viewController)
    }

    public func module(factory: Any?, selector: Selector) -> Module? {
        fatalError("needs implementation")
    }

    public func module(viewController: UIViewController?) -> Module? {
        return self.bridge(viewController)
    }

    // MARK: Bridge

    private var definitions = Array<(AnyObject, ModuleHandling) -> Bool>()

    public func bridge(_ instance: AnyObject?) -> Module? {
        var module:Module? = nil

        if let object = instance {
            if object is Module {
                module = object as? Module
            }
            else {
                let handler = ModuleHandler();
                for definition in definitions {
                    if definition(object, handler) {
                        handler.view?.rf_moduleFactory = self
                        break
                    }
                }
                return handler
            }
        }

        return module;
    }

    public func register(definition: @escaping (AnyObject, ModuleHandling) -> Bool) {
        definitions.append(definition)
    }



}
