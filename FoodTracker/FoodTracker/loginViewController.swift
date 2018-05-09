//
//  loginViewController.swift
//  FoodTracker
//
//  Created by 薛伟 on 2018/5/9.
//  Copyright © 2018年 Will. All rights reserved.
//

import UIKit
import os.log

class loginViewController: UIViewController {
    
    //MARK: Properties
    let sampleLogin = ["username": "xw", "password": "123456"]
    @IBOutlet weak var hintWordLabel: UILabel!
    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    @IBAction func loginButtonAction(_ sender: UIButton) {
        
    }

    //MARK: Navigation
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if let savedLoginInfo = loadInfo(), let checkU = savedLoginInfo["username"], let checkP = savedLoginInfo["password"] {
            if (checkU == usernameInput.text) && (checkP == passwordInput.text) {
                return true
            } else {
                hintWordLabel.text = "用户名或密码错误！请重试"
                return false
            }
        } else {
            let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(sampleLogin, toFile: Meal.ArchiveURL2.path)
            if isSuccessfulSave {
                os_log("Info successfully saved.", log: OSLog.default, type: .debug)
            } else {
                os_log("Failed to save info...", log: OSLog.default, type: .error)
            }
            if (sampleLogin["username"] == usernameInput.text) && (sampleLogin["password"] == passwordInput.text) {
                return true
            } else {
                hintWordLabel.text = "用户名或密码错误！请重试"
                return false
            }
        }
    }
    
    //MARK: private methods
    func loadInfo() -> [String: String]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Meal.ArchiveURL2.path) as? [String: String]
    }

}
