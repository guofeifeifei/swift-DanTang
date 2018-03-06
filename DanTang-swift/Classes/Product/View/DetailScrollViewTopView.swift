//
//  DetailScrollViewTopView.swift
//  DanTang-swift
//
//  Created by ZZCN77 on 2018/3/6.
//  Copyright © 2018年 ZZCN77. All rights reserved.
//

import UIKit
import LLCycleScrollView
let detailCollectionViewCellID = "detailCollectionViewCellID"

class DetailScrollViewTopView: UIView {
    
    var imageURLs = [String]()
    
    var product: Product? {
        didSet {
          imageURLs = product!.image_urls!
            bannerView.imagePaths = imageURLs
            titleLable.text = product!.name
            priceLable.text = "￥\(product!.price!)"
            describeLable.text = product!.describe
            
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(bannerView)
        
        addSubview(titleLable)
        addSubview(priceLable)
        addSubview(describeLable)
        
        titleLable.snp.makeConstraints { (make) in
            make.top.equalTo(bannerView.snp.bottom).offset(5)
            make.left.equalTo(self).offset(5)
            make.right.equalTo(self.snp.right).offset(-5)
            make.height.equalTo(30)
        }
        
        priceLable.snp.makeConstraints { (make) in
            make.left.equalTo(titleLable.snp.left)
            make.right.equalTo(titleLable.snp.right)
            make.top.equalTo(titleLable.snp.bottom).offset(5)
            make.height.equalTo(25)
            
        }

        describeLable.snp.makeConstraints { (make) in
            make.left.equalTo(priceLable.snp.left)
            make.right.equalTo(priceLable.snp.right)
            make.top.equalTo(priceLable.snp.bottom).offset(5)
            make.bottom.equalTo(self.snp.bottom).offset(-5)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var bannerView : LLCycleScrollView = {
        
        let bannerView = LLCycleScrollView.llCycleScrollViewWithFrame(CGRect.init(x: 0, y: 0, width: KMainWidth, height: 375))
        //是否自动滚动
        bannerView.autoScroll =  true
        //是否无限循环
        bannerView.infiniteLoop = true
        //滚动时间间隔
        bannerView.autoScrollTimeInterval = 2
        //等待数据状态显示的占位图
        bannerView.placeHolderImage = UIImage.init(named: "PlaceHolderImage_small_31x26_")
        //图片显示方式
        bannerView.imageViewContentMode = .scaleToFill
        
        //设置滚动方式
        bannerView.scrollDirection = .horizontal
        //设置pageControl 的样式
        bannerView.customPageControlStyle = .snake
        // 非.system的状态下，设置PageControl的tintColor
        bannerView.customPageControlInActiveTintColor = UIColor.gray
        // 设置.system系统的UIPageControl当前显示的颜色
        bannerView.pageControlCurrentPageColor = UIColor.white
        // 非.system的状态下，设置PageControl的间距(默认为8.0)
        bannerView.customPageControlIndicatorPadding = 8.0
        // 设置PageControl的位置 (.left, .right 默认为.center)
        bannerView.pageControlPosition = .center
        // 背景色
        bannerView.collectionViewBackgroundColor = UIColor.white
        // 模拟网络图片获取
       // DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(2)) {
//            bannerView.imagePaths = imageURLs
       // }
        
        return bannerView
    }()
    
    //标题
    private lazy var titleLable : UILabel = {
       
        let titleLable = UILabel()
        titleLable.numberOfLines = 0
        titleLable.textColor = UIColor.black
        return titleLable
    }()
    
    //标签
    private lazy var priceLable : UILabel = {
        let priceLable = UILabel()
        priceLable.numberOfLines = 0
        priceLable.textColor = GFGlobalRedColor()
        priceLable.font = UIFont.systemFont(ofSize: 16)
       return priceLable
    }()
    //描述
    private lazy var describeLable : UILabel = {
       
        let describeLable = UILabel()
        describeLable.numberOfLines = 0
        describeLable.textColor = GFColor(r: 0, g: 0, b: 0, a: 0.6)
        describeLable.font =  UIFont.systemFont(ofSize: 15)
        return describeLable
    }()
    
    
}
