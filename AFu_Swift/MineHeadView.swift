//
//  MineHeadView.swift
//  AFu_Swift
//
//  Created by bang on 16/3/29.
//  Copyright © 2016年 BangDeam. All rights reserved.
//

import UIKit

class MineHeadView: UIView,UIPickerViewDelegate,UINavigationControllerDelegate {
    /// 点击头像回传方法
    var clickUserImage:(() -> ())?
    /// 用户头像
    @IBOutlet weak var userimageTap: UIImageView!
    /// 从nib请求组头
    class func loadMineHeadViewFromNib() ->MineHeadView{
        let headVew = NSBundle.mainBundle().loadNibNamed("MineHeadView", owner: nil, options: nil).last as? MineHeadView
        return headVew!
    }

    override func awakeFromNib() {
        let userImageTap = UITapGestureRecognizer(target: self, action: #selector(MineHeadView.userImageTap))
        self.userimageTap.addGestureRecognizer(userImageTap)
    }
    
    func userImageTap() -> Void {
        if (clickUserImage != nil) {
            clickUserImage!()
        }
    }

}
