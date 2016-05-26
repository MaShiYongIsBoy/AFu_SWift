//
//  UserInfoController.swift
//  AFu_Swift
//
//  Created by bang on 16/3/30.
//  Copyright © 2016年 BangDeam. All rights reserved.
//

import UIKit

class UserInfoController: UIViewController {
    @IBAction func backButton(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    @IBOutlet weak var myTableView: UITableView!
    ///  栏目数组
    var nameArray = [["昵称","手机号码"],["电子邮箱"],["QQ"],["微信"],["修改密码"]]
    var contentArray:NSArray = []
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let mobile   = defaults.objectForKey("mobile") as! String
        let weixin   = defaults.objectForKey("weixin") as! String
        let qq       = defaults.objectForKey("qq") as! String
        let email    = defaults.objectForKey("email") as! String
        let uname    = defaults.objectForKey("uname") as! String
        contentArray = [[uname,mobile],[email],[qq],[weixin],[""]]
    }
}

/// MARK - UITableView 代理
extension UserInfoController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray[section].count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("UserInfoCell") as!UserInfoCell
        let dataArray       = nameArray[indexPath.section] as NSArray
        let infoArray       = contentArray[indexPath.section] as! NSArray
        
        cell.nameLabel.text = dataArray[indexPath.row] as? String
        cell.infoLabel.text = infoArray[indexPath.row] as? String
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let Ctl = self.storyboard?.instantiateViewControllerWithIdentifier("UserInfoReviseController") as! UserInfoReviseController
        let infoArray        = contentArray[indexPath.section] as! NSArray
        Ctl.contentText      = infoArray[indexPath.row] as? String
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0:
                Ctl.navName = "昵称"
                Ctl.type    = "uname"
            case 1:
                Ctl.navName = "手机号码"
                Ctl.type    = "mobile"
            default:
                break
            }
        }else if indexPath.section == 1{
             Ctl.navName     = "电子邮箱"
             Ctl.type        = "email"
        }else if indexPath.section == 2{
             Ctl.navName     = "QQ"
             Ctl.type        = "qq"
        }else if indexPath.section == 3{
             Ctl.navName     = "微信"
             Ctl.type        = "weixin"
        }else if indexPath.section == 4{
             Ctl.navName     = "修改密码"
           
        }
        self.navigationController?.pushViewController(Ctl, animated: true)
    }
}