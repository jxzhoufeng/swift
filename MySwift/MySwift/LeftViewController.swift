//
//  LeftViewController.swift
//  MySwift
//
//  Created by 周峰 on 16/8/1.
//  Copyright © 2016年 zhoufeng. All rights reserved.
//

import UIKit

class LeftViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var searchBar: UISearchBar!
    var tableView: UITableView!
    var listArray: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blackColor()
        
        searchBar = UISearchBar()
        searchBar.barTintColor = UIColor.blackColor()
        searchBar.placeholder = "Search"
        view.addSubview(searchBar)
        
        tableView = UITableView(frame: CGRectZero, style: .Plain)
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.separatorStyle = .None
        tableView.backgroundColor = UIColor.blackColor()
        view.addSubview(tableView)
        
        listArray = ["设置","我的消息","联系客服","隐私条款","修改密码","举报","邀请码","积分排行榜"];
    }
    
    override func viewWillLayoutSubviews() {
        searchBar.frame = CGRectMake(5, 20, view.width-10, 30)
        tableView.frame = CGRectMake(0, searchBar.bottom+10, view.width, view.height-searchBar.bottom-10)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let reuseId = "leftcell"
        var cell = tableView.dequeueReusableCellWithIdentifier(reuseId) as? LeftViewTableViewCell
        if cell == nil {
            cell = LeftViewTableViewCell(style: .Default, reuseIdentifier: reuseId)
        }
        cell?.titleLabel.text = listArray[indexPath.row]
        return cell!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 46
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let nav = self.mm_drawerController.centerViewController.childViewControllers[0] as! MainNavigationController
        nav.pushViewController(FriendViewController(), animated: true)
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(0.25 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) { () -> Void in
            self.mm_drawerController.closeDrawerAnimated(true, completion: nil)
        }
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
