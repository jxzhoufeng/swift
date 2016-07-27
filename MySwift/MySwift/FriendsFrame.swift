//
//  FriendsFrame.swift
//  MySwift
//
//  Created by 周峰 on 16/7/26.
//  Copyright © 2016年 zhoufeng. All rights reserved.
//

import UIKit

class FriendsFrame: NSObject {
    
    var friendsInfo: FriendsInfo? {
        didSet {
            setFrame()
        }
    }
    
    var backViewFrame: CGRect?
    var iconImageViewFrame: CGRect?
    var nameLabelFrame: CGRect?
    var photoImageViewFrame: CGRect?
    var showRightViewFrame: CGRect?
    var likeButtonFrame: CGRect?
    var commentButtonFrame: CGRect?
    
    var commentViewFrame: CGRect?
    var commentLineFrame: CGRect?
    var commentLabel1Frame: CGRect?
    var commentLabel2Frame: CGRect?
    var commentLabel3Frame: CGRect?
    var moreCommentFrame: CGRect?
    
    var cellHeight: CGFloat?
    
    func setFrame() {
        
        let commentLabel1Size = friendsInfo?.firstComment!.size(UIFont.systemFontOfSize(nameFont), constrainedToSize: CGSizeMake(screenWidth-20, CGFloat(MAXFLOAT)))
        let commentLabel2Size = friendsInfo?.secondComment!.size(UIFont.systemFontOfSize(nameFont), constrainedToSize: CGSizeMake(screenWidth-20, CGFloat(MAXFLOAT)))
        let commentLabel3Size = friendsInfo?.thirdComment!.size(UIFont.systemFontOfSize(nameFont), constrainedToSize: CGSizeMake(screenWidth-20, CGFloat(MAXFLOAT)))
        
        iconImageViewFrame = CGRectMake(10, 5, 35, 35)
        nameLabelFrame = CGRectMake(iconImageViewFrame!.maxX+10, 5, screenWidth-iconImageViewFrame!.maxX-10-50, (iconImageViewFrame?.height)!)
        showRightViewFrame = CGRectMake(screenWidth-50, 0, 50, iconImageViewFrame!.maxY+5)
        photoImageViewFrame = CGRectMake(0, iconImageViewFrame!.maxY+5, screenWidth, screenWidth*0.59)
        likeButtonFrame = CGRectMake(10, (photoImageViewFrame?.maxY)!, 100, 30)
        commentButtonFrame = CGRectMake(screenWidth-30-10, photoImageViewFrame!.maxY, 30, 30)
        backViewFrame = CGRectMake(0, 0, screenWidth, commentButtonFrame!.maxY)
        cellHeight = (backViewFrame?.maxY)!+5
        if friendsInfo!.isOpen!.isEqualToNumber(NSNumber(int: 1)) {
            commentLineFrame = CGRectMake(10, 0, screenWidth-20, 1)
            commentLabel1Frame = CGRectMake(10, commentLineFrame!.maxY+10, commentLineFrame!.width, (commentLabel1Size?.height)!)
            commentLabel2Frame = CGRectMake(10, commentLabel1Frame!.maxY+10, commentLineFrame!.width, (commentLabel2Size?.height)!)
            commentLabel3Frame = CGRectMake(10, commentLabel2Frame!.maxY+10, commentLineFrame!.width, (commentLabel3Size?.height)!)
            moreCommentFrame = CGRectMake(10, commentLabel3Frame!.maxY+10, 100, 30)
            commentViewFrame = CGRectMake(0, commentButtonFrame!.maxY, screenWidth, moreCommentFrame!.maxY)
            cellHeight = (commentViewFrame?.maxY)!+5
        }else {
            commentLineFrame = CGRectZero
            commentLabel1Frame = CGRectZero
            commentLabel2Frame = CGRectZero
            commentLabel3Frame = CGRectZero
            moreCommentFrame = CGRectZero
            commentViewFrame = CGRectZero
            cellHeight = (backViewFrame?.maxY)!+5
        }
    }
}
