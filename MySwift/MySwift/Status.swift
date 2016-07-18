//
//  Status.swift
//  MySwift
//
//  Created by 周峰 on 16/7/18.
//  Copyright © 2016年 zhoufeng. All rights reserved.
//

import UIKit

class Status: NSObject {

    var iconImage: String?
    var name: String?
    var status: String?
    var photo: String?
    var time: String?
    var from: String?
    
    init(dict: [String: AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
    }
}
