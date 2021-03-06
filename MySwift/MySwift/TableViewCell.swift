//
//  TableViewCell.swift
//  MySwift
//
//  Created by 周峰 on 16/7/11.
//  Copyright © 2016年 zhoufeng. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var goodsPrice: UILabel!
    @IBOutlet weak var goodsStyle: UILabel!
    @IBOutlet weak var goodsName: UILabel!
    @IBOutlet weak var goodsCount: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButto: UIButton!
    @IBOutlet weak var checkImageView: UIImageView!
    
    var goodsInfo: GoodsInfo! {
        didSet {
            self.goodsPrice.text = String(format: "限时价格：%@元", goodsInfo.goodsPrice!)
            self.goodsName.text = goodsInfo.goodsName
            self.goodsStyle.text = goodsInfo.goodsStyle
            self.goodsCount.text = String(format: "%@", goodsInfo.goodsCount!)
            if goodsInfo.selectState!.isEqualToNumber(NSNumber(int: 1)) {
                self.checkImageView.image = UIImage(named: "icon_cancelSelect");
            }else{
                self.checkImageView.image = UIImage(named: "icon_cancelDefaul");
            }
        }
    }
    var plusButtonCallBack: ((Int) -> Void)?
    var minusButtoCallBack: (() -> Void)?
    
    override func awakeFromNib() {
        plusButton.layer.borderColor = UIColor.lightGrayColor().CGColor
        plusButton.layer.borderWidth = 1
        
        minusButto.layer.borderColor = UIColor.lightGrayColor().CGColor
        minusButto.layer.borderWidth = 1
        
        plusButton.addTarget(self, action: #selector(TableViewCell.plusButtonClick), forControlEvents: UIControlEvents.TouchUpInside)
        minusButto.addTarget(self, action: #selector(TableViewCell.minusButtoClick), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func plusButtonClick() {
        if let block = plusButtonCallBack {
            block(5)
        }
    }
    
    func minusButtoClick() {
        if let block = minusButtoCallBack {
            block()
        }
    }
    
}
