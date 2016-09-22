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
    let secNameArr = ["挑战日日煮","每日新菜馆","当红人气菜","美食全攻略"]
    lazy var tableView: UITableView = {
       
        let tableView = UITableView.init(frame: CGRectMake(0, 64, SCREEN_W, SCREEN_H - 64 - 49), style: UITableViewStyle.Grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerNib(UINib.init(nibName: "newRedCell", bundle: nil), forCellReuseIdentifier: "newRedCell")
        
        tableView.registerNib(UINib.init(nibName: "simpleCell", bundle: nil), forCellReuseIdentifier: "simpleCell")
        tableView.tableHeaderView = self.adView
        self.view.addSubview(tableView)
        return tableView
    }()
    
    lazy var adView:XTADScrollView = {
        let adView = XTADScrollView.init(frame: CGRectMake(0, 0, SCREEN_W, 200))
        //是否启动轮播
        adView.infiniteLoop = true
        //是否显示pageControl
        adView.needPageControl = true
        //pageControl显示的位置
        adView.pageControlPositionType = pageControlPositionTypeRight
        return adView
    }()

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         self.navigationController?.automaticallyAdjustsScrollViewInsets = false
        // Do any additional setup after loading the view.
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .Search, target: self, action: #selector(self.barBtnItemClick))
        self.loadData()
        self.navigationItem.title = "首页"
    }
    
    func loadData() {
      //轮播视图
        bannerModel.requestBannerData { (bannerArr, error) in
            if error == nil {
                self.adView.imageURLArray = bannerArr
                self.tableView.reloadData()

            }else{
                print(error)
            }
        }
        
        challengeModel.requestChallengeData { (challengeArr, error) in
            if error == nil {
                self.dataArr.addObject(challengeArr!)
                self.tableView.reloadData()
            }else{
                print(error)
            }
        }
        
        MainModel.requestNewData { (newArr, error) in
            if error == nil {
                self.dataArr.addObject(newArr!)
                self.tableView.reloadData()
            }else{
                print(error)
            }
        }
        
        MainModel.requestRedData { (hotArr, simpleArr, error) in
            if error == nil {
                self.dataArr.addObject(hotArr!)
                self.dataArr.addObject(simpleArr!)
                self.tableView.reloadData()
                
            }else{
                print(error)
            }
        }
        
        
       
        
    }
    
    

    func barBtnItemClick() {
        
    }
}

extension FeaturedViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        print(dataArr.count)
        return dataArr.count
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 || section == 1 || section == 2 {
            return 1
        }else{
            return (dataArr[section] as! [AnyObject]).count
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 150
        }else if indexPath.section == 1 || indexPath.section == 2 {
            return 300
        }else{
            return 200
        }
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        
        if indexPath.section == 0 || indexPath.section == 1 || indexPath.section == 2 {
            let cell = tableView.dequeueReusableCellWithIdentifier("newRedCell", forIndexPath: indexPath) as! newRedCell
            cell.section = indexPath.section
            cell.dataArr = self.dataArr[indexPath.section] as! [AnyObject]
            cell.section =  indexPath.section
            cell.collectionV.reloadData()
            
            return cell
            
        }else{
            let cell = tableView.dequeueReusableCellWithIdentifier("simpleCell", forIndexPath: indexPath) as! simpleCell
            let model = dataArr[3][indexPath.row] as! MainModel
            
            cell.titleL.text = model.title
            cell.descL.text = model.Description
            cell.imageV.sd_setImageWithURL(NSURL.init(string: model.imageUrl)!)
            return cell
        }
    }
    
    
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    
        let label = UILabel.init(frame: CGRectMake(0, 0, SCREEN_W, 50))
        label.text = secNameArr[section]
        label.textAlignment = .Center
        label.font = UIFont.boldSystemFontOfSize(15)
        return label
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0 
    }
    
    
    
}


