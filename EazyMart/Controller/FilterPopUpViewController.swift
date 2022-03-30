//
//  FilterPopUpViewController.swift
//  EazyMart
//
//  Created by Mohammed Rishan on 24/03/22.
//

import UIKit

//Mark:- Protocol to pass filtered data
protocol FilterCategory {
    func filterAndSort(category: [String])
}

//Mark:- Filter Products
class FilterPopUpViewController: UIViewController {
    
    @IBOutlet weak var opaqueBgView: UIView!
    @IBOutlet weak var filterView: UIView!
    @IBOutlet weak var filterDismissView: UIView!
    @IBOutlet weak var frozenCheckBtn: CheckBox!
    @IBOutlet weak var drinkCheckBtn: CheckBox!
    @IBOutlet weak var dairyCheckBtn: CheckBox!
    @IBOutlet weak var gloceryCheckBtn: CheckBox!
    @IBOutlet weak var sweetCheckBtn: CheckBox!
    @IBOutlet weak var fruitCheckBtn: CheckBox!
    
    var prodDetail: [Product]?
    
    var selectedRadio: String = ""
    var selectedTypes: [String] = []
    
    var filterDelegate: FilterCategory?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        didLoadView()
    }
    
    //Mark:- Add top corner radius Filter pop up
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        filterView.roundCorners(corners: [.topLeft, .topRight], radius: 25)
    }
    
    //Mark:- Design filter viewController
    func didLoadView() {
        filterDismissView.layer.cornerRadius = filterDismissView.layer.bounds.height/2
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismissFilter(_:)))
        opaqueBgView.addGestureRecognizer(tap)
    }
    
    //Mark:- Submit to Filter Type and Price
    @IBAction func submitFilterAction(_ sender: Any) {
        filterDelegate?.filterAndSort(category: selectedTypes)
        self.dismiss(animated: true)
    }
    
    //Mark:- Dismiss Filter POPUP
    @objc func dismissFilter(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: true)
    }
    
    //Mark:- Add and Remove Hot
    @IBAction func frozenBtnAction(_ sender: Any) {
        if !frozenCheckBtn.isChecked {
            selectedTypes.append("Hot")
        }else if frozenCheckBtn.isChecked {
            if let index = selectedTypes.firstIndex(of: "Hot") {
                selectedTypes.remove(at: index)
            }
        }
    }
    
    //Mark:- Add and Remove Drinks
    @IBAction func drinksBtnAction(_ sender: Any) {
        if !drinkCheckBtn.isChecked {
            selectedTypes.append("Drinks")
        }else if drinkCheckBtn.isChecked {
            if let index = selectedTypes.firstIndex(of: "Drinks") {
                selectedTypes.remove(at: index)
            }
        }
    }
    
    //Mark:- Add and Remove Dairy
    @IBAction func dairyBtnAction(_ sender: Any) {
        if !dairyCheckBtn.isChecked {
            selectedTypes.append("Dairy")
        }else if dairyCheckBtn.isChecked {
            if let index = selectedTypes.firstIndex(of: "Dairy") {
                selectedTypes.remove(at: index)
            }
        }
    }
    
    //Mark:- Add and Remove Glocery
    @IBAction func gloceryBtnAction(_ sender: Any) {
        if !gloceryCheckBtn.isChecked {
            selectedTypes.append("Glocery")
        }else if gloceryCheckBtn.isChecked {
            if let index = selectedTypes.firstIndex(of: "Glocery") {
                selectedTypes.remove(at: index)
            }
        }
    }
    
    //Mark:- Add and Remove Sweet
    @IBAction func sweetBtnAction(_ sender: Any) {
        if !sweetCheckBtn.isChecked {
            selectedTypes.append("Sweet")
        }else if sweetCheckBtn.isChecked {
            if let index = selectedTypes.firstIndex(of: "Sweet") {
                selectedTypes.remove(at: index)
            }
        }
    }
    
    //Mark:- Add and Remove Fruit
    @IBAction func fruitBtnAction(_ sender: Any) {
        if !fruitCheckBtn.isChecked {
            selectedTypes.append("Fruit")
        }else if fruitCheckBtn.isChecked {
            if let index = selectedTypes.firstIndex(of: "Fruit") {
                selectedTypes.remove(at: index)
            }
        }
    }
}
