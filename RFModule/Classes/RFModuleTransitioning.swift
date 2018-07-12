//
//  RFModuleTransitioning.swift
//  Pods-RFModule_Example
//
//  Created by RFMacBook on 17.03.2018.
//

import Foundation

@objc
public protocol RFModuleTransitioning: AnyObject {

    weak var destination: (UIViewController & RFAppearanceConfigurable)? { get set }

    @objc(performAnimated:completion:)
    func perform(animated: Bool, completion: (() -> Void)?)
    @objc(reverseAnimated:completion:)
    func reverse(animated: Bool, completion: (() -> Void)?)
}
