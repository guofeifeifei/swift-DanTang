//
//  GFChannel.swift
//  DanTang-swift
//
//  Created by FeiYu on 2018/2/27.
//  Copyright © 2018年 FeiYu. All rights reserved.
//

import UIKit

class GFChannel: NSObject {
    var editable : Bool?
    var id : Int?
    var name : String?
    init(dict : [String : AnyObject]) {
        id = dict["id"] as? Int
        name = dict["name"] as? String
        editable = dict["editable"] as? Bool
    }
    
    
    
    
}
