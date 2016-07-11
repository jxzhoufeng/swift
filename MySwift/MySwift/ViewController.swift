//
//  ViewController.swift
//  MySwift
//
//  Created by 周峰 on 16/7/11.
//  Copyright © 2016年 zhoufeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var _tableView: UITableView!
    var _bottomView: UIView!
    var _selectAll: UIButton!
    var _price: UILabel!
    var _submit: UIButton!
    var _infoArray: NSMutableArray!
    var _priceNum: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        _priceNum = 0
        _infoArray = NSMutableArray()
        for _ in 0..<10 {
            var infoDict = [String:AnyObject]()
            infoDict["goodsName"] = "CHANEL/香奈儿破包"
            infoDict["goodsPrice"] = "200000"
            infoDict["selectState"] = NSNumber(bool: false)
            infoDict["goodsCount"] = "1"
            infoDict["goodsStyle"] = "类型：配饰"
            
            let goodsInfo = GoodsInfo(dict: infoDict)
            _infoArray.addObject(goodsInfo)
        }
        
        _tableView = UITableView(frame: CGRectZero, style: UITableViewStyle.Plain)
        _tableView?.delegate = self
        _tableView?.dataSource = self
        view.addSubview(_tableView!)
        
        view.backgroundColor = UIColor(hexString: "ededed")
        
        _bottomView = UIView()
        _bottomView.backgroundColor = UIColor.whiteColor()
        view.addSubview(_bottomView)
        
        _selectAll = UIButton(type: UIButtonType.Custom)
        _selectAll.setImage(UIImage(named: "icon_cancelDefaul"), forState: UIControlState.Normal)
        _selectAll.setTitle("   全 选", forState: UIControlState.Normal)
        _selectAll.titleLabel?.font = UIFont.systemFontOfSize(15)
        _selectAll.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        _bottomView.addSubview(_selectAll)
        
        _price = UILabel()
        _price.font = UIFont.systemFontOfSize(15)
        _price.textColor = UIColor.lightGrayColor()
        _price.text = "合计：0.00元"
        _price.textAlignment = NSTextAlignment.Right
        _bottomView.addSubview(_price)
        
        _submit = UIButton(type: UIButtonType.Custom)
        _submit.backgroundColor = UIColor.blackColor()
        _submit.titleLabel?.font = UIFont.systemFontOfSize(15)
        _submit.setTitle("去 结 算", forState:UIControlState.Normal)
        _bottomView.addSubview(_submit)
    }
    
    override func viewWillLayoutSubviews() {
        _tableView.frame = CGRectMake(0, 0, view.width, view.height-50);
        _bottomView.frame = CGRectMake(0, _tableView.bottom+1, view.width, 49);
        _selectAll.frame = CGRectMake(10, 0, 90, _bottomView.height);
        _price.frame = CGRectMake(_selectAll.right, 0, _bottomView.width-_selectAll.right-20-95, _bottomView.height);
        _submit.frame = CGRectMake(_price.right+5, 8, 90, _bottomView.height-16);
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _infoArray.count;
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let reuseID = "cell"
        var cell = tableView.dequeueReusableCellWithIdentifier(reuseID) as! TableViewCell?
        if (cell == nil) {
            tableView.registerNib(UINib.init(nibName: "TableviewCell", bundle: nil), forCellReuseIdentifier: reuseID)
            cell = tableView.dequeueReusableCellWithIdentifier(reuseID) as! TableViewCell?
        }
        let goodsInfo = _infoArray[indexPath.row] as! GoodsInfo
        cell?.goodsInfo = goodsInfo
        return cell!;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 110;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

