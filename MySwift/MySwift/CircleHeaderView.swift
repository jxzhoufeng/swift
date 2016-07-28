//
//  CircleHeaderView.swift
//  MySwift
//
//  Created by 周峰 on 16/7/28.
//  Copyright © 2016年 zhoufeng. All rights reserved.
//

import UIKit

class CircleHeaderView: UIView {

    var backImageView: UIImageView!
    var iconImageView: UIImageView!
    var followersLabel: UILabel!
    var followeringLabel: UILabel!
    var attentionButton: UIButton!
    
    var iconString: String? {
        didSet {
            iconImageView.image = UIImage(named: iconString!)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.height = 240
        setupSubview()
    }
    
    func setupSubview() {
        backImageView = UIImageView()
        backImageView.contentMode = UIViewContentMode.Bottom
        backImageView.image = UIImage(named: "123.jpg")
        addSubview(backImageView)
        
        iconImageView = UIImageView()
        iconImageView.clipsToBounds = true
        iconImageView.layer.borderWidth = 3
        iconImageView.layer.borderColor = UIColor.whiteColor().CGColor
        addSubview(iconImageView)
        
        followersLabel = UILabel()
        followersLabel.numberOfLines = 0
        followersLabel.font = UIFont.systemFontOfSize(12)
        followersLabel.text = "89899\nFollowers"
        followersLabel.textColor = UIColor.whiteColor()
        addSubview(followersLabel)
        
        followeringLabel = UILabel()
        followeringLabel.numberOfLines = 0
        followeringLabel.font = UIFont.systemFontOfSize(12)
        followeringLabel.text = "678\nFollowing"
        followeringLabel.textColor = UIColor.whiteColor()
        addSubview(followeringLabel)
        
        attentionButton = UIButton(type: .Custom)
        attentionButton.layer.borderColor = UIColor.whiteColor().CGColor
        attentionButton.setTitle("+ 关注", forState: .Normal)
        attentionButton.titleLabel?.font = UIFont.systemFontOfSize(12)
        attentionButton.layer.borderWidth = 1
        addSubview(attentionButton)
    }
    
    override func layoutSubviews() {
        backImageView.frame = CGRectMake(0, 0, width, 180)
        iconImageView.frame = CGRectMake(10, backImageView.bottom-50, 100, 100)
        iconImageView.layer.cornerRadius = iconImageView.width/2
        let Labelwidth = (self.width-iconImageView.right)/3
        followersLabel.frame = CGRectMake(iconImageView.right+15, backImageView.bottom, Labelwidth-15, self.height-backImageView.bottom-10)
        followeringLabel.frame = CGRectMake(followersLabel.right, backImageView.bottom, Labelwidth, self.height-backImageView.bottom-10)
        attentionButton.frame = CGRectMake(followeringLabel.right+10, backImageView.bottom+10, Labelwidth-30, 30)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
