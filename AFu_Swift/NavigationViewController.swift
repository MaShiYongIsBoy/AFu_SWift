//
//  NavigationViewController.swift
//  AFu_Swift
//
//  Created by bang on 16/3/15.
//  Copyright © 2016年 BangDeam. All rights reserved.
//

import UIKit

class NavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

       self.interactivePopGestureRecognizer!.delegate = nil;
    }
}
