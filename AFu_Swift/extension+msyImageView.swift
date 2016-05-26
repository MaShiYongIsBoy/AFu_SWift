//
//  extension+msyImageView.swift
//  AFu_Swift
//
//  Created by bang on 16/3/15.
//  Copyright © 2016年 BangDeam. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView{
    func msy_setImageWithUrl(url:NSURL,placeHoderImage:UIImage){
        self.sd_setImageWithURL(url, placeholderImage: placeHoderImage)
    }
}