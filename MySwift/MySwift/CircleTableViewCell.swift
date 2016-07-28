//
//  CircleTableViewCell.swift
//  MySwift
//
//  Created by 周峰 on 16/7/28.
//  Copyright © 2016年 zhoufeng. All rights reserved.
//

import UIKit

class CircleTableViewCell: UITableViewCell {

    var timeLabel: UILabel?
    var line: UIImageView!
    var logo: UIImageView?
    var contentLabel: UILabel!
    var photoImageView: UIImageView?
    var moreButton: UIButton?
    var likeButton: UIButton?
    var commentButton: UIButton?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.blackColor()
        setupSubView()
    }
    
    func setupSubView() {
        timeLabel = UILabel()
        timeLabel?.text = "今天"
        timeLabel?.textColor = UIColor(hexString: "767676")
        timeLabel?.textAlignment = .Center
        timeLabel?.font = UIFont.systemFontOfSize(12)
        contentView.addSubview(timeLabel!)
        
        line = UIImageView()
        line.image = UIImage(named: "Line")
        contentView.addSubview(line)
        
        logo = UIImageView()
        logo?.clipsToBounds = true
        logo?.image = UIImage(named: "ellipse3")
        contentView.addSubview(logo!)
        
        contentLabel = UILabel()
        contentLabel.numberOfLines = 0
        contentLabel.text = "Liked this post from Dribbble"
        contentLabel.font = UIFont.systemFontOfSize(12)
        contentLabel.textColor = UIColor(hexString: "767676")
        contentView.addSubview(contentLabel)
        
        photoImageView = UIImageView()
        photoImageView?.image = UIImage(named: "Album0.jpg")
        contentView.addSubview(photoImageView!)
        
        moreButton = UIButton(type: .Custom)
        moreButton?.setBackgroundImage(UIImage(named: "More"), forState: .Normal)
        contentView.addSubview(moreButton!)
        
        likeButton = UIButton(type: .Custom)
        likeButton?.setBackgroundImage(UIImage(named: "ellipse1"), forState: .Normal)
        contentView.addSubview(likeButton!)
        
        commentButton = UIButton(type: .Custom)
        commentButton?.setBackgroundImage(UIImage(named: "ellipse2"), forState: .Normal)
        contentView.addSubview(commentButton!)
    }
    
    override func layoutSubviews() {
        timeLabel?.frame = CGRectMake(0, 10, 50, 20)
        line.frame = CGRectMake((timeLabel?.right)!+10, 0, 1, contentView.height)
        logo?.frame = CGRectMake((timeLabel?.right)!, (timeLabel?.top)!, 20, 20)
        logo?.layer.cornerRadius = (logo?.width)!/2
        let size = contentLabel.text?.size(UIFont.systemFontOfSize(12), constrainedToSize: CGSizeMake(contentView.width-(logo?.right)!-20-10, CGFloat(MAXFLOAT)))
        contentLabel.frame = CGRectMake((logo?.right)!+20, 10, contentView.width-(logo?.right)!-20-10, (size?.height)!)
        photoImageView?.frame = CGRectMake(contentLabel.left, contentLabel.bottom+10, contentLabel.width*0.7, contentLabel.width*0.7)
        moreButton?.frame = CGRectMake((photoImageView?.right)!+5, (photoImageView?.top)!, 15, 15)
        likeButton?.frame = CGRectMake((moreButton?.left)!, (photoImageView?.bottom)!-15, 15, 15)
        commentButton?.frame = CGRectMake((likeButton?.right)!+5, (photoImageView?.bottom)!-15, 15, 15)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
