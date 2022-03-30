//
//  SortImageCollectionViewCell.swift
//  EazyMart
//
//  Created by Mohammed Rishan on 23/03/22.
//

import UIKit

//Mark:- CollectionView for sorting product
class SortImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var sortImage: UIImageView!
    @IBOutlet weak var sortLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        sortImage.layer.cornerRadius = sortImage.layer.bounds.height/2
    }
    
}
