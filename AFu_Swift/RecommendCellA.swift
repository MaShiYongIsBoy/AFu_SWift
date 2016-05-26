//
//  RecommendCellA.swift
//  AFu_Swift
//
//  Created by bang on 16/3/29.
//  Copyright © 2016年 BangDeam. All rights reserved.
//

import UIKit

class RecommendCellA: UITableViewCell {
    /// 简介
    @IBOutlet weak var infoLabel: UILabel!
    /// 名字
    @IBOutlet weak var nameTitle: UILabel!
    /// 图片简介
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
