//
//  MyCollectCellA.swift
//  AFu_Swift
//
//  Created by bang on 16/3/30.
//  Copyright © 2016年 BangDeam. All rights reserved.
//

import UIKit

class MyCollectCellA: UITableViewCell {
    /// 地图按钮
    @IBAction func mapButton(sender: AnyObject) {
    }
    /// 电话按钮
    @IBAction func phoneButton(sender: AnyObject) {
    }
    /// 详细简介
    @IBOutlet weak var infoLabel: UILabel!
    /// 名字
    @IBOutlet weak var nameLabel: UILabel!
    /// 图片
    @IBOutlet weak var headImageView: UIImageView!
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
