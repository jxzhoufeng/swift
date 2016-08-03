//
//  IMNewFriendViewController.swift
//  MySwift
//
//  Created by 周峰 on 16/8/3.
//  Copyright © 2016年 zhoufeng. All rights reserved.
//

import UIKit

class IMNewFriendViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate,EMContactManagerDelegate {

    var tableView: UITableView!
    var dataArray: [[String: AnyObject]] = [[String: AnyObject]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        EMClient.sharedClient().contactManager.addDelegate(self, delegateQueue: nil)
    }

    override func viewWillLayoutSubviews() {
        tableView.frame = CGRectMake(0, 0, view.width, view.height)
    }
    
    func didReceiveFriendInvitationFromUsername(aUsername: String!, message aMessage: String!) {
        var dict: [String: AnyObject] = [String: AnyObject]()
        dict["username"] = aUsername
        dict["message"] = aMessage
        dataArray .append(dict)
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
        let data = dataArray[indexPath.row]
        cell?.textLabel?.text = data["username"] as? String
        cell?.detailTextLabel?.text = data["message"] as? String
        return cell!
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
