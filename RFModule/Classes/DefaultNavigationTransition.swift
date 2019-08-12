//
//  DefaultNavigationTransition.swift
//  RMobile
//
//  Created by RFMacBook on 16.04.2018.
//  Copyright © 2018 Raiffeisenbank. All rights reserved.
//

import Foundation

@objc
public class DefaultNavigationTransition: NSObject, ModuleTransitioning {

    public var source: UIViewController? {
        return self.navigation?.topViewController
    }

    @objc
    public weak var destination: (UIViewController & AppearanceConfigurable)?

    @objc
    public weak var navigation: UINavigationController?

    // MARK: - Transition Action
    public func perform(animated: Bool, completion: (() -> Void)?) {
        guard let destination = self.destination else { return }
        self.navigation?.pushViewController(destination, animated: animated)
        self.navigation?.transitionCoordinator?.animate(alongsideTransition: nil, completion: { _ in
            completion?()
        })
    }

    public func reverse(animated: Bool, completion: (() -> Void)?) {
        self.navigation?.transitionCoordinator?.animate(alongsideTransition: nil, completion: {context in
            if !context.isCancelled {
                completion?()
            }
        })
        self.navigation?.popViewController(animated: animated)
    }
}
