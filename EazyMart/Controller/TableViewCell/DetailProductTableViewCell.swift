//
//  DetailProductTableViewCell.swift
//  EazyMart
//
//  Created by Mohammed Rishan on 23/03/22.
//

import UIKit

//Mark:- TableView for Product Detail CollectionView
class DetailProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var detailProductCollectionView: UICollectionView!
    
    var dishData : [Dish]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        detailProductCollectionView.dataSource = self
        detailProductCollectionView.delegate = self
        
        registerXib()
        fetchData()
    }
    
    //Mark:- CollectionView Xib register
    func registerXib() {
        detailProductCollectionView.register(UINib(nibName: "DetailProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DetailProductCollectionViewCell")
    }
    
    //Mark:- Fetch Dish Data From Model
    func fetchData() {
        if let url = Bundle.main.url(forResource: "Dish", withExtension: "json") {
            do {
                let jsonData = try Data(contentsOf: url)
                dishData = try! JSONDecoder().decode([Dish].self, from: jsonData)
                
            } catch {
                print(error)
            }
        } else {
            
        }
    }
}

//Mark:- CollectionView Delegate and DataSource
extension DetailProductTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dishData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailProductCollectionViewCell", for: indexPath) as! DetailProductCollectionViewCell
        
        let divData = dishData[indexPath.row]
        cell.productNameLabel.text = divData.name
        cell.productDescriptionLabel.text = divData.type
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width/2) - 5, height: 250);
    }
}

