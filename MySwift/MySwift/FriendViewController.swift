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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let publicDict = NSMutableDictionary()
        publicArray = NSMutableArray()
        for _ in 0..<10 {
            publicDict["icon"] = "111.jpg";
            publicDict["name"] = "学友哥";
            publicDict["photo"] = "Album7";
            publicArray.addObject(publicDict)
        }
        
        let privateDict = NSMutableDictionary()
        privateArray = NSMutableArray()
        for _ in 0..<8 {
            privateDict["icon"] = "1122.jpg";
            privateDict["name"] = "小学僧";
            privateDict["photo"] = "Album3";
            privateArray.addObject(privateDict)
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
        let data = dataArray[indexPath.row] as? NSDictionary
        cell?.selectionStyle = UITableViewCellSelectionStyle.None
        cell?.iconImageView.image = UIImage(named: data!["icon"] as! String)
        cell?.nameLabel.text = data!["name"] as? String
        cell?.photoImageView.image = UIImage(named: data!["photo"] as! String)
        return cell!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 450
    }
    
    func segmentedControl(sender: UISegmentedControl) {
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