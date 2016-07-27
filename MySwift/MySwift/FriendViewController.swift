//
//  FriendViewController.swift
//  MySwift
//
//  Created by 周峰 on 16/7/19.
//  Copyright © 2016年 zhoufeng. All rights reserved.
//

import UIKit

class FriendViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    var segmentedControl: UISegmentedControl!
    var tableView: UITableView!
    var dataArray: NSMutableArray!
    var publicArray: NSMutableArray!
    var privateArray: NSMutableArray!
    var isOpen: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isOpen = false
        
        var publicDict = [String:AnyObject]()
        publicArray = NSMutableArray()
        for _ in 0..<10 {
            publicDict["icon"] = "111.jpg"
            publicDict["name"] = "学友哥"
            publicDict["photo"] = "Album7"
            publicDict["firstComment"] = "尼玛：丑哭了丑哭了辣眼睛丑哭了丑哭了辣眼睛丑哭了丑哭了辣眼睛丑哭了丑哭了辣眼睛丑哭了丑哭了辣眼睛"
            publicDict["secondComment"] = "尼美：😒😒😒😒😒😒😒😒"
            publicDict["thirdComment"] = "凤姐：我很欣赏你🐯🐯🐯🐯🐯🐯🐯🐯🐯🐯🐯🐯🐯🐯🐯🐯🐯🐯🐯"
            publicDict["isOpen"] = NSNumber(integer: 0)
            let friendsInfo = FriendsInfo(dict: publicDict)
            let friendsFrame = FriendsFrame()
            friendsFrame.friendsInfo = friendsInfo
            publicArray.addObject(friendsFrame)
        }
        
        var privateDict = [String:AnyObject]()
        privateArray = NSMutableArray()
        for _ in 0..<8 {
            privateDict["icon"] = "1122.jpg"
            privateDict["name"] = "小学僧"
            privateDict["photo"] = "Album3"
            privateDict["firstComment"] = "尼玛：啦啦啦啦啦啦啦啦啦"
            privateDict["secondComment"] = "尼美：😊😊😊😊😊😊😊😊😊😊"
            privateDict["thirdComment"] = "凤姐：发手法而非发放"
            privateDict["isOpen"] = NSNumber(integer: 0)
            let friendsInfo = FriendsInfo(dict: privateDict)
            let friendsFrame = FriendsFrame()
            friendsFrame.friendsInfo = friendsInfo
            privateArray.addObject(friendsFrame)
        }
        
        dataArray = publicArray
        
        segmentedControl = UISegmentedControl(items: ["PUBLIC","PRIVATE"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.tintColor = UIColor.clearColor()
        segmentedControl.setBackgroundImage(UIImage(color: UIColor.lightGrayColor()), forState: UIControlState.Normal, barMetrics: UIBarMetrics.Default)
        segmentedControl.setBackgroundImage(UIImage(color: UIColor.darkGrayColor()), forState: UIControlState.Selected, barMetrics: UIBarMetrics.Default)
        segmentedControl.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.whiteColor()], forState: UIControlState.Normal)
        segmentedControl.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.whiteColor()], forState: UIControlState.Selected)
        segmentedControl.addTarget(self, action: #selector(FriendViewController.segmentedControl(_:)), forControlEvents: UIControlEvents.ValueChanged)
        view.addSubview(segmentedControl)
        
        tableView = UITableView(frame: CGRectZero, style: UITableViewStyle.Plain)
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        view.addSubview(tableView)
    }
    
    override func viewWillLayoutSubviews() {
        segmentedControl.frame = CGRectMake(0, 0, view.width, 40)
        tableView.frame = CGRectMake(0, segmentedControl.bottom, view.width, view.height-segmentedControl.bottom-44)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let reuserID = "friendCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(reuserID) as? FriendTableViewCell
        if cell == nil {
            cell = FriendTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: reuserID)
        }
        let friendsFrame = dataArray[indexPath.row] as! FriendsFrame
        cell?.selectionStyle = UITableViewCellSelectionStyle.None
        cell?.friendsFrame = friendsFrame
        cell?.attentionCallback = {
            print("guanzhu\(friendsFrame.friendsInfo!.name!)")
        }
        cell?.shareCallback = { () -> Void in
            print("fenxiang\(indexPath.row)")
        }
        cell?.reportCallback = {
            print("jubao\(indexPath.row)")
        }
        cell?.moreCommentCallback = {
            let commentVc = CommentViewController()
            commentVc.hidesBottomBarWhenPushed = true
            commentVc.commentArr = ["尼玛：丑哭了丑哭了辣眼睛丑哭了丑哭了辣眼睛丑哭了丑哭了辣眼睛丑哭了丑哭了辣眼睛丑哭了丑哭了辣眼睛辣眼睛",
                                    "尼美：😒😒😒😒😒😒😒😒",
                                    "凤姐：我很欣赏你🐯🐯🐯🐯🐯🐯🐯🐯🐯🐯🐯🐯🐯🐯🐯🐯🐯🐯🐯",
                                    "小花：啦啦啦啦啦啦啦啦啦按设计搭建",
                                    "小草：巨化股份多岁的v司法斯蒂芬阿斯蒂芬按时"]
            self.navigationController?.pushViewController(commentVc, animated: true)
        }
        cell?.commentCallback = {
            if friendsFrame.friendsInfo!.isOpen!.isEqualToNumber(NSNumber(int: 0)) {
                friendsFrame.friendsInfo!.isOpen = NSNumber(integer: 1)
            }else {
                friendsFrame.friendsInfo!.isOpen = NSNumber(integer: 0)
            }
            cell?.friendsFrame?.setFrame()
            tableView.reloadData()
//            tableView.selectRowAtIndexPath(indexPath, animated: true, scrollPosition: UITableViewScrollPosition.Top)
        }
        return cell!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let friendsFrame = dataArray[indexPath.row] as! FriendsFrame
        return friendsFrame.cellHeight!
    }
    
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        NSNotificationCenter.defaultCenter().postNotificationName("hiddenRightView", object: nil)
    }
    
    func segmentedControl(sender: UISegmentedControl) {
        NSNotificationCenter.defaultCenter().postNotificationName("hiddenRightView", object: nil)
        tableView.selectRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), animated: false, scrollPosition: UITableViewScrollPosition.Top)
        switch sender.selectedSegmentIndex {
        case 0:
            dataArray = publicArray
        default:
            dataArray = privateArray
        }
        tableView.reloadData()
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
