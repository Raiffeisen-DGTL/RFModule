//
//  RFModuleHelper.swift
//  AFNetworking
//
//  Created by RFMacBook on 19.03.2018.
//

import Foundation
import RFModule

@objc
public class RFModuleHelper: NSObject {
    
    @objc(configureHandler:withInstance:)
    public static func configure(_ handler: RFModuleHandling, instance: AnyObject) -> Bool {
        if isViper(instance) {
            handler.view = self.getViperViewFromInstance(instance)
            handler.input = self.getViperPresenterFromInstance(instance)
        }
        else if let viewController = instance as? UIViewController {
            handler.view = viewController
            handler.input = instance
            return true
        }
        return false
    }

    private static func isPresenter(_ instance: AnyObject) -> Bool {
        if self.getViewFromPresenter(instance) != nil {
            return true
        }
        return false
    }

    private static func isView(_ instance: AnyObject) -> Bool {
        if let view = instance as? UIViewController {
            if self.viewHasOutputProperty(view) {
                return true
            }
            return false
        }

        return false
    }

    private static func isViper(_ instance: AnyObject) -> Bool {
        return self.isPresenter(instance) || self.isView(instance)
    }

    private static func getViperViewFromInstance(_ instance: AnyObject) -> UIViewController? {
        if self.isView(instance) {
            return instance as? UIViewController
        }
        else if self.isPresenter(instance) {
            return self.getViewFromPresenter(instance)
        }

        return nil
    }

    private static func getViperPresenterFromInstance(_ instance: AnyObject) -> AnyObject? {
        if self.isView(instance) {
            return self.getPresenterFromView(instance as! UIViewController)
        }
        else if self.isPresenter(instance) {
            return instance
        }

        return nil
    }

    private static func getPresenterFromView(_ instance: UIViewController) -> AnyObject? {
        let classMirror = Mirror(reflecting: instance)
        for (name, value) in classMirror.children {
            guard let name = name else { continue }
            if name == "output" {

                let mirrorInstance = Mirror(reflecting: value)

                if mirrorInstance.children.count > 0 {
                    return value as AnyObject
                }

            }
        }
        return nil
    }

    private static func viewHasOutputProperty(_ instance: UIViewController ) -> Bool {
        let classMirror = Mirror(reflecting: instance)
        for (name, _) in classMirror.children {
            guard let name = name else { continue }
            if name == "output" {
                return true
            }
        }
        return false
    }

    private static func getViewFromPresenter(_ instance: AnyObject) -> UIViewController? {
        var view: UIViewController?
        let classMirror = Mirror(reflecting: instance)
        for (name, value) in classMirror.children {
            guard let name = name else { continue }
            if name == "view" && value is UIViewController {
                view = value as? UIViewController
            }
        }
        return view
    }
}
