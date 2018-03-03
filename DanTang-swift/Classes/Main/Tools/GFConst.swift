//
//  GFConst.swift
//  DanTang-swift
//
//  Created by FeiYu on 2018/2/27.
//  Copyright © 2018年 FeiYu. All rights reserved.
//

import UIKit

enum GFTopicType : Int {
    //精选
    case Selection = 4
    //美食
    case Food = 14
    //居家
    case Household = 16
    // 数码
    case Digital = 17
    // 美物
    case GoodThing = 13
    // 杂货
    case Grocery = 22
}
enum GFShareButtonType: Int {
    /// 微信朋友圈
    case WeChatTimeline = 0
    /// 微信好友
    case WeChatSession = 1
    /// 微博
    case Weibo = 2
    /// QQ 空间
    case QZone = 3
    /// QQ 好友
    case QQFriends = 4
    /// 复制链接
    case CopyLink = 5
}

enum GFOtherLoginButtonType: Int {
    /// 微博
    case weiboLogin = 100
    /// 微信
    case weChatLogin = 101
    /// QQ
    case QQLogin = 102
}

// 服务器地址
let BASE_URL = "http://api.dantangapp.com/"
// 第一次启动
let YMFirstLaunch = "firstLaunch"
// 是否登录
let isLogin = "isLogin"
// code 码 200 操作成功
let RETURN_OK = 200
// 间距
let kMargin : CGFloat = 10.0
// 圆角
let kCornerRadius : CGFloat = 5.0
// 线宽
let klineWidth : CGFloat = 1.0
// 首页顶部标签指示条的高度
let kIndicatorViewH : CGFloat = 2.0
// 新特性界面图片数量
let kNewFeatureCount = 4
// 顶部标题的高度
let kTitlesViewH : CGFloat = 35
// 顶部标题的y
let kTitlesViewY : CGFloat =  kMainHeight  == 812 ? 88 : 64
// 动画时长
let kAnimationDuration = 0.25
// 屏幕的宽
let KMainWidth = UIScreen.main.bounds.size.width
// 屏幕的高
let kMainHeight = UIScreen.main.bounds.size.height
// 分类界面 顶部 item 的高
let kitemH : CGFloat = 100
// 分类界面 顶部 item 的宽
let kitemW : CGFloat = 150
/// 我的界面头部图像的高度
let kYMMineHeaderImageHeight : CGFloat = 200
// 分享按钮背景高度
let kTopViewH : CGFloat = 230

func GFHexColor(_ hexColor : Int64) -> UIColor {
    
    let red = ((CGFloat)((hexColor & 0xFF0000) >> 16))/255.0;
    let green = ((CGFloat)((hexColor & 0xFF00) >> 8))/255.0;
    let blue = ((CGFloat)(hexColor & 0xFF))/255.0;
    
    return UIColor(red: red, green: green, blue: blue, alpha: 1)
}

// RGBA的颜色设置
func GFColor(r : CGFloat, g : CGFloat, b : CGFloat, a : CGFloat) -> UIColor{
    return UIColor.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
}

//背景灰色
func GFGlobalColor() -> UIColor {
    return GFColor(r: 240, g: 240, b: 240, a: 1.0)
}

//红色
func GFGlobalRedColor() -> UIColor {
    return GFColor(r: 245, g: 80, b: 83, a: 1.0)
}

//iPhone5
let isIPhone5 = kMainHeight  == 568 ? true : false

//iPhone6
let isIPhone6 = kMainHeight  == 667 ? true : false

//iPhone 6P
let isIPhone6P = kMainHeight  == 736 ? true : false

//iPhone X
let isIPhoneX = kMainHeight  == 812 ? true : false
