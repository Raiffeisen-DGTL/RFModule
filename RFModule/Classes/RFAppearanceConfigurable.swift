//
//  RFAppearanceConfigurable.swift
//  AFNetworking
//
//  Created by Roman Golofaev on 18/06/2018.
//

import Foundation


@objc
public protocol RFAppearanceConfigurable: NSObjectProtocol {
    var rf_appearance: AnyObject? { get set }
}
