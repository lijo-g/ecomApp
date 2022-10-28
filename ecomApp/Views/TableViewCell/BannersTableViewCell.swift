//
//  BannersTableViewCell.swift
//  ecomApp
//
//  Created by ADMIN on 28/10/22.
//

import UIKit

class BannersTableViewCell: UITableViewCell, UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {


    @IBOutlet weak var bannersCollectionView: UICollectionView!
    var banner: [HomeValues]?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.bannersCollectionView.dataSource = self
        self.bannersCollectionView.delegate = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initBanner(value: [HomeValues]){
        self.banner = value
        self.bannersCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let value = self.banner{
            return value.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCollectionViewCell", for: indexPath) as! BannerCollectionViewCell
        
        if let info = self.banner?[indexPath.row]{
            if let imageUrlValue = info.bannerURL{
                let url = URL(string: imageUrlValue)
                cell.bannerImage.kf.setImage(with: url)
            }
        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: (self.frame.width - 10), height: self.frame.height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}
