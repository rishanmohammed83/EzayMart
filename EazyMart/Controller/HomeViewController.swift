//
//  HomeViewController.swift
//  EazyMart
//
//  Created by Mohammed Rishan on 23/03/22.
//

import UIKit

//Mark:- List Product details
class HomeViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    @IBOutlet weak var dashboardTableView: UITableView!
    
    var productData : [Product]!
    var dataFilter : [Product] = []
    
    var isFiltered: Bool = false
    var filterTypeArr: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        isFiltered = false
        setNavigationBar()
        registerXib()
        fetchData()
    }
    
    //Mark:- Set NavigationBar and title
    func setNavigationBar(){
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.title = "EazyMart"
    }
    
    //Mark:- TableView Xib register
    func registerXib(){
        dashboardTableView.register(UINib(nibName: "ProductListTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductListTableViewCell")
    }
    
    //Mark:- To popup Filter View
    @IBAction func filterBtnPressed(_ sender: Any) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let popupVC = storyboard.instantiateViewController(withIdentifier: "FilterPopUpViewController") as! FilterPopUpViewController
        popupVC.filterDelegate = self
        popupVC.modalPresentationStyle = .overFullScreen
        self.present(popupVC, animated: true, completion: nil)
    }
    
    //Mark:- Fetch Product Data From Model
    func fetchData() {
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
    
    //Mark:- Filter logic and add to array
    func filterData() {
        dataFilter.removeAll()
        for filterType in self.filterTypeArr {
            let filteredArr = productData.filter({$0.type == filterType})
            dataFilter.append(contentsOf: filteredArr)
        }
        self.isFiltered = true
        self.dashboardTableView.reloadData()
    }
    
}

//Mark:- Filtered Data Assign Here
extension HomeViewController: FilterCategory{
    func filterAndSort(category: [String]) {
        self.filterTypeArr = category
        self.filterData()
    }
}

//Mark:- TableView Delegate and DataSource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltered{
            return dataFilter.count
        }
        return productData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductListTableViewCell", for: indexPath) as! ProductListTableViewCell
        //Mark:- Load Filtered Data to Tableview
        if isFiltered {
            cell.productImage.image = UIImage(named: dataFilter[indexPath.row].image)
            cell.productName.text = dataFilter[indexPath.row].name
            cell.productType.text = dataFilter[indexPath.row].type
            cell.productPrice.text = "Price: \(dataFilter[indexPath.row].prize)"
        }else {
            //Mark:- Load Filtered Data to Tableview
            let divData = productData[indexPath.row]
            cell.productImage.image = UIImage(named: divData.image)
            cell.productName.text = divData.name
            cell.productType.text = divData.type
            cell.productPrice.text = "Price: \(divData.prize)"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
