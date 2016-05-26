//
//  MyCollectControllerB.swift
//  AFu_Swift
//
//  Created by bang on 16/3/30.
//  Copyright © 2016年 BangDeam. All rights reserved.
//

import UIKit

class MyCollectControllerB: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
/// MARK - UITableView 代理
extension MyCollectControllerB:UITableViewDelegate,UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCollectCellB") as!MyCollectCellB
        return cell
    }
}
