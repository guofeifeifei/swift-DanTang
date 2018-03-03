//
//  GFTabBarViewController.swift
//  DanTang-swift
//
//  Created by FeiYu on 2018/2/27.
//  Copyright © 2018年 FeiYu. All rights reserved.
//

import UIKit

class GFTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       // let tabBar = UITabBarItem.appearance()
        self.tabBar.tintColor = GFColor(r: 245, g: 90, b: 93, a: 1)
//        tabBar.setTitleTextAttributes([NSAttributedStringKey.foregroundColor : GFHexColor(0x2d2d2d)], for: UIControlState.selected)
//        tabBar.setTitleTextAttributes([NSAttributedStringKey.foregroundColor : GFHexColor(0x9e9e9e)], for: UIControlState.normal)
        self.tabBar.backgroundColor = UIColor.white
        addChildViewControllers()
        
    }
    /**
     * 添加子控制器
     */
    
    private func addChildViewControllers(){
        addChildViewController(DanTangViewController(), "單糖", "TabBar_home_23x23_")
        addChildViewController(ProductViewController(), "單品", "TabBar_gift_23x23_")
        addChildViewController(ClassViewController(), "分类", "TabBar_category_23x23_")
        addChildViewController(MeViewController(), "我的", "TabBar_me_boy_23x23_")
    }
    /**
     # 初始化子控制器
     
     - parameter childControllerName: 需要初始化的控制器
     - parameter title:               标题
     - parameter imageName:           图片名称
     */
    
    private func addChildViewController(_ childController: UIViewController, _ title : String, _ imageName : String) {
        childController.tabBarItem.image = UIImage.init(named: imageName)
        childController.tabBarItem.selectedImage = UIImage.init(named: imageName + "selected")
        childController.title = title
        let navC = GFNavigationController.init(rootViewController: childController)
        addChildViewController(navC)
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
