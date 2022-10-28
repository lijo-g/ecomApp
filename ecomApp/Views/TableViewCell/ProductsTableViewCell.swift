//
//  ProductsTableViewCell.swift
//  ecomApp
//
//  Created by ADMIN on 28/10/22.
//

import UIKit

class ProductsTableViewCell: UITableViewCell, UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {


    @IBOutlet weak var productsCollectionView: UICollectionView!
    var products: [HomeValues]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.productsCollectionView.delegate = self
        self.productsCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initProduct(value: [HomeValues]){
        self.products = value
        self.productsCollectionView.reloadData()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let value = self.products{
            return value.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as! ProductCollectionViewCell
        cell.expressImage.isHidden = true
        cell.orginalPrice.isHidden = true
        cell.offerView.isHidden = true
        cell.addButotn.layer.cornerRadius = 5
        if let info = self.products?[indexPath.row]{
            if let imageUrlValue = info.image{
                let url = URL(string: imageUrlValue)
                cell.productImage.kf.setImage(with: url)
            }
            
            cell.title.text = info.name ?? ""
            cell.discountPrice.text = info.offerPrice ?? "0"
            
            
            if let offerV = info.offer{
                cell.offerLabel.text = "\(offerV)% OFF"
                if offerV > 0{
                    cell.offerView.isHidden = false
                }else{
                    cell.offerView.isHidden = true
                }
            }
            
            if let expres = info.isExpress{
                if expres == false{
                    cell.expressImage.isHidden = true
                }else{
                    cell.expressImage.isHidden = false
                }
            }
            
            if let actualPriceV = info.actualPrice{
                let example = NSAttributedString(string: actualPriceV).withStrikeThrough(1)
                cell.orginalPrice.attributedText = example
            }
            
            if let offerPriceV = info.offerPrice{
                cell.discountPrice.text = offerPriceV
            }
            
            if let offerPriceV = info.offerPrice{
                if let actualPriceV = info.actualPrice{
                    if offerPriceV == actualPriceV{
                        cell.orginalPrice.isHidden = true
                    }else{
                        cell.orginalPrice.isHidden = false
                    }
                }
            }
            
            
            
        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 7
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize.init(width: 170, height: 280)
    }

}

extension NSAttributedString {

    /// Returns a new instance of NSAttributedString with same contents and attributes with strike through added.
     /// - Parameter style: value for style you wish to assign to the text.
     /// - Returns: a new instance of NSAttributedString with given strike through.
     func withStrikeThrough(_ style: Int = 1) -> NSAttributedString {
         let attributedString = NSMutableAttributedString(attributedString: self)
         attributedString.addAttribute(.strikethroughStyle,
                                       value: style,
                                       range: NSRange(location: 0, length: string.count))
         return NSAttributedString(attributedString: attributedString)
     }
}
