//
//  AboutUsController.swift
//  AFu_Swift
//
//  Created by bang on 16/3/30.
//  Copyright © 2016年 BangDeam. All rights reserved.
//

import UIKit

class AboutUsController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBAction func phonrAction(sender: AnyObject) {
        let phoneNumber = "telprompt://15538998832"
        UIApplication.sharedApplication().openURL(NSURL(string: phoneNumber)!)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
