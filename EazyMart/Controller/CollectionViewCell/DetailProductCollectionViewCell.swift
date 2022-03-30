//
//  DetailProductCollectionViewCell.swift
//  EazyMart
//
//  Created by Mohammed Rishan on 23/03/22.
//

import UIKit

//Mark:- CollectionView for Product Details
class DetailProductCollectionViewCell: UICollectionViewCell, UIScrollViewDelegate {
    
    @IBOutlet weak var imageBgView: UIView!
    @IBOutlet weak var productBgView: UIView!
    @IBOutlet weak var productProfileImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var addToCartBtn: UIButton!
    @IBOutlet weak var detailScrollView: UIScrollView!
    @IBOutlet weak var detailPageControl: UIPageControl!
    
    var detailProd: [String] = ["arabian","dominos","kfcresto"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        detailPageControl.numberOfPages = detailProd.count
        setUpImages()
        
        addToCartBtn.layer.borderWidth = 1
        addToCartBtn.layer.borderColor = UIColor.black.cgColor
        
        productProfileImage.layer.cornerRadius = productProfileImage.layer.bounds.height/2
        productBgView.layer.cornerRadius = 5
        
        detailPageControl.addTarget(self, action: #selector(self.changePageOnClick(sender:)), for: .touchDown)
    }
    
    // MARK :- TO CHANGE WHILE CLICKING ON PAGE CONTROL
    @objc func changePageOnClick(sender: UIPageControl) {
        let x = CGFloat(detailPageControl.currentPage) * imageBgView.frame.size.width
        detailScrollView.setContentOffset(CGPoint(x: x, y: 0), animated: true)
    }
    
    // MARK :- To add Image array to scrollView
    func setUpImages() {
        for index in 0..<detailProd.count {
            frame.origin.x = imageBgView.frame.size.width * CGFloat(index)
            frame.size = imageBgView.frame.size
            
            let imgView = UIImageView(frame: frame)
            imgView.contentMode = .scaleAspectFill
            imgView.image = UIImage(named: detailProd[index])
            
            productProfileImage.image = UIImage(named: detailProd[index])
            
            self.detailScrollView.addSubview(imgView)
        }
        detailScrollView.contentSize = CGSize(width: (detailScrollView.frame.size.width * CGFloat(detailProd.count)), height: detailScrollView.frame.size.height)
        detailScrollView.delegate = self
    }
    
    // MARK :- Stop scrollview clicking pagecontrol
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        detailPageControl.currentPage = Int(pageNumber)
    }
}
