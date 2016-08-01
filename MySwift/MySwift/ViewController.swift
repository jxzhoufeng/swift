//
//  ViewController.swift
//  MySwift
//
//  Created by 周峰 on 16/7/11.
//  Copyright © 2016年 zhoufeng. All rights reserved.
//

import UIKit

class ViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {

    var tableView: UITableView!
    var bottomView: UIView!
    var selectAll: UIButton!
    var price: UILabel!
    var submit: UIButton!
    var infoArray: NSMutableArray!
    var priceNum: Float!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        priceNum = 0
        infoArray = NSMutableArray()
        for _ in 0..<10 {
            var infoDict = [String:AnyObject]()
            infoDict["goodsName"] = "CHANEL/香奈儿破包"
            infoDict["goodsPrice"] = "200000"
            infoDict["selectState"] = NSNumber(int: 0)
            infoDict["goodsCount"] = NSNumber(int: 1)
            infoDict["goodsStyle"] = "类型：凤姐同款"
            
            let goodsInfo = GoodsInfo(dict: infoDict)
            infoArray.addObject(goodsInfo)
        }
        
        tableView = UITableView(frame: CGRectZero, style: UITableViewStyle.Plain)
        tableView?.delegate = self
        tableView?.dataSource = self
        view.addSubview(tableView)
        
        view.backgroundColor = UIColor(hexString: "ededed")
        
        bottomView = UIView()
        bottomView.backgroundColor = UIColor.whiteColor()
        view.addSubview(bottomView)
        
        selectAll = UIButton(type: UIButtonType.Custom)
        selectAll.setImage(UIImage(named: "icon_cancelDefaul"), forState: UIControlState.Normal)
        selectAll.setImage(UIImage(named: "icon_cancelSelect"), forState: UIControlState.Selected)
        selectAll.setTitle("   全 选", forState: UIControlState.Normal)
        selectAll.titleLabel?.font = UIFont.systemFontOfSize(15)
        selectAll.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        selectAll.addTarget(self, action: #selector(ViewController.selectAllClick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        bottomView.addSubview(selectAll)
        
        price = UILabel()
        price.font = UIFont.systemFontOfSize(15)
        price.textColor = UIColor.lightGrayColor()
        price.text = "合计：0.00元"
        price.textAlignment = NSTextAlignment.Right
        bottomView.addSubview(price)
        
        submit = UIButton(type: UIButtonType.Custom)
        submit.backgroundColor = UIColor.blackColor()
        submit.titleLabel?.font = UIFont.systemFontOfSize(15)
        submit.setTitle("去 结 算", forState:UIControlState.Normal)
        bottomView.addSubview(submit)
    }
    
    override func viewWillLayoutSubviews() {
        tableView.frame = CGRectMake(0, 0, view.width, view.height-50);
        bottomView.frame = CGRectMake(0, tableView.bottom+1, view.width, 49);
        selectAll.frame = CGRectMake(10, 0, 90, bottomView.height);
        price.frame = CGRectMake(selectAll.right, 0, bottomView.width-selectAll.right-20-95, bottomView.height);
        submit.frame = CGRectMake(price.right+5, 8, 90, bottomView.height-16);
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoArray.count;
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let reuseID = "cell"
        var cell = tableView.dequeueReusableCellWithIdentifier(reuseID) as! TableViewCell?
        if (cell == nil) {
            tableView.registerNib(UINib(nibName: "TableviewCell", bundle: nil), forCellReuseIdentifier: reuseID)
            cell = tableView.dequeueReusableCellWithIdentifier(reuseID) as! TableViewCell?
        }
        let goodsInfo = infoArray[indexPath.row] as! GoodsInfo
        cell?.selectionStyle = UITableViewCellSelectionStyle.None
        cell?.goodsInfo = goodsInfo
        cell?.plusButtonCallBack = {(num: Int) -> Void in
            goodsInfo.goodsCount = NSNumber(int: (goodsInfo.goodsCount?.intValue)!+1)
            print(num)
            self.getTotalPrice()
            self.tableView.reloadData()
        }
        cell?.minusButtoCallBack = {
            if goodsInfo.goodsCount?.intValue<=1 {
                return
            }
            goodsInfo.goodsCount = NSNumber(int: (goodsInfo.goodsCount?.intValue)!-1)
            self.getTotalPrice()
            self.tableView.reloadData()
        }
        return cell!;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 110;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let goodsInfo = infoArray[indexPath.row] as! GoodsInfo
        if goodsInfo.selectState!.isEqualToNumber(NSNumber(int: 1)) {
            goodsInfo.selectState = NSNumber(int: 0)
        }else {
            goodsInfo.selectState = NSNumber(int: 1)
        }
        getTotalPrice()
        tableView.reloadData()
    }
    
    func selectAllClick(sender: UIButton) {
        sender.selected = !sender.selected
        for i in 0..<infoArray.count {
            let goodsInfo = infoArray[i] as! GoodsInfo
            if sender.selected {
                goodsInfo.selectState = NSNumber(int: 1)
            }else {
                goodsInfo.selectState = NSNumber(int: 0)
            }
        }
        getTotalPrice()
        tableView.reloadData()
    }
    
    func getTotalPrice() {
        for i in 0..<infoArray.count {
            let goodsInfo = infoArray[i] as! GoodsInfo
            if goodsInfo.selectState!.isEqualToNumber(NSNumber(int: 1)) {
               priceNum = priceNum + (goodsInfo.goodsCount?.floatValue)! * Float(goodsInfo.goodsPrice!)!
            }
        }
        price.text = String(format: "合计%.2f元", priceNum)
        priceNum = 0
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

