//
//  RegistController.swift
//  AFu_Swift
//
//  Created by bang on 16/3/31.
//  Copyright © 2016年 BangDeam. All rights reserved.
//

import UIKit

class RegistController: UIViewController {
    /// 商标头像
    @IBOutlet weak var headImageView: UIImageView!
    /// 验证码
    @IBOutlet weak var codeFiled: UITextField!
    /// 密码
    @IBOutlet weak var passwordFiled: UITextField!
    /// 用户名
    @IBOutlet weak var phoneFiled: UITextField!
    /// 提交按钮
    @IBOutlet weak var replyButton: UIButton!
    /// 获取验证码
    @IBAction func getCodeButton(sender: AnyObject) {
    }
    /// 提交按钮事件
    @IBAction func replyButton(sender: AnyObject) {
    }
    /// 返回按钮
    @IBAction func backButton(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        replyButton.layer.masksToBounds = true
        replyButton.layer.cornerRadius = 5
        headImageView.layer.masksToBounds = true
        headImageView.layer.cornerRadius = 50
    }

}
