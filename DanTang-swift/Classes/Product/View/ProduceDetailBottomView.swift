//
//  ProduceDetailBottomView.swift
//  DanTang-swift
//
//  Created by ZZCN77 on 2018/3/6.
//  Copyright © 2018年 ZZCN77. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher
let commentCellID = "commentCellID"
class ProduceDetailBottomView: UIView, UIWebViewDelegate {

    var comments = [Comment]()
    var product: Product? {
        didSet {
          weak var weakSelf = self
            //获取单品详细数据
            GFNetworkTool.shareNetworkTool.loadProductDetailData(id: product!.id!) { (productDetail) in
             weakSelf!.webView.loadHTMLString(productDetail.detail_html!, baseURL: nil)
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    func setupUI(){
       addSubview(webView)
        webView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalTo(self)
        }
    }
    
    private lazy var webView : UIWebView = {
       let webView = UIWebView()
        //自动对页面进行缩放以适合屏幕
        webView.scalesPageToFit = true
        webView.dataDetectorTypes = .all
        webView.delegate = self
        return webView
    }()
    
//    private lazy var detailButtonView : DetailChoiceButtonView = {
//        let choiceButtonView = DetailChoiceButtonView.
//    }
    // MARK: - UIWebViewDelegate
    private func webViewDidStartLoad(webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    private func webViewDidFinishLoad(webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
