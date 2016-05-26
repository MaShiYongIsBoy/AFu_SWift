//
//  WeatherViewController.swift
//  AFu_Swift
//
//  Created by bang on 16/3/15.
//  Copyright © 2016年 BangDeam. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    @IBAction func back_Button(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

// MARK: - 代理方法
extension WeatherViewController:UICollectionViewDataSource,UICollectionViewDelegate{
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("", forIndexPath: indexPath) 
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        let headView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "WeatherCollectionReusableView", forIndexPath: indexPath) as! WeatherCollectionReusableView
        return headView
    }
}