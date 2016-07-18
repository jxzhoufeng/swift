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
    var photo: UIImageView?
    var time: UILabel!
    var from: UILabel!
    
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
        iconImage = UIImageView()
        contentView.addSubview(iconImage)
        
        name = UILabel()
        name.textColor = UIColor.orangeColor()
        name.font = UIFont.systemFontOfSize(nameFont)
        contentView.addSubview(name)
        
        time = UILabel()
        time.font = UIFont.systemFontOfSize(nameFont)
        contentView.addSubview(time)
        
        from = UILabel()
        from.font = UIFont.systemFontOfSize(nameFont)
        contentView.addSubview(from)
        
        status = UILabel()
        status.numberOfLines = 0
        status.font = UIFont.systemFontOfSize(statusFont)
        contentView.addSubview(status)
        
        photo = UIImageView()
        contentView.addSubview(photo!)
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
            photo!.frame = (statusFrame?.photoFrame)!
            //        photo.sd_setImageWithURL(NSURL(string: (statusFrame?.status?.photo)!))
            photo!.image = UIImage(named: (statusFrame?.status?.photo)!)
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
