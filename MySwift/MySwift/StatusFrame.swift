//
//  StatusFrame.swift
//  MySwift
//
//  Created by 周峰 on 16/7/18.
//  Copyright © 2016年 zhoufeng. All rights reserved.
//

import UIKit

let margin: CGFloat = 10

let nameFont: CGFloat = 14

let statusFont: CGFloat = 15

let screenWidth = UIScreen.mainScreen().bounds.width

class StatusFrame: NSObject {

    var status: Status? {
        didSet {
            setFrame()
        }
    }
    
    var iconImageFrame: CGRect?
    var nameFrame: CGRect?
    var statusFrame: CGRect?
    var photoFrame: CGRect?
    var timeFrame: CGRect?
    var fromFrame: CGRect?
    var cellHeight: CGFloat?
    
    func setFrame() {
        iconImageFrame = CGRectMake(margin, margin, 50, 50);
        
        let nameSize = status?.name?.size(UIFont.systemFontOfSize(nameFont))
        let timeSize = status?.time?.size(UIFont.systemFontOfSize(nameFont))
        let fromSize = status?.from?.size(UIFont.systemFontOfSize(nameFont))
        nameFrame = CGRectMake(CGRectGetMaxX(iconImageFrame!)+margin, margin, (nameSize?.width)!, (nameSize?.height)!)
        timeFrame = CGRectMake(CGRectGetMaxX(iconImageFrame!)+margin, CGRectGetMaxY(iconImageFrame!)-(timeSize?.height)!, (timeSize?.width)!, (timeSize?.height)!)
        fromFrame = CGRectMake(CGRectGetMaxX(timeFrame!)+5, timeFrame!.origin.y, (fromSize?.width)!, (fromSize?.height)!)
        
        let statusSize = status?.status?.size(UIFont.systemFontOfSize(statusFont), constrainedToSize: CGSizeMake(screenWidth-2*margin, CGFloat(MAXFLOAT)))
        statusFrame = CGRectMake(margin, CGRectGetMaxY(iconImageFrame!)+5, (statusSize?.width)!, (statusSize?.height)!)
        
        if status?.photo != nil {
            photoFrame = CGRectMake(margin, CGRectGetMaxY(statusFrame!)+5, screenWidth-2*margin, screenWidth*0.55)
            cellHeight = CGRectGetMaxY(photoFrame!)+margin
        }else {
            cellHeight = CGRectGetMaxY(statusFrame!)+margin
        }
        
    }
    
}
