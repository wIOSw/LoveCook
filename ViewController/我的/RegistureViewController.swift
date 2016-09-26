//
//  RegistureViewController.swift
//  PokechainDemo
//
//  Created by 夏婷 on 16/7/18.
//  Copyright © 2016年 夏婷. All rights reserved.
//

import UIKit

class RegistureViewController: UIViewController {

    @IBOutlet weak var idefyBtn: UIButton!
    @IBOutlet weak var userField: UITextField!
    
    @IBOutlet weak var idefyCodeFiled: UITextField!
    
    @IBOutlet weak var phoneCodeFiled: UITextField!
    var ssID:String! = ""
    var idfyUrl:String! = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "loginBackgroundImage.png")!)

        self.userField.backgroundColor = UIColor.clearColor()
        self.idefyCodeFiled.backgroundColor = UIColor.clearColor()
        self.phoneCodeFiled.backgroundColor = UIColor.clearColor()
        //获取默认的验证码信息
        self.updateIdefyCode(self)
    }
    
    //更新图片验证码
    @IBAction func updateIdefyCode(sender: AnyObject) {
        
        // methodName=UserVerify&token=&user_id=&version=4.4
        
        let para = ["methodName":"UserVerify","version":"4.4"]
        
        BaseRequest.postWithURL(HOME_URL, para: para) { (data, error) in
            
            if error == nil {
                
            
            }else{
                print("获取验证码失败")
            }
        }
        
    }
    
    //要求后台发送短信验证码
    @IBAction func sendPhoneCode(sender: AnyObject) {
        
       
    }

    
    @IBAction func nextStop(sender: AnyObject) {
        
        //code=197354&device_id=0819b83fb99&methodName=UserAuth&mobile=18515996749&token=&user_id=&version=4.4
        
    }
    
    
    

    @IBAction func backtoPreView(sender: AnyObject) {
        
        self.navigationController?.popViewControllerAnimated(true)

    }
    
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
