//
//  FriendTableViewCell.swift
//  MySwift
//
//  Created by 周峰 on 16/7/22.
//  Copyright © 2016年 zhoufeng. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    var iconImageView: UIImageView!
    var nameLabel: UILabel!
    var photoImageView: UIImageView!
    var showRightView: UIButton!
    var likeButton: UIButton!
    var commentButton: UIButton!
    var backView: UIView!
    var rightView: UIView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupSubview() {
        backView = UIView()
        backView.backgroundColor = UIColor.blackColor()
        contentView.addSubview(backView)
        
        iconImageView = UIImageView()
        iconImageView.clipsToBounds = true
        backView.addSubview(iconImageView)
        
        nameLabel = UILabel()
        nameLabel.textColor = UIColor.whiteColor()
        nameLabel.font = UIFont.systemFontOfSize(14)
        backView.addSubview(nameLabel)
        
        showRightView = UIButton(type:UIButtonType.Custom)
        showRightView.addTarget(self, action: #selector(FriendTableViewCell.showRightViewClick), forControlEvents: UIControlEvents.TouchUpInside)
        showRightView.setTitle("+", forState: UIControlState.Normal)
        showRightView.titleLabel!.font = UIFont.systemFontOfSize(25)
        showRightView.backgroundColor = UIColor.blackColor();
        backView.addSubview(showRightView)
        
        photoImageView = UIImageView()
        backView.addSubview(photoImageView)
        
        likeButton = UIButton(type:UIButtonType.Custom)
        likeButton.setTitle("12312", forState:UIControlState.Normal)
        likeButton.titleLabel!.font = UIFont.systemFontOfSize(13)
        backView.addSubview(likeButton)
        
        commentButton = UIButton(type: UIButtonType.Custom)
        commentButton.setTitle("ping", forState:UIControlState.Normal)
        commentButton.titleLabel!.font = UIFont.systemFontOfSize(13)
        backView.addSubview(commentButton)
    }
    
    override func layoutSubviews() {
        backView.frame = CGRectMake(0, 0, self.contentView.width, self.contentView.height-5);
        iconImageView.frame = CGRectMake(10, 5, 35, 35);
        iconImageView.layer.cornerRadius = iconImageView.width/2;
        nameLabel.frame = CGRectMake(iconImageView.right+10, 5, backView.width-iconImageView.right-10-50, iconImageView.height);
        showRightView.frame = CGRectMake(backView.width-50, 0, 50, iconImageView.bottom+5);
        photoImageView.frame = CGRectMake(0, iconImageView.bottom+5, backView.width, backView.height-iconImageView.bottom-5-30);
        likeButton.frame = CGRectMake(10, photoImageView.bottom, 100, 30);
        likeButton.sizeToFit()
        likeButton.height = 30;
        commentButton.frame = CGRectMake(backView.width-30-10, photoImageView.bottom, 30, 30);
    }
    
    func showRightViewClick() {
        showRightView.hidden = true;
        rightView = UIView()
        rightView.backgroundColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0.8)
        backView.addSubview(rightView)
        rightView.frame = CGRectMake(backView.width, 0, 50, photoImageView.bottom)
        UIView.animateWithDuration(0.25) { 
            self.rightView.frame = CGRectMake(self.backView.width-50, 0, 50, self.photoImageView.bottom);
        }
        
        let closeButton = UIButton(type:UIButtonType.Custom)
        closeButton.backgroundColor = UIColor.clearColor()
        closeButton.addTarget(self, action:#selector(FriendTableViewCell.close), forControlEvents:UIControlEvents.TouchUpInside)
        closeButton.setTitle("×", forState:UIControlState.Normal)
        closeButton.titleLabel!.font = UIFont.systemFontOfSize(25)
        closeButton.frame = CGRectMake(0, 0, 50, 50);
        rightView.addSubview(closeButton)
        
        let attention = createRightBtn("关注", Y: closeButton.bottom)
        let line1 = UIView(frame: CGRectMake(10, attention.height-1, rightView.width-20, 1))
        line1.backgroundColor = UIColor.whiteColor()
        attention.addSubview(line1)
        
        let share = createRightBtn("分享", Y:attention.bottom)
        let line2 = UIView(frame: CGRectMake(10, share.height-1, rightView.width-20, 1))
        line2.backgroundColor = UIColor.whiteColor()
        share.addSubview(line2)
        
        _ = createRightBtn("举报", Y:share.bottom)
    }
    
    func close() {
        showRightView.hidden = false
        UIView.animateWithDuration(0.25, animations: { 
            self.rightView.frame = CGRectMake(self.backView.width, 0, 50, self.photoImageView.bottom)
            }) { (finish) in
                self.rightView.removeFromSuperview()
        }
    }
    
    func createRightBtn(title: String, Y: CGFloat) -> UIButton {
        let btn = UIButton(type: UIButtonType.Custom)
        btn.backgroundColor = UIColor.clearColor()
        btn.setTitle(title, forState:UIControlState.Normal)
        btn.titleLabel!.font = UIFont.systemFontOfSize(15)
        btn.frame = CGRectMake(0, Y, 50, photoImageView.height/3);
        rightView.addSubview(btn)
        return btn;
    }
}
