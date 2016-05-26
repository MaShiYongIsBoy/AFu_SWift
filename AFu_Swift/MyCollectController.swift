//
//  MyCollectController.swift
//  AFu_Swift
//
//  Created by bang on 16/3/30.
//  Copyright © 2016年 BangDeam. All rights reserved.
//

import UIKit

class MyCollectController: UIViewController {
    @IBOutlet weak var buttonView: UIView!

    @IBAction func backButton(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    /// 记录tag
    var count:Int?
    /// 标题 button数组
    var buttons = NSMutableArray()
    ///  子视图Scroller
    var scrollChild = UIScrollView()
    /// 标题数组
    var buttonArr:NSArray = ["店铺收藏","文章收藏"]
    override func viewDidLoad() {
        super.viewDidLoad()
        count = 1
        /// 添加子视图
        addChildController()
        /// 添加标题
        setTitleButton()
        /// 设置button title color
        setButtonTitleColorWith(count!)
        /// 添加scrollerview
        addScrollerView()
        /// 添加子视图到scroller
        addChildToScroller()
    }
    /// 添加子视图控制器
    func addChildController(){
        let collectCtlA = self.storyboard?.instantiateViewControllerWithIdentifier("MyCollectControllerA") as! MyCollectControllerA
        let collectCtlB = self.storyboard?.instantiateViewControllerWithIdentifier("MyCollectControllerB") as! MyCollectControllerB
        self.addChildViewController(collectCtlA)
        self.addChildViewController(collectCtlB)
    }
    
    /// 添加标题button
    func setTitleButton(){
        for i in 0..<buttonArr.count {
            let button = UIButton()
            button.frame = CGRectMake(CGFloat(i)*AppWidth/CGFloat(buttonArr.count), 0, AppWidth/CGFloat(buttonArr.count), 40)
            button.setTitle("\(buttonArr[i])", forState: .Normal)
            button.setTitleColor(UIColor.blackColor(), forState: .Normal)
            button.titleLabel?.font = UIFont.systemFontOfSize(16.0)
            button.tag = i+1
            button.addTarget(self, action: #selector(ConsultViewController.buttonAction(_:)), forControlEvents: .TouchUpInside)
            buttonView.addSubview(button)
            buttons.addObject(button)
            
        }
    }
    
    /// 标题button的点击事件
    func buttonAction(sender:UIButton){
        var offSet = self.scrollChild.contentOffset
        offSet.x = (CGFloat(sender.tag - 1))*AppWidth
        self.scrollChild.setContentOffset(offSet, animated: true)
        setButtonTitleColorWith(sender.tag)
        
    }
    
    /// 设置button title颜色
    func setButtonTitleColorWith(tag:Int) -> Void {
        if tag != count {
            let button = self.view.viewWithTag(count!) as! UIButton
            button.setTitleColor(UIColor.blackColor(), forState: .Normal)
        }
        let currentButton = self.view.viewWithTag(tag) as! UIButton
        if tag == count {
            currentButton.setTitleColor(UIColor.msy_colorWithRGB(48, g: 179, b: 90, alpha: 1), forState: .Normal)
        }else{
            currentButton.setTitleColor(UIColor.msy_colorWithRGB(48, g: 179, b: 90, alpha: 1.0), forState: .Normal)
        }
        
        count = tag
    }
    
    /// 添加子视图控制器到scrollerview
    func addChildToScroller() -> Void {
        
        let scrollerview:UIScrollView = self.scrollChild
        let index = scrollerview.contentOffset.x/AppWidth
        let CtlArray = NSMutableArray()
        
        for Ctl:UIViewController in self.childViewControllers {
            CtlArray.addObject(Ctl)
        }
        
        let willShowCtl = CtlArray[Int(index)] as!UIViewController
        if willShowCtl.isViewLoaded() {
            return
        }
        scrollerview.addSubview(willShowCtl.view)
        willShowCtl.view.frame = CGRectMake(AppWidth*index, 0, AppWidth, AppHeight-104)
    }
    
    /// 添加ScrollerView
    func addScrollerView() -> Void {
        let scroller:UIScrollView = UIScrollView(frame: ScrollFram)
        scroller.delegate      = self
        scroller.pagingEnabled = true
        scroller.bounces       = false
        scroller.showsHorizontalScrollIndicator = false
        self.view.addSubview(scroller)
        self.scrollChild = scroller
        
        self.automaticallyAdjustsScrollViewInsets = false
        scroller.contentSize = CGSizeMake(CGFloat(self.childViewControllers.count)*AppWidth, 0)
    }
}
/// MARK - UIScroller 代理
extension MyCollectController:UIScrollViewDelegate{
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let index:CGFloat = scrollView.contentOffset.x/AppWidth
        setButtonTitleColorWith(Int(index+1))
        addChildToScroller()
    }
    
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
        
        addChildToScroller()
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
    }
}
