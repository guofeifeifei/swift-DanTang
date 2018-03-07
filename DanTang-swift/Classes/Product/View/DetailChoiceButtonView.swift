//
//  DetailChoiceButtonView.swift
//  DanTang-swift
//
//  Created by ZZCN77 on 2018/3/7.
//  Copyright © 2018年 ZZCN77. All rights reserved.
//

import UIKit


class DetailChoiceButtonView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupUI(){
        addSubview(detailBtn)
        addSubview(evaluationBtn)
    }

    private lazy var detailBtn : UIButton = {
       let detailBtn = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: KMainWidth/2, height: 44))
        detailBtn.setTitle("商品详情", for: .normal)
        return detailBtn
        
    }()
    
    private lazy var evaluationBtn : UIButton = {
       
        let evaluationBtn = UIButton.init(frame: CGRect.init(x: KMainWidth/2, y: 0, width: KMainWidth/2, height: 44))
        evaluationBtn.setTitle("评论", for: .normal)
//        evaluationBtn.addTarget(self, action: #selector(evaluation:), for: 0 )
        return evaluationBtn
        
    }()
    func evaluation(sender : UIButton) {
    
    }
    
}
