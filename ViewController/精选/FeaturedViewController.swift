//
//  FeaturedViewController.swift
//  LoveCook
//
//  Created by qianfeng on 16/9/20.
//  Copyright © 2016年 LiuWei. All rights reserved.
//

import UIKit

class FeaturedViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .Search, target: self, action: #selector(self.barBtnItemClick))
        self.loadData()
    }

    func barBtnItemClick() {
        
    }
    
    func loadData() {
      
    }
    
   

}
