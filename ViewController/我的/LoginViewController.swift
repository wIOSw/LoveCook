//
//  LoginViewController.swift
//  PokechainDemo
//
//  Created by 夏婷 on 16/7/18.
//  Copyright © 2016年 夏婷. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var userField: UITextField!

    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "loginBackgroundImage.png")!)
        self.userField.backgroundColor = UIColor.clearColor()
        self.passwordField.backgroundColor = UIColor.clearColor()
        
        self.passwordField.secureTextEntry = true
    }

    @IBAction func backToPreView(sender: AnyObject) {
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func login(sender: AnyObject) {
        
        if userField.text == "" || passwordField.text == "" {
            let alert = UIAlertController.init(title: "提示", message: "账号或密码不能为空", preferredStyle: .Alert)
            let action = UIAlertAction.init(title: "知道了", style: .Default, handler: nil)
            alert.addAction(action)
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        if userField.text == "LoveCook" && passwordField.text == "Wei123" {
            let alert = UIAlertController.init(title: "登录成功", message: nil,     preferredStyle: .Alert)
            let action = UIAlertAction.init(title: "好的", style: .Default, handler: nil)
            alert.addAction(action)
            self.presentViewController(alert, animated: true, completion: nil)
        }else{
            let alert = UIAlertController.init(title: "登录失败", message: "账号或密码不正确",preferredStyle: .Alert)
            let action = UIAlertAction.init(title: "好", style: .Default, handler: nil)
            alert.addAction(action)
            self.presentViewController(alert, animated: true, completion: nil)
        }

        
    }
    
   
    @IBAction func registureUser(sender: AnyObject) {
        
        let registureVC = RegistureViewController.init()
        self.navigationController?.pushViewController(registureVC, animated: true)
    }
    
    
    @IBOutlet weak var forgetPassword: UIButton!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
