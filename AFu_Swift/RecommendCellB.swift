//
//  RecommendCellB.swift
//  AFu_Swift
//
//  Created by bang on 16/3/29.
//  Copyright © 2016年 BangDeam. All rights reserved.
//

import UIKit

class RecommendCellB: UITableViewCell {
    /// 名字
    @IBOutlet weak var nameLabel: UILabel!
    /// 时间
    @IBOutlet weak var timeLabel: UILabel!
    /// 图片简介
    @IBOutlet weak var infoImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
