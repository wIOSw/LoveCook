//
//  NewHotTCell.swift
//  LoveCook
//
//  Created by qianfeng on 16/9/27.
//  Copyright © 2016年 LiuWei. All rights reserved.
//

import UIKit

class NewHotTCell: UITableViewCell, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    var targ: AnyObject?
    var action: Selector?
    
    var dataArr: [AnyObject]! {
        didSet{
            collectionV.delegate = self
            collectionV.dataSource = self
            self.collectionV.reloadData()
        }
    }

    var section = 0
    
    @IBOutlet weak var collectionV: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       collectionV.registerNib(UINib.init(nibName: "HighCCell", bundle: nil), forCellWithReuseIdentifier: "HighCCell")
        
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("HighCCell", forIndexPath: indexPath) as! HighCCell
        if section == 1 {
            let model = dataArr[indexPath.item] as! newModel
            cell.imageV.sd_setImageWithURL(NSURL.init(string: model.imageUrl)!)
            cell.titleL.text = model.title
            cell.DesL.text = model.Description
            cell.countL.text = model.clickCount
        }else{
            let model = dataArr[indexPath.item] as! MainModel
            cell.imageV.sd_setImageWithURL(NSURL.init(string: model.imageUrl)!)
            cell.titleL.text = model.title
            cell.DesL.text = model.Description
            cell.countL.text = model.clickCount
        }
        
        
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(200, 300)
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let model = dataArr[indexPath.item]
        targ?.performSelector(self.action!, withObject: model)
    }
    
    
}



