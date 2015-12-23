//
//  BLUserInfoViewController.swift
//  MyBookLibrary
//
//  Created by Heng Zeng on 12/23/15.
//  Copyright © 2015 verazeng. All rights reserved.
//

import UIKit

class BLUserInfoViewController: UIViewController {

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var libraryName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabVC = self.tabBarController as! BLLibraryTabViewController
        self.libraryName.text = tabVC.library.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeLibrary(sender: UIButton) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.loadSelectLibraryVC()
    }
    
    @IBAction func logout(sender: UIButton) {
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
