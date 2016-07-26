//
//  FriendsInfo.swift
//  MySwift
//
//  Created by 周峰 on 16/7/25.
//  Copyright © 2016年 zhoufeng. All rights reserved.
//

import UIKit

class FriendsInfo: NSObject {
    
    var icon:String?
    var name:String?
    var photo:String?
    var firstComment:String?
    var secondComment:String?
    var thirdComment:String?
    var isOpen:NSNumber?
    
    init(dict: [String: AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
}
