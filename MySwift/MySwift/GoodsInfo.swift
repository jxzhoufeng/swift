//
//  GoodsInfo.swift
//  MySwift
//
//  Created by 周峰 on 16/7/11.
//  Copyright © 2016年 zhoufeng. All rights reserved.
//

import UIKit

class GoodsInfo: NSObject {

    var imageName:String?
    var goodsName:String?
    var goodsStyle:String?
    var goodsPrice:String?
    var selectState:NSNumber?
    var goodsCount:NSNumber?
    
    init(dict: [String: AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
    
}
