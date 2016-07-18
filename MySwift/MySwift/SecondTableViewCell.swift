//
//  SecondTableViewCell.swift
//  MySwift
//
//  Created by 周峰 on 16/7/15.
//  Copyright © 2016年 zhoufeng. All rights reserved.
//

import UIKit

class SecondTableViewCell: UITableViewCell {
    
    var iconImage: UIImageView!
    var name: UILabel!
    var status: UILabel!
    var photo: UIImageView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubview()
    }
    
    func setupSubview() {
        
    }
    
    override func layoutSubviews() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
