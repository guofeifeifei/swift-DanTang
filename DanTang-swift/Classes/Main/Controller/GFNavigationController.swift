//
//  GFNavigationController.swift
//  DanTang-swift
//
//  Created by FeiYu on 2018/2/27.
//  Copyright © 2018年 FeiYu. All rights reserved.
//

import UIKit
import SVProgressHUD
class GFNavigationController: UINavigationController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置导航栏标题
        let navBar = UINavigationBar.appearance()
        navBar.barTintColor = GFGlobalRedColor()
        navBar.tintColor = UIColor.white
        navBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white, NSAttributedStringKey.font : UIFont.systemFont(ofSize: 20) ]
        // Do any additional setup after loading the view.
        
        navigationBar.backgroundImage(for: UIBarMetrics.default)
        navigationBar.shadowImage = UIImage.init()
    }

    /**
     # 统一所有控制器导航栏左上角的返回按钮
     # 让所有push进来的控制器，它的导航栏左上角的内容都一样
     # 能拦截所有的push操作
     - parameter viewController: 需要压栈的控制器
     - parameter animated:       是否动画
     */

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
         /// 这时push进来的控制器viewController，不是第一个子控制器（不是根控制器）
        if viewControllers.count > 0 {
            // push 后隐藏 tabbar
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: #imageLiteral(resourceName: "checkUserType_backward_9x15_"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(navigationBackClick))
        }
        super.pushViewController(viewController, animated: true)
    }
    
    //返回方法
    @objc func navigationBackClick() {
        if SVProgressHUD.isVisible() {
            SVProgressHUD.dismiss()
        }
        if UIApplication.shared.isNetworkActivityIndicatorVisible {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
        popViewController(animated: true)
    }
    
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
