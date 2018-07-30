//
//  UIViewController+RFModule.swift
//  Pods-RFModule_Example
//
//  Created by RFMacBook on 17.03.2018.
//

import Foundation

fileprivate
struct RFModuleUIViewController {
    // Key for objc associated objects.
    @nonobjc static var kTransition = "ru.kModuleTransition"
    @nonobjc static var kFactory = "ru.kModuleFactory"
    @nonobjc static var kAppearance = "ru.kAppearance"
}

@objc
public extension UIViewController {

    @objc public var rf_transition: ModuleTransitioning? {
        get {
            return objc_getAssociatedObject(self, &RFModuleUIViewController.kTransition) as? ModuleTransitioning
        }
        set {
            objc_setAssociatedObject(self, &RFModuleUIViewController.kTransition, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }

    class WeakBox {
        weak var value: AnyObject?
        init(_ value: AnyObject?) {
            self.value = value
        }
    }

    @objc public var rf_moduleFactory: (ModuleBridge & ModuleFactory)? {
        get {
            let box = objc_getAssociatedObject(self, &RFModuleUIViewController.kFactory) as? WeakBox
            return box?.value as? (ModuleBridge & ModuleFactory)
        }
        set {
            objc_setAssociatedObject(self, &RFModuleUIViewController.kFactory, WeakBox(newValue), objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
}

@objc
extension UIViewController: AppearanceConfigurable {
    @objc public var rf_appearance: AnyObject? {
        get {
            return objc_getAssociatedObject(self, &RFModuleUIViewController.kAppearance) as AnyObject
        }
        set {
            objc_setAssociatedObject(self, &RFModuleUIViewController.kAppearance, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
}


