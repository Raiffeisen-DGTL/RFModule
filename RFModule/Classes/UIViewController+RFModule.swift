//
//  UIViewController+RFModule.swift
//  Pods-RFModule_Example
//
//  Created by RFMacBook on 17.03.2018.
//

import Foundation

private struct RFModuleUIViewController {
    // Key for objc associated objects.
    @nonobjc static var kTransition = "ru.kModuleTransition"
    @nonobjc static var kAppearance = "ru.kAppearance"
}

@objc
extension UIViewController {

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


