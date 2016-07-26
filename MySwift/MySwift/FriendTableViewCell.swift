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
    var rightView: UIView?
    var closeButton: UIButton?
    
    private var commentView: UIView?
    private var commentLine: UIView?
    private var commentLabel1: UILabel?
    private var commentLabel2: UILabel?
    private var commentLabel3: UILabel?
    private var moreComment: UIButton?
    
    var commentCallback: (() -> Void)?
    var attentionCallback: (() -> Void)?
    var shareCallback: (() -> Void)?
    var reportCallback: (() -> Void)?
    
    var friendsInfo: FriendsInfo! {
        didSet {
            self.iconImageView.image = UIImage(named: friendsInfo.icon!)
            self.nameLabel.text = friendsInfo.name!
            self.photoImageView.image = UIImage(named: friendsInfo.photo!)
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(FriendTableViewCell.hiddenRightView), name: "hiddenRightView", object: nil)
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
        showRightView.titleLabel!.font = UIFont.systemFontOfSize(35)
        showRightView.backgroundColor = UIColor.blackColor();
        backView.addSubview(showRightView)
        
        photoImageView = UIImageView()
        backView.addSubview(photoImageView)
        
        likeButton = UIButton(type:UIButtonType.Custom)
        likeButton.setTitle("12312", forState:UIControlState.Normal)
        likeButton.titleLabel!.font = UIFont.systemFontOfSize(13)
        backView.addSubview(likeButton)
        
        commentButton = UIButton(type: UIButtonType.Custom)
        commentButton.setTitle("评论", forState:UIControlState.Normal)
        commentButton.addTarget(self, action: #selector(FriendTableViewCell.commentButtonClick), forControlEvents: UIControlEvents.TouchUpInside)
        commentButton.titleLabel!.font = UIFont.systemFontOfSize(13)
        backView.addSubview(commentButton)
        
        commentView = UIView()
        commentView?.backgroundColor = UIColor.clearColor()
        backView.addSubview(commentView!)
        
        commentLine = UIView()
        commentLine?.backgroundColor = UIColor.whiteColor()
        commentView?.addSubview(commentLine!)
        
        commentLabel1 = createCommentLabel()
        commentLabel1?.text = "尼玛：丑哭了丑哭了辣眼睛"
        commentLabel2 = createCommentLabel()
        commentLabel2?.text = "尼美：😒😒😒😒😒😒😒😒"
        commentLabel3 = createCommentLabel()
        commentLabel3?.text = "凤姐：我很欣赏你"
        
        moreComment = UIButton(type: UIButtonType.Custom)
        moreComment?.setTitle("查看全部评论", forState: UIControlState.Normal)
        moreComment?.titleLabel?.font = UIFont.systemFontOfSize(nameFont)
        moreComment?.backgroundColor = UIColor.clearColor()
        commentView?.addSubview(moreComment!)
    }
    
    override func layoutSubviews() {
        backView.frame = CGRectMake(0, 0, self.contentView.width, self.contentView.height-5);
        iconImageView.frame = CGRectMake(10, 5, 35, 35);
        iconImageView.layer.cornerRadius = iconImageView.width/2;
        nameLabel.frame = CGRectMake(iconImageView.right+10, 5, backView.width-iconImageView.right-10-50, iconImageView.height);
        showRightView.frame = CGRectMake(backView.width-50, 0, 50, iconImageView.bottom+5);
        photoImageView.frame = CGRectMake(0, iconImageView.bottom+5, backView.width, backView.width*0.59);
        likeButton.frame = CGRectMake(10, photoImageView.bottom, 100, 30);
        likeButton.sizeToFit()
        likeButton.height = 30;
        commentButton.frame = CGRectMake(backView.width-30-10, photoImageView.bottom, 30, 30);
        if friendsInfo.isOpen!.isEqualToNumber(NSNumber(int: 1)) {
            commentView?.frame = CGRectMake(0, commentButton.bottom, backView.width, backView.height-commentButton.bottom)
            commentLine?.frame = CGRectMake(10, 0, commentView!.width-20, 1)
            commentLabel1?.frame = CGRectMake(10, (commentLine?.bottom)!+10, commentLine!.width, 30)
            commentLabel2?.frame = CGRectMake(10, (commentLabel1?.bottom)!, commentLine!.width, 30)
            commentLabel3?.frame = CGRectMake(10, (commentLabel2?.bottom)!, commentLine!.width, 30)
            moreComment?.frame = CGRectMake(10, (commentLabel3?.bottom)!+10, 100, 30)
        }else {
            commentView?.frame = CGRectZero
            commentLine?.frame = CGRectZero
            commentLabel1?.frame = CGRectZero
            commentLabel2?.frame = CGRectZero
            commentLabel3?.frame = CGRectZero
            moreComment?.frame = CGRectZero

        }
    }
    
    func showRightViewClick() {
        showRightView.hidden = true;
        rightView = UIView()
        rightView!.backgroundColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0.8)
        backView.addSubview(rightView!)
        rightView!.frame = CGRectMake(backView.width, 0, 50, photoImageView.bottom)
        UIView.animateWithDuration(0.25) { 
            self.rightView!.frame = CGRectMake(self.backView.width-50, 0, 50, self.photoImageView.bottom);
        }
        
        closeButton = UIButton(type:UIButtonType.Custom)
        closeButton!.backgroundColor = UIColor.clearColor()
        closeButton!.addTarget(self, action:#selector(FriendTableViewCell.close), forControlEvents:UIControlEvents.TouchUpInside)
        closeButton!.setTitle("×", forState:UIControlState.Normal)
        closeButton!.titleLabel!.font = UIFont.systemFontOfSize(35)
        closeButton!.frame = CGRectMake(0, 0, 50, 50);
        rightView!.addSubview(closeButton!)
        
        let attention = createRightBtn("关注", Y: closeButton!.bottom)
        attention.tag = 1000;
        let line1 = UIView(frame: CGRectMake(10, attention.height-1, rightView!.width-20, 1))
        line1.backgroundColor = UIColor.whiteColor()
        attention.addSubview(line1)
        
        let share = createRightBtn("分享", Y:attention.bottom)
        share.tag = 1001;
        let line2 = UIView(frame: CGRectMake(10, share.height-1, rightView!.width-20, 1))
        line2.backgroundColor = UIColor.whiteColor()
        share.addSubview(line2)
        
        let report = createRightBtn("举报", Y:share.bottom)
        report.tag = 1002;
    }
    
    func close() {
        showRightView.hidden = false
        UIView.animateWithDuration(0.25, animations: { 
            self.rightView?.frame = CGRectMake(self.backView.width, 0, 50, self.photoImageView.bottom)
            }) { (finish) in
                self.rightView?.removeFromSuperview()
        }
    }
    
    func createRightBtn(title: String, Y: CGFloat) -> UIButton {
        let btn = UIButton(type: UIButtonType.Custom)
        btn.backgroundColor = UIColor.clearColor()
        btn.setTitle(title, forState:UIControlState.Normal)
        btn.titleLabel!.font = UIFont.systemFontOfSize(15)
        btn.frame = CGRectMake(0, Y, 50, photoImageView.height/3);
        btn.addTarget(self, action: #selector(FriendTableViewCell.rightBtnClick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        rightView!.addSubview(btn)
        return btn;
    }
    
    func createCommentLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFontOfSize(nameFont)
        label.backgroundColor = UIColor.clearColor()
        label.textColor = UIColor.whiteColor()
        commentView?.addSubview(label)
        return label
    }
    
    func commentButtonClick() {
        if let callBack = commentCallback {
            callBack()
        }
    }
    
    func rightBtnClick(sender: UIButton) {
        switch sender.tag {
        case 1000:
            if let callBack = attentionCallback {
                callBack()
            }
        case 1001:
            if let callBack = shareCallback {
                callBack()
            }
        default:
            if let callBack = reportCallback {
                callBack()
            }
        }
    }
    
    func hiddenRightView() {
        close()
    }
    
//    func openCell() {
//        isOpen = true
//        layoutSubviews()
//    }
//    
//    func closeCell() {
//        isOpen = false
//        layoutSubviews()
//    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
}
