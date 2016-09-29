//
//  RecipeViewController.swift
//  LoveCook
//
//  Created by qianfeng on 16/9/20.
//  Copyright © 2016年 LiuWei. All rights reserved.
//

import UIKit

class RecipeViewController: BaseViewController {
    
    var dataArr = NSMutableArray()
    
    lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .Vertical
        layout.sectionInset = UIEdgeInsetsMake(5, 5, 0, 0)
        
        let collectionView = UICollectionView.init(frame: CGRectMake(0, 64, SCREEN_W, SCREEN_H - 64 - 49), collectionViewLayout: layout)
        collectionView.registerNib(UINib.init(nibName: "HighCCell", bundle: nil), forCellWithReuseIdentifier: "HighCCell")
        collectionView.backgroundColor = UIColor.whiteColor()
        collectionView.delegate = self
        collectionView.dataSource = self
        
       
        self.view.addSubview(collectionView)
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
//        self.navigationController?.automaticallyAdjustsScrollViewInsets = false
        self.navigationItem.title = "食谱"
        self.loadData()
        // Do any additional setup after loading the view.
    }
    
    func loadData() {
        HDManager.startLoading()
        newModel.requestNewData { (newArr, error) in
            if error == nil {
                self.dataArr.addObjectsFromArray(newArr!)
                self.collectionView.reloadData()
                 HDManager.stopLoading()
            }else{
                print(error)
                HDManager.stopLoading()
            }
        }
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


extension RecipeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource , UICollectionViewDelegate {
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("HighCCell", forIndexPath: indexPath) as! HighCCell
        
        let model = dataArr[indexPath.item] as! newModel
        
        cell.imageV.sd_setImageWithURL(NSURL.init(string: model.imageUrl)!)
        cell.titleL.text = model.title
        cell.DesL.text = model.Description
        cell.countL.text = "\(model.clickCount)"
        return cell
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        collectionView.deselectItemAtIndexPath(indexPath, animated: true)
        let dvc = DetailViewController()
        let model = dataArr[indexPath.item] as! newModel
        dvc.id = model.id
        self.navigationController?.pushViewController(dvc, animated: true)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake((SCREEN_W - 15) / 2, (SCREEN_W - 15) / 2 + 50)
    }
    
    
    
}


