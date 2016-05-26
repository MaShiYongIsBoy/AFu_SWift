//
//  ForgetPasswordController.swift
//  AFu_Swift
//
//  Created by bang on 16/3/31.
//  Copyright © 2016年 BangDeam. All rights reserved.
//

import UIKit

class ForgetPasswordController: UIViewController {
    /// 验证码
    @IBOutlet weak var codeFiled: UITextField!
    /// 密码
    @IBOutlet weak var passwordFiled: UITextField!
    /// 用户名
    @IBOutlet weak var phoneFiled: UITextField!
    /// 获取验证码事件
    @IBAction func getCodeButton(sender: AnyObject) {
    }
    /// 找回按钮
    @IBAction func findPasswordButton(sender: AnyObject) {
    }
    ///返回按钮
    @IBAction func backButton(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
