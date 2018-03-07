//
//  GFNetworkTool.swift
//  DanTang-swift
//
//  Created by FeiYu on 2018/2/27.
//  Copyright © 2018年 FeiYu. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD
import SwiftyJSON
class GFNetworkTool: NSObject {

    //单利
    static let shareNetworkTool = GFNetworkTool.init()
    
    //获取首页数据
    func loadHomeInfo(id : Int, offset : Int,finished : @escaping (_ homeItems : [HomeItem]) -> ())  {
        let url = BASE_URL + "v1/channels/\(id)/items"
        let params = ["gender": 1,
                      "generation": 1,
                      "limit": 50,
                      "offset": offset]
        Alamofire.request(url, method: .get, parameters: params, encoding:  URLEncoding.default, headers: nil).responseJSON { (response) in
            guard response.result.isSuccess else{
                SVProgressHUD.showError(withStatus: "加载失败")
                return
            }
            if let value = response.result.value{
                let dict = JSON.init(value)
                let code = dict["code"].intValue
                let message = dict["message"].stringValue
                guard code == RETURN_OK else{
                    SVProgressHUD.showInfo(withStatus: message)
                    return
                }
                let data = dict["data"].dictionary
                //字典转化模型
                if let items = data!["items"]?.arrayObject{
                    var homeItems = [HomeItem]()
                    for item in items{
                        let homeItem = HomeItem.init(dict: item as! [String : AnyObject])
                        homeItems.append(homeItem)
                    }
                    finished(homeItems)
                }
            }
        }
        
    }
    
    
    //获取首页顶部数据
    func loadHomeTopData(finished:@escaping (_ gf_channels : [GFChannel]) -> ()) {
        let url = BASE_URL + "v2/channels/preset"
        let params = ["gender": 1,
                      "generation": 1]
        
        Alamofire.request(url, method: .get, parameters: params, encoding:  URLEncoding.default, headers: nil).responseJSON { (response) in
            guard response.result.isSuccess else{
                SVProgressHUD.showError(withStatus: "加载失败")
                return
            }
            if let value = response.result.value{
                let dict = JSON.init(value)
                let code = dict["code"].intValue
                let message = dict["message"].stringValue
                guard code == RETURN_OK else{
                    SVProgressHUD.showInfo(withStatus: message)
                    return
                }
                let data = dict["data"].dictionary
                //字典转化模型
                if let channels = data!["channels"]?.arrayObject{
                    var gf_channels = [GFChannel]()
                    for channel in channels{
                        let gf_channel = GFChannel.init(dict: channel as! [String : AnyObject])
                        gf_channels.append(gf_channel)
                    }
                    finished(gf_channels)
                }
            }
        }
    }
    
    
    
    func loadProductData(id : Int, offset : Int, finished:@escaping(_ products : [Product])->()) {
        SVProgressHUD.show(withStatus: "正在加载")
        let url = BASE_URL + "v2/items"
        let params = ["gender": 1,
                     "generation": 1,
                     "limit": 20,
                     "offset": offset]
        
        Alamofire.request(url, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in

            guard response.result.isSuccess else {
                SVProgressHUD.showError(withStatus: "加载失败...")
                return
            }
            if let value = response.result.value {
                let dict = JSON(value)
                let code = dict["code"].intValue
                let message = dict["message"].stringValue
                guard code == RETURN_OK else {
                    SVProgressHUD.showInfo(withStatus: message)
                    return
                }
                SVProgressHUD.dismiss()
                if let data = dict["data"].dictionary {
                    if let items = data["items"]?.arrayObject {
                        var products = [Product]()
                        for item in items {
                            let itemDict = item as! [String : AnyObject]
                            if let itemData = itemDict["data"] {
                                let product = Product.init(dict:  itemData as! [String: AnyObject] as [NSString : AnyObject])
                                products.append(product)
                            }
                        }
                        finished(products)
                    }
                }
            }
        }
        
    }
    
    
    
    
    
    func loadProductDetailData(id : Int, finished : @escaping (_ productDetail : ProductDetail) -> ()) {
        SVProgressHUD.show(withStatus: "正在加载...")
        let url = BASE_URL + "v2/items/\(id)"
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            guard response.result.isSuccess else{
                SVProgressHUD.showError(withStatus: "加载失败")
                return
            }
            if let value = response.result.value{
                let dict = JSON.init(value)
                let code = dict["code"].intValue
                let message = dict["message"].stringValue
                guard code == RETURN_OK else{
                    SVProgressHUD.showInfo(withStatus: message)
                    return
                }
                SVProgressHUD.dismiss()
                if let data = dict["data"].dictionaryObject{
                    let productDetail = ProductDetail.init(dict: data as [String : AnyObject])
                    finished(productDetail)
                }
                
            }
        }
        
    }
    
    
    
    //商品详情 评论
    func loadProductDetailComments(id : Int, finished:@escaping(_ comments : [Comment]) -> ()){
        SVProgressHUD.show(withStatus: "正在加载...")
        let url = BASE_URL + "v2/items/\(id)/comments"
        let params = ["limit": 20,
                      "offset": 0]
        
        Alamofire.request(url, method: .get, parameters: params, encoding:  URLEncoding.default, headers: nil).responseJSON { (response) in
            guard response.result.isSuccess else{
                SVProgressHUD.showError(withStatus: "加载失败")
                return
            }
            
            if let value = response.result.value{
                let dict = JSON.init(value)
                let code = dict["code"].intValue
                let messgae = dict["message"].stringValue
                guard code == RETURN_OK else{
                    SVProgressHUD.showInfo(withStatus: messgae)
                    return
                }
                SVProgressHUD.dismiss()
                if let data = dict["data"].dictionary{
                    if let commentsData = data["comments"]?.arrayObject{
                        var comments = [Comment]()
                        for item in commentsData{
                            let comment = Comment.init(dict: item as! [String : AnyObject])
                            comments.append(comment)
                        }
                        finished(comments)
                    }
                }
            }
            
        }
        
    }
    /*
    //分类界面、顶部、专题合集
    func loadCateoryCollection(limit : Int, finished:@escaping(_ collections : [Collection]) -> ()){
        SVProgressHUD.show(withStatus: "正在加载...")
        let url = BASE_URL + "v1/collections"
        let params = ["limit": limit,
                      "offset": 0]
        
        Alamofire.request(url, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            guard response.result.isSuccess else{
                SVProgressHUD.showError(withStatus: "加载失败...")
                return
                
            }
            if let value = response.result.value{
                let dict = JSON.init(value)
                let code = dict["code"].intValue
                let message = dict["message"].stringValue
                guard code == RETURN_OK else{
                    SVProgressHUD.showInfo(withStatus: message)
                    return
                }
                SVProgressHUD.dismiss()
                if let data = dict["data"].dictionary{
                    if let collectionData = data["collections"]?.arrayObject{
//                        var collections = [Collection]()
//                        for item in collectionData{
//                            let item in collectionData{
//                                let collection = Collection.da
//                            }
//                        }
                    }
                }
                
                
            }
            
            
        }
        
        
        
    }
    */
    
    
}
