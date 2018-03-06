//
//  ProductDetailViewController.swift
//  DanTang-swift
//
//  Created by ZZCN77 on 2018/3/5.
//  Copyright © 2018年 ZZCN77. All rights reserved.
//

import UIKit
import SnapKit
class ProductDetailViewController: GFBaseViewController, UIScrollViewDelegate{

    var product : Product?
    
    var result : SearchResult?
    
    var type = String()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
         setupUI()
    }
    // 设置导航栏和底部栏
    func setupUI(){
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: #imageLiteral(resourceName: "GiftShare_icon_18x22_"), style: .plain, target: self, action: nil)
        view.addSubview(scollView)
        scollView.product = product
        scollView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalTo(view)
        }
        
        scollView.contentSize = CGSize(width: KMainWidth, height: kMainHeight - 64 - 45 + kMargin + 520)

    }
    
    //scrollVIew
    private lazy var scollView : DetailScrollView = {
        let scrollView = DetailScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
        return scrollView
        
    }()
    
    //底部栏
 
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
