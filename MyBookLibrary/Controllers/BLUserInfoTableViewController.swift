//
//  BLUserInfoTableViewController.swift
//  MyBookLibrary
//
//  Created by Heng Zeng on 12/31/15.
//  Copyright © 2015 verazeng. All rights reserved.
//

class BLUserInfoTableViewController: UITableViewController {

    @IBOutlet weak var libraryName: UILabel!
    @IBOutlet weak var libraryAdminName: UILabel!
    @IBOutlet weak var userInfoView: UIStackView!
    @IBOutlet weak var userName: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.updateLibraryInfoCell()
        self.updateUserInfoCell()
    }
    
    private func updateUserInfoCell() {
        if let user = BLUser.currentUser() {
            self.userName.text = user.username
        } else {
            self.userName.text = "未登录，点击登录"
        }
    }
    
    private func updateLibraryInfoCell() {
        let tabVC = self.tabBarController as! BLLibraryTabViewController
        self.libraryName.text = tabVC.library.name
        self.libraryAdminName.text = tabVC.library.admins.firstObject!.username
    }
    
    @IBAction func changeLibrary(sender: UIButton) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.loadSelectLibraryVC()
    }
    
    //MARK# dataSource and delegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 1 {
            if let _ = BLUser.currentUser() {
                let actionView = UIAlertController(title: nil, message: "退出登录", preferredStyle: .ActionSheet)
                actionView.addAction(UIAlertAction(title: "确定", style: .Default, handler: { (action) -> Void in
                    BLUser.logOut()
                    self.updateUserInfoCell()
                }))
                actionView.addAction(UIAlertAction(title: "取消", style: .Destructive, handler: nil))
                self.presentViewController(actionView, animated: true, completion: nil)                
            } else {
                let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                self.showViewController(appDelegate.loginVC(), sender: nil)
            }
        }
    }
    
}
