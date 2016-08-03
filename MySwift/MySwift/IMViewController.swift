//
//  IMViewController.swift
//  MySwift
//
//  Created by 周峰 on 16/8/3.
//  Copyright © 2016年 zhoufeng. All rights reserved.
//

import UIKit

class IMViewController: BaseViewController,EMClientDelegate,EMChatManagerDelegate,UITableViewDelegate,UITableViewDataSource {

    var tableView: UITableView!
    
    var dataArray: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNav()
        
        EMClient.sharedClient().addDelegate(self, delegateQueue: nil)
        EMClient.sharedClient().chatManager.addDelegate(self, delegateQueue: nil)
        
//        let isAutoLogin = EMClient.sharedClient().options.isAutoLogin
//        if !isAutoLogin {
//            let error = EMClient.sharedClient().loginWithUsername("123456", password: "12345678")
//            if error == nil {
//                print("登录成功")
//            }else {
//                print(error.errorDescription)
//            }
//        }
        
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        let aMessages = EMClient.sharedClient().chatManager.getAllConversations()
        var msg = [AnyObject]()
        for message in aMessages {
            msg = message.loadMoreMessagesFromId(nil, limit: 10, direction: EMMessageSearchDirectionUp)
        }
        for a in msg {
            let messagebody = a.body as! EMTextMessageBody
            dataArray.append(messagebody.text)
        }
    }
    
    func setupNav() {
        let rightBtn = UIButton(type: UIButtonType.Custom)
        rightBtn.setTitleColor(UIColor .orangeColor(), forState: UIControlState.Normal)
        rightBtn.setTitle("好友", forState: UIControlState.Normal)
        rightBtn.addTarget(self, action: #selector(IMViewController.rightBtnClick), forControlEvents: UIControlEvents.TouchUpInside)
        rightBtn.titleLabel?.font = UIFont.systemFontOfSize(15)
        rightBtn.sizeToFit()
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
    }
    
    func rightBtnClick() {
        let sb = UIStoryboard(name: "IMfriendsViewController", bundle: nil)
        let vc = sb.instantiateInitialViewController()
        
        vc!.hidesBottomBarWhenPushed = true
        vc!.title = "好友"
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    override func viewWillLayoutSubviews() {
        tableView.frame = CGRectMake(0, 0, view.width, view.height)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let reuseId = "IMCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(reuseId)
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: reuseId)
        }
        cell?.textLabel?.text = dataArray[indexPath.row]
        return cell!
    }

    
    func didConnectionStateChanged(aConnectionState: EMConnectionState) {
//        print(aConnectionState)
    }
    
    func didReceiveMessages(aMessages: [AnyObject]!) {
        for message in aMessages {
            let messagebody = message.body as! EMTextMessageBody
//            print(messagebody.text)
            dataArray.append(messagebody.text)
            tableView.reloadData()
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
