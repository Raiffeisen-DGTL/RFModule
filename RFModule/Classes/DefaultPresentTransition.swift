//
//  DefaultPresentTransition.swift
//  RMobile
//
//  Created by RFMacBook on 06.04.2018.
//  Copyright © 2018 Raiffeisenbank. All rights reserved.
//

import Foundation

@objc
public class DefaultPresentTransition: NSObject, ModuleTransitioning {

    @objc
    public weak var source: (UIViewController & AppearanceConfigurable)?

    @objc
    public weak var destination: (UIViewController & AppearanceConfigurable)?

    @objc
    public weak var transitioningDelegate: UIViewControllerTransitioningDelegate?

    @objc
    public var modalPresentationStyle: UIModalPresentationStyle = .fullScreen
    @objc
    public var modalTransitionStyle: UIModalTransitionStyle = .coverVertical

    // MARK: - Transition Action

    public func perform(animated: Bool, completion: (() -> Void)?) {
        guard let dst = self.destination else { return }

        dst.transitioningDelegate = self.transitioningDelegate
        dst.modalPresentationStyle = self.modalPresentationStyle
        dst.modalTransitionStyle = self.modalTransitionStyle

        self.source?.present(dst, animated: animated, completion: {
            completion?()
        })
    }

    public func reverse(animated: Bool, completion: (() -> Void)?) {
        guard let source = self.source else { return }
        source.dismiss(animated: animated) {
            completion?()
        }
    }

}
