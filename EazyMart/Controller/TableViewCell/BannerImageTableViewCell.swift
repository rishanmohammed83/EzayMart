//
//  BannerImageTableViewCell.swift
//  EazyMart
//
//  Created by Mohammed Rishan on 23/03/22.
//

import UIKit

//Mark:- TableView for Banner CollectionView
class BannerImageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    
    var hotelData : [Hotel]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        bannerCollectionView.dataSource = self
        bannerCollectionView.delegate = self
        
        registerXib()
        didLoadView()
    }
    
    //Mark:- CollectionView Xib register
    func registerXib() {
        bannerCollectionView.register(UINib(nibName: "BannerImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BannerImageCollectionViewCell")
    }
    
    //Mark:- To fetch hostels list from Hotel Model
    func didLoadView() {
        if let url = Bundle.main.url(forResource: "Hotels", withExtension: "json") {
            do {
                let jsonData = try Data(contentsOf: url)
                hotelData = try! JSONDecoder().decode([Hotel].self, from: jsonData)
                
            } catch {
                print(error)
            }
        } else {
            
        }
    }
    
}

//Mark:- CollectionView Delegate and DataSource
extension BannerImageTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hotelData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerImageCollectionViewCell", for: indexPath) as! BannerImageCollectionViewCell
        
        let divData = hotelData[indexPath.row]
        cell.bannerName.text = divData.name
        cell.bannerImageView.image = UIImage(named: divData.image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.5, height: 130);
    }
}
