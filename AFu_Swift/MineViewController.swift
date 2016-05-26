//
//  MineViewController.swift
//  AFu_Swift
//
//  Created by bang on 16/3/16.
//  Copyright © 2016年 BangDeam. All rights reserved.
//

import UIKit

class MineViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    /// 表头
    var mineHeadView:MineHeadView?
    /// 弹窗
    var alertC:UIAlertController?
    /// 取消按钮
    var cancelAction:UIAlertAction?
    /// 相机按钮
    var camera:UIAlertAction?
    /// 相册按钮
    var photoLibrary:UIAlertAction?
    /// 相册相机视屏控制器
    var imagePickerCtl:UIImagePickerController?
    let nameArray:NSArray = [["个人资料"],["我的收藏","在线咨询"],["推荐给朋友","关于我们","软件评分"],["使用帮助","意见反馈"],["登录"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mineHeadView = MineHeadView.loadMineHeadViewFromNib()
        myTableView.tableHeaderView = mineHeadView!
        
        weak var weakSelf = self
        mineHeadView?.clickUserImage = {
            weakSelf!.setUpAlertCtl()
        }
    }
    /// 设置弹窗
    func setUpAlertCtl(){
        alertC = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
        cancelAction = UIAlertAction(title: "取消", style: .Cancel, handler: { (UIAlertAction) in
            
        })
        
        camera = UIAlertAction(title: "相机", style: .Default, handler: { (UIAlertAction) in
            self.cameraAction()
        })
        
        photoLibrary = UIAlertAction(title: "相册", style: .Default, handler: { (UIAlertAction) in
            self.photoLibraryAction()
        })
        
        alertC?.addAction(cancelAction!)
        alertC?.addAction(camera!)
        alertC?.addAction(photoLibrary!)
        self.presentViewController(alertC!, animated: true, completion: nil)
    }
    /// 触发相机事件
    func cameraAction(){
        let imagePickerCtl            = UIImagePickerController()
        imagePickerCtl.sourceType     = UIImagePickerControllerSourceType.Camera
        let mediaTypes:NSMutableArray = []
        mediaTypes.addObject(String(kUTTypeImage))
        imagePickerCtl.mediaTypes     = mediaTypes.copy() as! [String]
        imagePickerCtl.delegate       = self
        self.presentViewController(imagePickerCtl
            , animated: true, completion: nil)
    }
    /// 触发相册事件
    func photoLibraryAction(){
        let imagePickerCtl            = UIImagePickerController()
        imagePickerCtl.sourceType     = UIImagePickerControllerSourceType.PhotoLibrary
        let mediaTypes:NSMutableArray = []
        mediaTypes.addObject(String(kUTTypeImage))
        imagePickerCtl.mediaTypes     = mediaTypes.copy() as! [String]
        imagePickerCtl.delegate       = self
        self.presentViewController(imagePickerCtl
            , animated: true, completion: nil)
    }
}
/// MARK-UITableView的代理事件
extension MineViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray[section].count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MineCell") as!MineCell
        let dataArray = nameArray[indexPath.section] as!NSArray
        cell.nameLabel.text = "\(dataArray[indexPath.row])"
        return cell
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 {
            let Ctl = self.storyboard?.instantiateViewControllerWithIdentifier("UserInfoController") as! UserInfoController
            self.navigationController?.pushViewController(Ctl, animated: true)
        }else if indexPath.section == 1{
            switch indexPath.row {
            case 0:
                let Ctl = self.storyboard?.instantiateViewControllerWithIdentifier("MyCollectController") as! MyCollectController
                self.navigationController?.pushViewController(Ctl, animated: true)
            case 1:
                let Ctl = self.storyboard?.instantiateViewControllerWithIdentifier("AboutUsController") as! AboutUsController
                self.navigationController?.pushViewController(Ctl, animated: true)
            default:
                break
            }
        }else if indexPath.section == 2{
            switch indexPath.row {
            case 0:
                weak var weakSelf = self
                let itemFriend:ZYShareItem = ZYShareItem.init(title: "分享到朋友圈", icon: "weixinFriend", handler: {
                    weakSelf?.itemAction("分享到朋友圈")
                })
                
                let itemWeiXin:ZYShareItem = ZYShareItem.init(title: "发给朋友", icon: "weixin", handler: {
                     weakSelf?.itemAction("发给朋友")
                })
                
                let itemQQ:ZYShareItem = ZYShareItem.init(title: "QQ", icon: "qq", handler: {
                     weakSelf?.itemAction("QQ")
                })
                
                let itemQQHome:ZYShareItem = ZYShareItem.init(title: "QQ空间", icon: "qqHome", handler: {
                     weakSelf?.itemAction("QQ空间")
                })
                
                let shareView:ZYShareView = ZYShareView.init(shareItems: [itemWeiXin,itemFriend,itemQQHome,itemQQ], functionItems: nil)
                
                shareView.show()
                break
            case 1:
                let Ctl = self.storyboard?.instantiateViewControllerWithIdentifier("AboutUsController") as! AboutUsController
                self.navigationController?.pushViewController(Ctl, animated: true)
                break
            case 2:
                var pingfenurl = "itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=1059273784"
                pingfenurl = "itms-apps://itunes.apple.com/app/id1059273784"
                UIApplication.sharedApplication().openURL(NSURL(string: pingfenurl)!)
                break
            default:
                break
            }
        }else if indexPath.section == 3{
            switch indexPath.row {
            case 0:
                let Ctl = self.storyboard?.instantiateViewControllerWithIdentifier("HelpController") as! HelpController
                self.navigationController?.pushViewController(Ctl, animated: true)
            case 1:
                let Ctl = self.storyboard?.instantiateViewControllerWithIdentifier("OpinionBackController") as! OpinionBackController
                self.navigationController?.pushViewController(Ctl, animated: true)
            default:
                break
            }
        }else if indexPath.section == 4{
            let Ctl = self.storyboard?.instantiateViewControllerWithIdentifier("LoginInController") as! LoginInController
            self.navigationController?.pushViewController(Ctl, animated: true)
        }
    }
    /// 分享
    func itemAction(title:String){
        
        let shareParames = NSMutableDictionary()
        shareParames.SSDKSetupShareParamsByText("分享内容",
                                                images : UIImage(named: "bg.png"),
                                                url : NSURL(string:"http://mob.com"),
                                                title : "分享标题",
                                                type : SSDKContentType.Image)
        
        //2.进行分享
        ShareSDK.share(SSDKPlatformType.SubTypeWechatSession, parameters: shareParames) { (state : SSDKResponseState, userData : [NSObject : AnyObject]!, contentEntity :SSDKContentEntity!, error : NSError!) -> Void in
            
            switch state{
                
            case SSDKResponseState.Success:
                let alert = UIAlertView(title: "分享成功", message: "分享成功", delegate: self, cancelButtonTitle: "取消")
                alert.show()
            case SSDKResponseState.Fail:    print("分享失败,错误描述:\(error)")
            case SSDKResponseState.Cancel:  print("分享取消")
                
            default:
                break
            }
        }
    }
}
/// MARK- 调用相机的代理方法
extension MineViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
}