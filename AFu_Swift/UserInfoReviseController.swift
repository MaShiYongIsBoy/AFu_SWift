//
//  UserInfoReviseController.swift
//  AFu_Swift
//
//  Created by bang on 16/3/31.
//  Copyright © 2016年 BangDeam. All rights reserved.
//

import UIKit

class UserInfoReviseController: UIViewController {
    /// 修改信息 输入框
    @IBOutlet weak var reviseTextFiled: UITextField!
    /// 导航栏名字
    @IBOutlet weak var navgationNameLabel: UILabel!
    /// 保存
    @IBAction func saveButton(sender: AnyObject) {
        let defaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let mid    = defaults.objectForKey("mid") as! String
        postNewInfoWith(mid, type: type!, param: reviseTextFiled.text!)
    }
    @IBAction func cancelButton(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    /// 修改类型
    var type:String?
    /// json数据
    var json:JSON = []
    /// 菊花
    var MBProgress:MBProgressHUD?
    /// 传过来需要修改的原始内容
    var contentText:String?
    /// 传过来的导航栏名字
    var navName:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        navgationNameLabel.text = navName
        reviseTextFiled.text    = contentText
    }
    
    func postNewInfoWith(mid:String,type:String,param:String){
        MBProgress = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        let getUrl = "http://app.city-base.net/jsonrpc.php?op=UpdateUser"
        let parDict = ["mid":mid,"type":type,"param":param]
        
        MBProgress?.show(true)
        RequestAPI.POST(getUrl, body: parDict, succeed:succeed , failed: failed)
    }
    
    //数据请求
    func succeed(task:NSURLSessionDataTask!,responseObject:AnyObject!)->Void{
        json = JSON(responseObject)
        print(json)
        if json["ret"] == "SUCCESS" {
            let defaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
            defaults.setObject("\(json["data"]["userid"])", forKey: "userid")
            defaults.setObject("\(json["data"]["mobile"])", forKey: "mobile")
            defaults.setObject("\(json["data"]["weixin"])", forKey: "weixin")
            defaults.setObject("\(json["data"]["mid"])", forKey: "mid")
            defaults.setObject("\(json["data"]["qq"])", forKey: "qq")
            defaults.setObject("\(json["data"]["avatar"])", forKey: "avatar")
            defaults.setObject("\(json["data"]["email"])", forKey: "email")
            defaults.setObject("\(json["data"]["uname"])", forKey: "uname")
            defaults.synchronize()
            self.navigationController?.popViewControllerAnimated(true)
        }
        MBProgress?.hide(true)
    }
    func failed(task:NSURLSessionDataTask!,error:NSError!)->Void{
        
    }

}
