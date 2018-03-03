//
//  DetailViewController.swift
//  DanTang-swift
//
//  Created by FeiYu on 2018/3/2.
//  Copyright © 2018年 FeiYu. All rights reserved.
//

import UIKit
import SVProgressHUD

class DetailViewController: GFBaseViewController, UIWebViewDelegate {
    var homeItem : HomeItem?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let webView = UIWebView.init()
        webView.frame = view.bounds
        /// 自动对页面进行缩放以适应屏幕
        webView.scalesPageToFit = true
        webView.dataDetectorTypes = .all
        let url = URL.init(string: (homeItem?.content_url)!)
        let request = URLRequest.init(url: (url)!)
        webView.loadRequest(request)
        webView.delegate = self
        view.addSubview(webView)
        
    }
    func webViewDidStartLoad(_ webView: UIWebView) {
        SVProgressHUD.setStatus("正在加载...")
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        SVProgressHUD.dismiss()
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return true
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
