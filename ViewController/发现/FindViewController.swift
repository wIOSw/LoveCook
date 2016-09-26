//
//  FindViewController.swift
//  LoveCook
//
//  Created by qianfeng on 16/9/20.
//  Copyright © 2016年 LiuWei. All rights reserved.
//

import UIKit

class FindViewController: BaseViewController {
    
    var bannerArr = NSMutableArray()
    var dataArr = NSMutableArray()

    lazy var collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .Vertical
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        let collectionView = UICollectionView.init(frame: CGRectMake(0, 64, SCREEN_W, SCREEN_H - 64 - 49), collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.whiteColor()
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.registerNib(UINib.init(nibName: "FindCell", bundle: nil), forCellWithReuseIdentifier: "FindCell")
        collectionView.registerClass(FindHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "FindHeaderView")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.view.addSubview(collectionView)
        
        return collectionView
        
    }()
    
    lazy var adView:XTADScrollView = {
        let adView = XTADScrollView.init(frame: CGRectMake(0, 0, SCREEN_W, 250))
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
        self.navigationItem.title = "发现"
        self.loadData()

        // Do any additional setup after loading the view.
    }
    
    func loadData() {
        //  /daydaycook/recommend/getMoreThemeRecipe.do
        //version=2.2.1&languagedld=3&mainland=1&regionCode=156
        let para = ["version":"2.2.1", "languagedld":"3", "mainland":"1", "regionCode":"156"]
        BaseRequest.postWithURL(HOME_URL + "/daydaycook/recommend/getMoreThemeRecipe.do", para: para) { (data, error) in
            if error == nil {
                let obj = try! NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as! NSDictionary
            
                
                let arr = MainModel.arrayOfModelsFromDictionaries(obj["-1"] as! [AnyObject])
                
                print(arr)
                for model in arr {
                    self.bannerArr.addObject((model as! MainModel).imageUrl)
                }
                for i in 1...8 {
                    let arr = obj["\(i)"] as! [AnyObject]
                    let arr1 = MainModel.arrayOfModelsFromDictionaries(arr)
                    self.dataArr.addObjectsFromArray(arr1 as [AnyObject])
                }
                dispatch_async(dispatch_get_main_queue(), {
                    
                    self.adView.imageURLArray = self.bannerArr as [AnyObject]
                    self.collectionView.reloadData()
                })
                
            }else{
                
                print(error)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension FindViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake((SCREEN_W - 2)/2, (SCREEN_W - 2)/2)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("FindCell", forIndexPath: indexPath) as! FindCell
        let model = dataArr[indexPath.item] as! MainModel
        cell.label.text = "#" + model.title
        cell.iamgeView.setImageWithURL(NSURL.init(string: model.imageUrl)!)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets.init(top: 2, left: 0, bottom: 2, right: 0)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSizeMake(SCREEN_W, 250)
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let view = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "FindHeaderView", forIndexPath: indexPath) as! FindHeaderView
        view.addSubview(adView)
        return view
    }
    
    
}


