//
//  ProductCollectionViewCell.swift
//  DanTang-swift
//
//  Created by ZZCN77 on 2018/3/3.
//  Copyright © 2018年 ZZCN77. All rights reserved.
//

import UIKit
import Kingfisher
class ProductCollectionViewCell: UICollectionViewCell {
    
    
    var product : Product?{
        didSet{
            let url = product?.cover_image_url!
            productImageView.kf.setImage(with: URL.init(string: url!), placeholder: nil, options: nil, progressBlock: nil) { (image, error, cacheType, imageURL) in
                self.placeholderBtn.isHidden = true
            }
            likeButton.setTitle(" " + String.init(describing: product!.favorites_count!), for: .normal)
            titleLabel.text = product!.name!
            priceLabel.text = "￥" + String.init(describing: product!.price!)
        }
    }
    
    
    
    @IBOutlet weak var placeholderBtn: UIButton!
    
    @IBOutlet weak var productImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var likeButton: UIButton!
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
