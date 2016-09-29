//
//  SearchViewController.swift
//  LoveCook
//
//  Created by qianfeng on 16/9/29.
//  Copyright © 2016年 LiuWei. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.createUI()
    }
    
    func createUI() {
       let searchBar = UISearchBar.init(frame: CGRectMake(20, 30, SCREEN_W - 100, 30))
        searchBar.placeholder = "食材/菜谱/主题"
        self.view.addSubview(searchBar)
        
        let btn = UIButton.init(type: .System)
        btn.frame = CGRectMake(20 + searchBar.frame.size.width + 10, 30, 60, 30)
        btn.setTitle("取消", forState: .Normal)
        btn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        btn.backgroundColor = UIColor.orangeColor()
        btn.addTarget(self, action: #selector(self.btnClick), forControlEvents: .TouchUpInside)
        self.view.addSubview(btn)
    }
    
    func btnClick() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
