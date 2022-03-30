//
//  RadioButton.swift
//  EazyMart
//
//  Created by Mohammed Rishan on 28/03/22.
//

import UIKit

//Mark:- Class to add radioButton
class RadioButton: UIButton {
    var buttonsArray: [UIButton]! {
        didSet {
            for b in buttonsArray {
                b.setImage(UIImage(systemName: "circle.dashed"), for: .normal)
                b.setImage(UIImage(systemName: "circle.dashed.inset.filled"), for: .selected)
            }
        }
    }
    var selectedButton: UIButton?
    var defaultButton: UIButton = UIButton() {
        didSet {
            buttonArrayUpdated(buttonSelected: self.defaultButton)
        }
    }

    func buttonArrayUpdated(buttonSelected: UIButton) {
        for b in buttonsArray {
            if buttonSelected.tag == 1 {
                if b == buttonSelected {
                    selectedButton = b
                    b.isSelected = true
                } else {
                    b.isSelected = false
                }
            }
        }
    }
}
