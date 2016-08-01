//
//  LeftViewTableViewCell.swift
//  MySwift
//
//  Created by 周峰 on 16/8/1.
//  Copyright © 2016年 zhoufeng. All rights reserved.
//

import UIKit

class LeftViewTableViewCell: UITableViewCell {

    var backView: UIView!
    var iconImageView: UIImageView!
    var titleLabel: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.blackColor()
        
        backView = UIView()
        backView.backgroundColor = UIColor(hexString: "1F2021")
        contentView.addSubview(backView)
        
        iconImageView = UIImageView()
        backView.addSubview(iconImageView)
        
        titleLabel = UILabel()
        titleLabel.textColor = UIColor(hexString: "767676")
        titleLabel.font = UIFont.systemFontOfSize(15)
        backView.addSubview(titleLabel)
    }
    
    override func layoutSubviews() {
        backView.frame = CGRectMake(0, 0, contentView.width, contentView.height-1)
        iconImageView.frame = CGRectMake(15, 5, backView.height-10, backView.height-10)
        titleLabel.frame = CGRectMake(iconImageView.right+10, 0, backView.width-iconImageView.right-10, backView.height)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
