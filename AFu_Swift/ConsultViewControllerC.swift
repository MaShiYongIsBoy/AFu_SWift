//
//  ConsultViewControllerC.swift
//  AFu_Swift
//
//  Created by bang on 16/3/29.
//  Copyright © 2016年 BangDeam. All rights reserved.
//

import UIKit

class ConsultViewControllerC: UIViewController {
    @IBOutlet weak var myTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
/// MARK-UITableView代理事件
extension ConsultViewControllerC:UITableViewDataSource,UITableViewDelegate{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func  tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ConsultCellC") as! ConsultCellC
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}


