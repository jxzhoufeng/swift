//
//  String+Extension.swift
//  WeiBo18
//
//  Created by apple on 15/10/15.
//  Copyright © 2015年 apple. All rights reserved.
//

import Foundation
import UIKit


extension String {
    
    func size(font: UIFont,constrainedToSize: CGSize = CGSizeZero) -> CGSize {
        
        //转成NSString
        let string = self as NSString
        
        //初始化属性
        let attr = [
            NSFontAttributeName: font
        ]
        //调用系统的方法计算大小
        return string.boundingRectWithSize(constrainedToSize, options: [NSStringDrawingOptions.UsesLineFragmentOrigin], attributes: attr, context: nil).size
    }
}
