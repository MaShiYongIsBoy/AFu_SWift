//
//  ManureListCell.swift
//  AFu_Swift
//
//  Created by bang on 16/3/21.
//  Copyright © 2016年 BangDeam. All rights reserved.
//

import UIKit

class ManureListCell: UITableViewCell {
    /// 内容简介图
    @IBOutlet weak var infoImageView: UIImageView!
    /// 时间
    @IBOutlet weak var timeLabel: UILabel!
    /// 名字
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
