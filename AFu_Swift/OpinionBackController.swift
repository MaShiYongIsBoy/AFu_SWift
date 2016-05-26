//
//  OpinionBackController.swift
//  AFu_Swift
//
//  Created by bang on 16/3/30.
//  Copyright © 2016年 BangDeam. All rights reserved.
//

import UIKit

class OpinionBackController: UIViewController {

    @IBAction func backButton(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // http://app.city-base.net/jsonrpc.php?op=AddYJFK&mid=%@&uname=%@&content=%@
    }
}
