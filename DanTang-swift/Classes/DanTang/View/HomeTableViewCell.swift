//
//  HomeTableViewCell.swift
//  DanTang-swift
//
//  Created by FeiYu on 2018/3/1.
//  Copyright © 2018年 FeiYu. All rights reserved.
//

import UIKit
import Kingfisher

//protocol GFHomeCellDelegate : NSObjectProtocol {
//    func homeCellDidClickedFavoriteButton(button : UIButton)
//}
class HomeTableViewCell: UITableViewCell {
   // weak var delegate : GFHomeCellDelegate?
    
    @IBOutlet weak var bgImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var favoriteBtn: UIButton!
    
    @IBOutlet weak var placeholderBtn: UIButton!
    
    var homeItem : HomeItem?{
        didSet{
            let url = homeItem!.cover_image_url
            bgImageView.kf.setImage(with: URL.init(string: url!), placeholder: nil, options: nil, progressBlock: nil) { (image, error, cacheType, imageURL) in
                self.placeholderBtn.isHidden = true
            }
            titleLabel.text = homeItem!.title
            let count = String.init( describing: homeItem!.likes_count!)
            favoriteBtn.setTitle( count + " ", for: .normal)
        }
    }

    
//    @IBAction func favoriteButtonClick(_ sender: Any) {
//        
//      //  delegate?.homeCellDidClickedFavoriteButton(button: sender as! UIButton)
//        
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        favoriteBtn.layer.cornerRadius = favoriteBtn.frame.size.height * 0.5
        favoriteBtn.layer.masksToBounds = true
        favoriteBtn.layer.rasterizationScale = UIScreen.main.scale
        favoriteBtn.layer.shouldRasterize = true
        bgImageView.layer.cornerRadius = kCornerRadius
        bgImageView.layer.masksToBounds = true
        bgImageView.layer.shouldRasterize = true
        bgImageView.layer.rasterizationScale = UIScreen.main.scale
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
