//
//  SecondTableViewCell.swift
//  MySwift
//
//  Created by 周峰 on 16/7/15.
//  Copyright © 2016年 zhoufeng. All rights reserved.
//

import UIKit

class SecondTableViewCell: UITableViewCell {
    
    lazy var iconImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    var name: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.orangeColor()
        label.font = UIFont.systemFontOfSize(nameFont)
        return label
    }()
    var status: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFontOfSize(statusFont)
        return label
    }()
    var photo: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    var time: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFontOfSize(13)
        return label
    }()
    var from: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFontOfSize(13)
        return label
    }()
    
    var statusFrame: StatusFrame? {
        didSet {
            setupSubviewFrame()
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubview()
    }
    
    func setupSubview() {
        contentView.addSubview(iconImage)
        
        contentView.addSubview(name)
        
        contentView.addSubview(time)
        
        contentView.addSubview(from)
        
        contentView.addSubview(status)

        contentView.addSubview(photo)
    }
    
    func setupSubviewFrame() {
        iconImage.frame = (statusFrame?.iconImageFrame)!
        iconImage.layer.cornerRadius = (statusFrame?.iconImageFrame?.width)!/2
        iconImage.layer.masksToBounds = true
//        iconImage.sd_setImageWithURL(NSURL(string: (statusFrame?.status?.iconImage)!))
        iconImage.image = UIImage(named: (statusFrame?.status?.iconImage)!)
        name.frame = (statusFrame?.nameFrame)!
        name.text = (statusFrame?.status?.name)!
        time.frame = (statusFrame?.timeFrame)!
        time.text = (statusFrame?.status?.time)!
        from.frame = (statusFrame?.fromFrame)!
        from.text = (statusFrame?.status?.from)!
        status.frame = (statusFrame?.statusFrame)!
        status.text = (statusFrame?.status?.status)!
        if statusFrame?.photoFrame != nil {
            photo.frame = (statusFrame?.photoFrame)!
            //        photo.sd_setImageWithURL(NSURL(string: (statusFrame?.status?.photo)!))
            photo.image = UIImage(named: (statusFrame?.status?.photo)!)
        }else {
            photo.frame = CGRectZero
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
