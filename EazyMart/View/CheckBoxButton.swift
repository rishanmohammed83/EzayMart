//
//  CheckBoxButton.swift
//  EazyMart
//
//  Created by Mohammed Rishan on 28/03/22.
//

import UIKit

//Mark:- Class to add checkBox
class CheckBox: UIButton {
    // Images
    let checkedImage = UIImage(named: "select")
    let uncheckedImage = UIImage(named: "not-select")
    
    // Bool property
    var isChecked: Bool = false {
        didSet {
            if isChecked == true {
                self.setImage(checkedImage, for: UIControl.State.normal)
            } else {
                self.setImage(uncheckedImage, for: UIControl.State.normal)
            }
        }
    }
    
    override func awakeFromNib() {
        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        self.isChecked = false
    }
    
    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }
    }
}
