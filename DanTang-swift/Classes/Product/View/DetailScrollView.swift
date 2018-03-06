//
//  DetailScrollView.swift
//  DanTang-swift
//
//  Created by ZZCN77 on 2018/3/5.
//  Copyright © 2018年 ZZCN77. All rights reserved.
//

import UIKit

class DetailScrollView: UIScrollView {

    var product : Product?{
        didSet{
            topSctrollView.product = product
            bottomScrollView.product = product
            
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupUI() {
        addSubview(topSctrollView)
        addSubview(bottomScrollView)
        
        topSctrollView.snp.makeConstraints { (make) in
            make.left.equalTo(self)
            make.top.equalTo(self)
            make.size.equalTo(CGSize.init(width: KMainWidth, height: 520))
        }
        
        bottomScrollView.snp.makeConstraints { (make) in
            make.left.equalTo(self)
            make.top.equalTo(topSctrollView.snp.bottom).offset(kMargin)
            make.size.equalTo(CGSize.init(width: KMainWidth, height: kMainHeight - 64 - 45))
            
        }
        
    }
    
    
    
    //顶部滚动试图
    private lazy var topSctrollView : DetailScrollViewTopView = {
       let topScrollView = DetailScrollViewTopView()
        topScrollView.backgroundColor = UIColor.white
        return topScrollView
    }()
    
    //底部视图
    private lazy var bottomScrollView : ProduceDetailBottomView = {
        let bottomScrollView = ProduceDetailBottomView()
        bottomScrollView.backgroundColor = UIColor.white
        return bottomScrollView
    }()
    
 
    
}
