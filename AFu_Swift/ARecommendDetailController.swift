//
//  ARecommendDetailController.swift
//  AFu_Swift
//
//  Created by bang on 16/4/6.
//  Copyright © 2016年 BangDeam. All rights reserved.
//

import UIKit

class ARecommendDetailController: UIViewController {
    /// 返回
    @IBAction func backButton(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    /// 列表
    @IBOutlet weak var mytableView: UITableView!
    /// 表头
    var headView:ARecommendDetailHeadView?
    /// 表尾
    var footView:ARecommendDetailFooterView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headView = ARecommendDetailHeadView.loadRecommendHeadViewFromNib()
        
        footView = ARecommendDetailFooterView.loadRecommendFootViewFromNib()
        
        mytableView.tableHeaderView = headView
        mytableView.tableFooterView = footView
        
        weak var weakSelf = self
        let Ctl = self.storyboard?.instantiateViewControllerWithIdentifier("MyCommentController") as! MyCommentController
        
        footView?.clickCommectButton = {
         weakSelf?.presentViewController(Ctl, animated: true, completion: nil)
        }
    }
}

/// MARK - UITableView 代理
extension ARecommendDetailController:UITableViewDelegate,UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("RecommenfDetailCell") as!RecommenfDetailCell
        return cell
    }
}