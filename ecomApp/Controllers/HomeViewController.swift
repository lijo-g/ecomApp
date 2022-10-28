//
//  HomeViewController.swift
//  ecomApp
//
//  Created by ADMIN on 28/10/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var homeDataTable: UITableView!
    
    var homeViewModel: HomeViewModel!
    
    var categories: [HomeValues]?
    var banner: [HomeValues]?
    var products: [HomeValues]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeDataTable.dataSource = self
        self.homeDataTable.delegate = self
        self.homeDataTable.isHidden = true
        homeDataApiCall()
    }
    

   func homeDataApiCall(){
        self.homeViewModel = HomeViewModel()
    self.homeViewModel.bindHomeViewModelToController = {
        
      
        DispatchQueue.main.async {
            if let valueContain = self.homeViewModel.homedata{
     
            for value in valueContain{
                if  value.type == "category"{
                    self.categories = valueContain[0].homeValues
                }
                if  value.type == "banners"{
                    self.banner = valueContain[1].homeValues
                }
                if  value.type == "products"{
                    self.products = valueContain[2].homeValues
                }
            }
            }
            self.homeDataTable.reloadData()
            self.homeDataTable.isHidden = false
        }
        }
    }
}

extension HomeViewController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let noOfRows = 3
        return noOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell0 = tableView.dequeueReusableCell(withIdentifier: "CategoriesTableViewCell", for: indexPath) as! CategoriesTableViewCell
            if let categoryValue = self.categories{
            cell0.initCategory(value: categoryValue)
            }
            return cell0
        case 1:
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "BannersTableViewCell", for: indexPath) as! BannersTableViewCell
            if let bannerValue = self.banner{
            cell1.initBanner(value: bannerValue)
            }
        return cell1
        
        case 2:
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "ProductsTableViewCell", for: indexPath) as! ProductsTableViewCell
            if let productValue = self.products{
            cell2.initProduct(value: productValue)
            }
        return cell2
        default:
            return UITableViewCell()
        }
     
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            if let value = categories{
                if value.count > 0 {
                    return 130
                }
            }
            return 0
        case 1:
            if let value = banner{
                if value.count > 0 {
                    return 210
                }
            }
            return 0
        case 2:
            if let value = products{
                if value.count > 0 {
                    return 285
                }
            }
            return 0
        default:
            return CGFloat()
        }
    }
    
    
    
}
