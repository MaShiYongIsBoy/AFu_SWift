//
//  AFMedicineViewController.swift
//  AFu_Swift
//
//  Created by bang on 16/3/22.
//  Copyright © 2016年 BangDeam. All rights reserved.
//

import UIKit

class AFMedicineViewController: UIViewController {
    
    @IBAction func backButton(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    @IBOutlet weak var buttonView: UIView!
    /// 标题button存放数组
    var buttons = NSMutableArray()
    /// 记录tag
    var count:Int?
    /// 那种作物
    var sid:String?
    /// 标题数组
    let buttonArr:NSArray = ["全部","病害","虫害","草害"]
    /// 子视图的scroller
    var scrollChild = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        count = 1
        /// 设置标题button
        addKingTitle()
        /// 添加子视图控制器
        addChildController()
        /// 添加scrollerView
        addScrollerView()
        /// 添加子视图控制器到scrollerview
        addChildToScroller()
        /// 设置button的颜色
        setButtonTitleColorWith(count!)
    }
    /// 添加标题button
    func addKingTitle() -> Void {
        
        for i in 0 ..< buttonArr.count{
            let button = UIButton()
            button.frame = CGRectMake(CGFloat(i)*AppWidth/CGFloat(buttonArr.count), 0, AppWidth/CGFloat(buttonArr.count), 40)
            button.setTitle("\(buttonArr[i])", forState: .Normal)
            button.setTitleColor(UIColor.blackColor(), forState: .Normal)
            button.titleLabel?.font = UIFont.systemFontOfSize(16.0)
            button.tag = i+1
            button.addTarget(self, action:#selector(AFMedicineViewController.buttonAction(_:)), forControlEvents: .TouchUpInside)
            buttonView.addSubview(button)
            buttons.addObject(button)
        }
    }
    /// button点击事件
    func buttonAction(sender:UIButton) -> Void {
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
    
    /// 添加子视图控制器
    func addChildController() {
        let medicineCtlA = self.storyboard?.instantiateViewControllerWithIdentifier("AFMedicineChildControllerA") as! AFMedicineChildControllerA
        let medicineCtlB = self.storyboard?.instantiateViewControllerWithIdentifier("AFMedicineChildControllerB") as! AFMedicineChildControllerB
        let medicineCtlC = self.storyboard?.instantiateViewControllerWithIdentifier("AFMedicineChildControllerC") as! AFMedicineChildControllerC
        let medicineCtlD = self.storyboard?.instantiateViewControllerWithIdentifier("AFMedicineChildControllerD") as! AFMedicineChildControllerD
        self.addChildViewController(medicineCtlA)
        self.addChildViewController(medicineCtlB)
        self.addChildViewController(medicineCtlC)
        self.addChildViewController(medicineCtlD)
        medicineCtlA.sid = self.sid
        medicineCtlB.sid = self.sid
        medicineCtlC.sid = self.sid
        medicineCtlD.sid = self.sid
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
        scroller.delegate = self
        scroller.pagingEnabled = true
        scroller.bounces = false
        scroller.showsHorizontalScrollIndicator = false
        self.view.addSubview(scroller)
        self.scrollChild = scroller
        
        self.automaticallyAdjustsScrollViewInsets = false
        scroller.contentSize = CGSizeMake(CGFloat(self.childViewControllers.count)*AppWidth, 0)
    }
}

extension AFMedicineViewController:UIScrollViewDelegate{
    
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






