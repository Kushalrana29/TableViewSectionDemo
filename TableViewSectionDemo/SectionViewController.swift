//
//  SectionViewController.swift
//  TableViewSectionDemo
//
//  Created by Kushal Rana on 20/04/23.
//

import UIKit
import Kingfisher

class SectionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let productTableView = UITableView()
  
    var mobileBrand = [MobileBrand]()
   // var productModelArray = ProductModel(products: [])
    

    override func viewDidLoad() {
        super.viewDidLoad()
       // getDatafromAPI()
        
        mobileBrand.append(MobileBrand.init(brandName: "Apple",
                                            title: "A Reatiler",
                                            price: "Rs - 2030",
                                            storage : ["128 GB","256 GB","64 GB","32 GB","512 GB","16 GB","1 TB","64 GB",],
                                            thuumbnil:"https://i.dummyjson.com/data/products/1/thumbnail.jpg",
                                            modelName: ["iPhone 5s","iPhone 6","iPhone 6s", "iPhone 7+", "iPhone 8", "iPhone 8+", "iPhone 11", "iPhone 11 Pro"]))
        
        mobileBrand.append(MobileBrand.init(brandName: "Samsung",
                                            title: "B Reatiler",
                                            price: "Rs - 3030",
                                            storage : ["128 GB","256 GB","64 GB","32 GB","512 GB","16 GB","1 TB","64 GB",],
                                            thuumbnil:"https://i.dummyjson.com/data/products/2/thumbnail.jpg",
                                            modelName: ["Samsung M Series", "Samsung Galaxy Note 9", "Samsung Galaxy Note 9+", "Samsung Galaxy Note 10", "Samsung Galaxy Note 10 +"]))
        
        mobileBrand.append(MobileBrand.init(brandName: "Mi",
                                            title: "C Reatiler",
                                            price: "Rs - 4030",
                                            storage : ["128 GB","256 GB","64 GB","32 GB","512 GB","16 GB","1 TB","64 GB",],
                                            thuumbnil:"https://i.dummyjson.com/data/products/3/thumbnail.jpg",
                                            modelName: ["Mi Note 7", "Mi Note 7 Pro", "Mi K20"]))
        
        mobileBrand.append(MobileBrand.init(brandName: "Huawei",
                                            title: "D Reatiler",
                                            price: "Rs - 6030",
                                            storage : ["128 GB","256 GB","64 GB","32 GB","512 GB","16 GB","1 TB","64 GB",],
                                            thuumbnil:"https://i.dummyjson.com/data/products/4/thumbnail.jpg",
                                            modelName: ["Huawei Mate 20", "Huawei P30 Pro", "Huawei P10 Plus", "Huawei P20"]))
         
        
        view.backgroundColor = .white
        view.addSubview(productTableView)
        productTableView.backgroundColor = .white
        productTableView.delegate = self
        productTableView.dataSource = self
        
        productTableView.register(SectionTableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        
        addConstarints()

    }
    
//    func getDatafromAPI() {
//        URLSession.shared.fetchData(for: URL_PRODUCT) { (result: Result<ProductModel, Error>) in
//            switch result {
//            case.success(let jsonObject):
//                self.productModelArray.products = jsonObject.products
//                self.productModelArray.products[0].images
//                DispatchQueue.main.async {
//                    self.productTableView.reloadData()
//                }
//                break
//            case . failure(let error):
//                print(error)
//                break
//            }
//
//        }
//    }
//

    
    func addConstarints() {
        
        productTableView.translatesAutoresizingMaskIntoConstraints = false
        productTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        productTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        productTableView.leftAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leftAnchor).isActive = true
        productTableView.rightAnchor.constraint(equalTo:view.safeAreaLayoutGuide.rightAnchor).isActive = true
          
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
           return mobileBrand.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
           let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
           view.backgroundColor =  .lightGray
             
           let lbl = UILabel(frame: CGRect(x: 15, y: 0, width: view.frame.width - 15, height: 40))
           lbl.font = UIFont.systemFont(ofSize: 20)
        
        var str = "\(mobileBrand[section].brandName ?? "") + \(mobileBrand[section].title ?? "")"
            
           lbl.text = str
           view.addSubview(lbl)
           return view
         }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mobileBrand[section].modelName?.count ?? 0
        }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath) as! SectionTableViewCell
        cell.itemTitleLabel.text =  mobileBrand[indexPath.section].modelName?[indexPath.row]
        cell.priceLabel.text  =  mobileBrand[indexPath.section].price
        cell.storageLabel.text = mobileBrand[indexPath.section].storage?[indexPath.row]
        cell.brands = mobileBrand[indexPath.section]
//        cell.brands = mobileBrand[indexPath.section]
//        cell.brands = mobileBrand[indexPath.section]
       
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
           return 40
    }
         
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 100
    }
}


class MobileBrand {
    var brandName: String?
    var title: String?
    var storage : [String]?
    var price: String?
    var thuumbnil: String?
    var modelName: [String]?
    
     
    init(brandName: String,title: String, price: String, storage : [String], thuumbnil: String, modelName: [String] ) {
       self.brandName = brandName
       self.modelName = modelName
       self.title = title
       self.price = price
       self.thuumbnil = thuumbnil
        self.storage = storage
   }
}


/*
 
 -  Create a file for api
 -  create a model class
 -  get the data from the api
 -  print the data insidet the controller call
 -  ssign the array to the model aaray
 -  parse the data over tableview cell
 
 
 
 
 
 
 
 
 
 
 
 
 
 */
