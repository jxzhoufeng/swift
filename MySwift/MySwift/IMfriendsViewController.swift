//
//  IMfriendsViewController.swift
//  MySwift
//
//  Created by 周峰 on 16/8/3.
//  Copyright © 2016年 zhoufeng. All rights reserved.
//

import UIKit

class IMfriendsViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav()
        
        let isAutoLogin = EMClient.sharedClient().options.isAutoLogin
        if !isAutoLogin {
            let error = EMClient.sharedClient().loginWithUsername("123456", password: "12345678")
            if error == nil {
                print("登录成功")
            }else {
                print(error.errorDescription)
            }
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let reuseId = "IMfriendCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseId) as! IMfriendsTableViewCell
        cell.nameLabel.text = "433234"
        return cell
    }
    
    func setupNav() {
        let rightBtn = UIButton(type: UIButtonType.Custom)
        rightBtn.setTitleColor(UIColor .orangeColor(), forState: UIControlState.Normal)
        rightBtn.setTitle("好友请求", forState: UIControlState.Normal)
        rightBtn.addTarget(self, action: #selector(IMfriendsViewController.rightBtnClick), forControlEvents: UIControlEvents.TouchUpInside)
        rightBtn.titleLabel?.font = UIFont.systemFontOfSize(15)
        rightBtn.sizeToFit()
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
        
        let leftBtn = UIButton(type: UIButtonType.Custom)
        leftBtn.setTitleColor(UIColor .orangeColor(), forState: UIControlState.Normal)
        leftBtn.setTitle("添加好友", forState: UIControlState.Normal)
        leftBtn.addTarget(self, action: #selector(IMfriendsViewController.leftBtnClick), forControlEvents: UIControlEvents.TouchUpInside)
        leftBtn.titleLabel?.font = UIFont.systemFontOfSize(15)
        leftBtn.sizeToFit()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBtn)
    }
    
    func rightBtnClick() {
        let vc = IMNewFriendViewController()
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func leftBtnClick() {
        let vc = IMAddFriendViewController()
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
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
