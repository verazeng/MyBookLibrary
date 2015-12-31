//
//  UIViewController+extensions.swift
//  MyBookLibrary
//
//  Created by Heng Zeng on 12/31/15.
//  Copyright © 2015 verazeng. All rights reserved.
//

import Foundation

extension UIViewController {
    func showAlertView(message: String) {
        let alertView = UIAlertController(title: nil, message: message, preferredStyle: .Alert)
        alertView.addAction(UIAlertAction(title: "确认", style: .Default, handler: nil))
        self.presentViewController(alertView, animated: true, completion: nil)
    }
}