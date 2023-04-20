//
//  SectionTableViewCell.swift
//  TableViewSectionDemo
//
//  Created by Kushal Rana on 20/04/23.
//

import UIKit


//var brandName: String?
//var title: String?
//var price: String?
//var thuumbnil: String?
//var modelName: [String]?

class SectionTableViewCell: UITableViewCell {
    
    var brands:MobileBrand? {
        didSet {

            guard let brand = brands else {return}
            
//            if let price = brand.price {
//                priceLabel.text = String (price)
//            }
//            if let storage = brand.storage {
//                storageLabel.text = String(storage)
//            }
            if let thumbnail = brand.thuumbnil {
                itemImageView.kf.setImage(with: URL(string: thumbnail))
                itemImageView.kf.indicatorType = .activity
            }
        }
    }
    
    let itemImageView:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.backgroundColor = .red
        img.clipsToBounds = true
        return img
    }()
    
    
    let itemTitleLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        //label.backgroundColor = .green
        label.text = "title label"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
     
    let priceLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        //label.backgroundColor = .green
        label.text = "₹ 2020"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let storageLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        //label.backgroundColor = .green
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style:UITableViewCell.CellStyle, reuseIdentifier:String? ){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviewsOnView()
        addViewsConstraints()
       
    }
    
    func addSubviewsOnView() {
        self.contentView.addSubview(itemImageView)
        self.contentView.addSubview(itemTitleLabel)
        self.contentView.addSubview(priceLabel)
        self.contentView.addSubview(storageLabel)
    }
    
    
    func addViewsConstraints() {
        
        itemImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
        itemImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        itemImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        itemImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        itemTitleLabel.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 10).isActive = true
        itemTitleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true
        itemTitleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        itemTitleLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        priceLabel.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 10).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true
        priceLabel.topAnchor.constraint(equalTo: itemTitleLabel.bottomAnchor, constant: 10).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        storageLabel.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 10).isActive = true
        storageLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true
        storageLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 10).isActive = true
        storageLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
