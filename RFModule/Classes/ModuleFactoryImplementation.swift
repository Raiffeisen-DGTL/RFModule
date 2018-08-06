//
//  ModuleFactoryImplementation.swift
//  Pods-RFModule_Example
//
//  Created by RFMacBook on 17.03.2018.
//

import Foundation


@objc(RFModuleFactoryImplementation)
public class ModuleFactoryImplementation: NSObject, ModuleFactory, ModuleBridge {

    // MARK: Factory

    public func module(storyboard: UIStoryboard?) -> RFModule? {
        let viewController = storyboard?.instantiateInitialViewController()
        return self.bridge(viewController)
    }

    public func module(storyboard: UIStoryboard?, identifier: String) -> RFModule? {
        let viewController = storyboard?.instantiateViewController(withIdentifier: identifier)
        return self.bridge(viewController)
    }

    public func module(factory: Any?, selector: Selector) -> RFModule? {
        fatalError("needs implementation")
    }

    public func module(viewController: UIViewController?) -> RFModule? {
        return self.bridge(viewController)
    }

    // MARK: Bridge

    private var definitions = Array<(AnyObject, RFModuleHandling) -> Bool>()

    public func bridge(_ instance: AnyObject?) -> RFModule? {
        var module:RFModule? = nil

        if let object = instance {
            if object is RFModule {
                module = object as? RFModule
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

    public func register(definition: @escaping (AnyObject, RFModuleHandling) -> Bool) {
        definitions.append(definition)
    }



}
