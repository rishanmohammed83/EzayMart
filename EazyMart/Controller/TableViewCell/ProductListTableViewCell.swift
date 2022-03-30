//
//  ProductListTableViewCell.swift
//  EazyMart
//
//  Created by Mohammed Rishan on 23/03/22.
//

import UIKit

//Mark:- TableView for ProductList
class ProductListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productView: UIView!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productType: UILabel!
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var productPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        productView.layer.cornerRadius = 5
        favButton.layer.cornerRadius = favButton.layer.bounds.height/2
    }
    
    //Mark:- Add and remove favorites
    @IBAction func addToFavBtn(_ sender: UIButton) {
        if sender.tag == 0 {
            self.favButton.tintColor = .red
            sender.tag = 1
        }else {
            self.favButton.tintColor = .white
            sender.tag = 0
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
