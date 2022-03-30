//
//  WhistListViewController.swift
//  EazyMart
//
//  Created by Mohammed Rishan on 23/03/22.
//

import UIKit

//Mark:- List Wishlist details
class WhistListViewController: UIViewController {
    
    @IBOutlet weak var wishlistTableView: UITableView!
    @IBOutlet weak var sortImageCollectionView: UICollectionView!
    
    var productData : [Product]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        sortImageCollectionView.dataSource = self
        sortImageCollectionView.delegate = self
        
        registerXib()
        didLoadSort()
    }
    
    
    func registerXib(){
        //Mark:- TableView Xib register
        wishlistTableView.register(UINib(nibName: "BannerImageTableViewCell", bundle: nil), forCellReuseIdentifier: "BannerImageTableViewCell")
        wishlistTableView.register(UINib(nibName: "DetailProductTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailProductTableViewCell")
        
        //Mark:- CollectionView Xib register
        sortImageCollectionView.register(UINib(nibName: "SortImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SortImageCollectionViewCell")
        
    }
    
    //Mark:- Fetch Product Data From Model
    func didLoadSort() {
        if let url = Bundle.main.url(forResource: "Product", withExtension: "json") {
            do {
                let jsonData = try Data(contentsOf: url)
                productData = try! JSONDecoder().decode([Product].self, from: jsonData)
                
            } catch {
                print(error)
            }
        } else {
            let alert = UIAlertController(title: "Alert", message: "Data not found", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
//Mark:- TableView Delegate and DataSource
extension WhistListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BannerImageTableViewCell", for: indexPath) as! BannerImageTableViewCell
            return cell
            
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailProductTableViewCell", for: indexPath) as! DetailProductTableViewCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 150
        }else {
            return tableView.bounds.size.height - 150
        }
    }
}
//Mark:- CollectionView Delegate and DataSource
extension WhistListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SortImageCollectionViewCell", for: indexPath) as! SortImageCollectionViewCell
        let divData = productData[indexPath.row]
        cell.sortImage.image = UIImage(named: divData.image)
        cell.sortLabel.text = divData.name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/4.5, height: 90);
    }
}
