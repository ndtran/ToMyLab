//
//  ViewController.swift
//  MyApp
//
//  Created by Nicolas Tran on 07.03.17.
//  Copyright © 2017 ToMyLab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    let label = UILabel()
    let textfield = UITextField()
    let button = UIButton() // solution 3: let button = myButton()
    let label2 = UILabel()
   
    // MARK: - Initalisation
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let blueColor = UIColor(red: 0.0/255.0, green: 118.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        self.view.backgroundColor = blueColor
        
        /* label */
        self.label.text = "What's your name ?"
        self.label.textColor = UIColor.white
        self.label.textAlignment = .center
        self.label.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        self.label.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.label)
        
        /* textfield */
        self.textfield.placeholder = "information text"
        self.textfield.isSecureTextEntry = false // for password, change to true
        self.textfield.textColor = UIColor.blue
        self.textfield.textAlignment = .center
        self.textfield.backgroundColor = UIColor.white
        self.textfield.borderStyle = .line
        self.textfield.autocorrectionType = .no
        self.textfield.clearButtonMode = .whileEditing
        self.textfield.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.textfield)
        
        /* button */
        self.button.setTitle("confirm", for: .normal)
        self.button.setTitleColor(UIColor.blue, for: .normal)
        self.button.backgroundColor = UIColor.orange
        self.button.layer.borderColor = UIColor.black.cgColor
        self.button.layer.borderWidth = 2
        self.button.layer.cornerRadius = 3
        self.button.translatesAutoresizingMaskIntoConstraints = false
        
        /* to change background color while highlighted:
            1. the easiest is by adding target
            2. use extension UIButton -> see UIButton+extension.swift
            3. use property observer with highlighted property -> see UIButton+Inheritance.swift
         */
        
        // solution 1
        self.button.addTarget(self, action: #selector(self.buttonHighlight), for: .touchDown)
        self.button.addTarget(self, action: #selector(self.buttonNormal), for: .touchUpInside)
        self.button.addTarget(self, action: #selector(self.buttonNormal), for: .touchUpOutside)
        
        // solution 2
        // self.button.setBackgroundColor(color: UIColor.orange, forUIControlState: .normal)
        // self.button.setBackgroundColor(color: UIColor.red, forUIControlState: .highlighted)
        
        // button action
        self.button.addTarget(self, action: #selector(self.buttonAction), for: .touchUpInside)
        
        self.view.addSubview(self.button)
        
        /* label 2 */
        self.label2.textColor = UIColor.black
        self.label2.textAlignment = .center
        self.label2.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        self.label2.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.label2)

        /* constraint */
        let views = ["label": self.label, "textfield": self.textfield, "button": self.button, "label2": self.label2]
        let metrics = ["width150": 150, "high50": 50]
        var constraints = [NSLayoutConstraint]()
        
        /* center all elements */
        constraints.append(NSLayoutConstraint(item: self.label, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.centerX, multiplier: 1.0, constant: 0.0))
        constraints.append(NSLayoutConstraint(item: self.textfield, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.centerX, multiplier: 1.0, constant: 0.0))
        constraints.append(NSLayoutConstraint(item: self.button, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.centerX, multiplier: 1.0, constant: 0.0))
        constraints.append(NSLayoutConstraint(item: self.label2, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.centerX, multiplier: 1.0, constant: 0.0))
        
        /* width of all elements */
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "|-[label]-|", options: [], metrics: metrics, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "[textfield(width150)]", options: [], metrics: metrics, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "[button(width150)]", options: [], metrics: metrics, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "|-[label2]-|", options: [], metrics: metrics, views: views)
        
        /* high and vertical position of all elements */
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-200-[label(high50)]-[textfield(high50)]-[button(high50)]-[label2(high50)]", options: [], metrics: metrics, views: views)
        
        /* active constraint */
        NSLayoutConstraint.activate(constraints)
    }
    
    // MARK: - button action
    
    func buttonHighlight(sender: UIButton) {
        sender.backgroundColor = UIColor.red
    }
    
    func buttonNormal(sender: UIButton) {
        sender.backgroundColor = UIColor.orange
    }
    
    func buttonAction(sender: UIButton) {
        guard let name = self.textfield.text else {
            self.label2.text = ""
            return
        }
        self.label2.text = "Your name is " + name
    }

}

