//
//  LoginInController.swift
//  AFu_Swift
//
//  Created by bang on 16/3/31.
//  Copyright © 2016年 BangDeam. All rights reserved.
//

import UIKit

class LoginInController: UIViewController {
    /// 密码
    @IBOutlet weak var passwordFiled: UITextField!
    /// 用户名
    @IBOutlet weak var phoneFiled: UITextField!
    /// 头像
    @IBOutlet weak var headImageView: UIImageView!
    /// 登录按钮
    @IBOutlet weak var loginButton: UIButton!
    /// 返回按钮
    @IBAction func cancelButton(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    /// 登录按钮事件
    @IBAction func loginButton(sender: AnyObject) {
        let userName:String = phoneFiled.text!
        let password:String = passwordFiled.text!
        
        postLoginWith(userName, password:password)
    }
    /// 注册按钮
    @IBAction func registButton(sender: AnyObject) {
        let Ctl = self.storyboard?.instantiateViewControllerWithIdentifier("RegistController") as! RegistController
        self.navigationController?.pushViewController(Ctl, animated: true)
    }
    /// 找回密码按钮
    @IBAction func forgetPasswordButton(sender: AnyObject) {
        let Ctl = self.storyboard?.instantiateViewControllerWithIdentifier("ForgetPasswordController") as! ForgetPasswordController
        self.navigationController?.pushViewController(Ctl, animated: true)
    }
    /// json数据
    var json:JSON = []
    var MBProgress:MBProgressHUD?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.masksToBounds   = true
        loginButton.layer.cornerRadius    = 5
        headImageView.layer.masksToBounds = true
        headImageView.layer.cornerRadius  = 50
    }
    
    func postLoginWith(userName:String,password:String){
        MBProgress = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        let getUrl = "http://app.city-base.net/jsonrpc.php?op=UserLogin&userid=\(userName)&password=\(password)"
        MBProgress?.show(true)
        RequestAPI.POST(getUrl, body: nil, succeed:succeed , failed: failed)
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

