//
//  ViewController.swift
//  RFModule
//
//  Created by Golofaev on 03/17/2018.
//  Copyright (c) 2018 Golofaev. All rights reserved.
//

import UIKit

@objc
class ViewController: UIViewController {

    @objc public var delegate: AnyObject?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.gray
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

