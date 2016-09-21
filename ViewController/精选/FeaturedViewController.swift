//
//  FeaturedViewController.swift
//  LoveCook
//
//  Created by qianfeng on 16/9/20.
//  Copyright © 2016年 LiuWei. All rights reserved.
//

import UIKit

class FeaturedViewController: BaseViewController {

    var dataArr = NSMutableArray()
    lazy var tableView: UITableView = {
       
        let tableView = UITableView.init(frame: CGRectMake(0, 0, SCREEN_W, SCREEN_H), style: UITableViewStyle.Plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerNib(UINib.init(nibName: "FeaturedCell", bundle: nil), forCellReuseIdentifier: "FeaturedCell")
        self.view.addSubview(self.tableView)
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .Search, target: self, action: #selector(self.barBtnItemClick))
        self.loadData()
        self.navigationItem.title = "首页"
    }
    
    func loadData() {
        FeatureModel.requestHomeData { (cateArray, error) in
            if error == nil {
                
            }else{
                
                
            }
        }
        
    }
    
    

    func barBtnItemClick() {
        
    }
}

extension FeaturedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(frame: CGRectMake(0, 0, 0, 0))
        return cell
    }
    
    
}


