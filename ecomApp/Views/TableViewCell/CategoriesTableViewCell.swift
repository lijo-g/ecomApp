//
//  CategoriesTableViewCell.swift
//  ecomApp
//
//  Created by ADMIN on 28/10/22.
//

import UIKit
import Kingfisher

class CategoriesTableViewCell: UITableViewCell,UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
 
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
 
    var categories: [HomeValues]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.categoriesCollectionView.dataSource = self
        self.categoriesCollectionView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initCategory(value: [HomeValues]){
        self.categories = value
        self.categoriesCollectionView.reloadData()
    }
    
    func random() -> UIColor {
            return UIColor(red: .random(in: 0...1),
                           green: .random(in: 0...1),
                           blue: .random(in: 0...1),
                           alpha: 1.0)
        }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let value = self.categories{
            return value.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        
        if let info = self.categories?[indexPath.row]{
            if let imageUrlValue = info.imageURL{
                let url = URL(string: imageUrlValue)
                cell.categoryImage.kf.setImage(with: url)
            }
            cell.categoryTitle.text = info.name
            cell.imageParentView.backgroundColor = random()
            cell.imageParentView.layer.cornerRadius = cell.imageParentView.layer.bounds.width / 2
        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize.init(width: 95, height: 120)
    }
}
