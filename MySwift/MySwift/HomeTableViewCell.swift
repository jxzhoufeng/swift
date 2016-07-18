//
//  HomeTableViewCell.swift
//  MySwift
//
//  Created by 周峰 on 16/7/15.
//  Copyright © 2016年 zhoufeng. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    var backImageView: UIImageView!
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubview()
    }
    
    func setupSubview() {
        backImageView = UIImageView()
        contentView.addSubview(backImageView)
    }
    
    override func layoutSubviews() {
        backImageView.frame = CGRectMake(0, 0, contentView.width, contentView.height)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
