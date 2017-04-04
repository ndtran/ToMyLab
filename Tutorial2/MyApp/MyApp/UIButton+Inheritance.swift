//
//  UIButton+Inheritance.swift
//  MyApp
//
//  Created by Nicolas Tran on 04.04.17.
//  Copyright © 2017 ToMyLab. All rights reserved.
//

import UIKit

class myButton: UIButton {
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                backgroundColor = UIColor.red
            } else {
                backgroundColor = UIColor.orange
            }
        }
    }
}
