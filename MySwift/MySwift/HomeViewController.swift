//
//  HomeViewController.swift
//  MySwift
//
//  Created by 周峰 on 16/7/15.
//  Copyright © 2016年 zhoufeng. All rights reserved.
//

import UIKit
import SDCycleScrollView
import SDWebImage

class HomeViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate {

    var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupNav()
        tableView = UITableView(frame: CGRectZero, style: UITableViewStyle.Plain)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        view.addSubview(tableView)
        setTableHeaderView()
    }
    
    override func viewWillLayoutSubviews() {
        tableView.frame = CGRectMake(0, 0, self.view.width, self.view.height)
        
    }
    
    func setupNav() {
        let rightBtn = UIButton(type: UIButtonType.Custom)
        rightBtn.setTitleColor(UIColor .orangeColor(), forState: UIControlState.Normal)
        rightBtn.setTitle("购物车", forState: UIControlState.Normal)
        rightBtn.addTarget(self, action: #selector(HomeViewController.rightBtnClick), forControlEvents: UIControlEvents.TouchUpInside)
        rightBtn.titleLabel?.font = UIFont.systemFontOfSize(15)
        rightBtn.sizeToFit()
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
    }
    
    func rightBtnClick() {
        let vc = ViewController()
        vc.hidesBottomBarWhenPushed = true;
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func setTableHeaderView() {
        let cycleScrollView = SDCycleScrollView(frame: CGRectMake(0, 0, self.view.width, 150), delegate: self, placeholderImage: nil)
        cycleScrollView.imageURLStringsGroup = ["http://img3.3lian.com/2013/c2/26/d/79.jpg","http://img0.imgtn.bdimg.com/it/u=1608286566,3800408626&fm=206&gp=0.jpg","http://img2.imgtn.bdimg.com/it/u=2535163173,2831393109&fm=206&gp=0.jpg"]
        cycleScrollView.autoScrollTimeInterval = 3
        tableView.tableHeaderView = cycleScrollView
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let reuseId = "MainCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(reuseId) as? HomeTableViewCell
        if cell == nil {
            cell = HomeTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: reuseId)
        }
        cell?.backImageView.image = UIImage(named: String("Album\(indexPath.row)"))
        return cell!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let goodsVc = GoodsDetailViewController()
        goodsVc.hidesBottomBarWhenPushed = true
        goodsVc.urlString = "https://www.baidu.com/"
        navigationController?.pushViewController(goodsVc, animated: true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
