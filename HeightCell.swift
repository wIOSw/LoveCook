//
//  HeightCell.swift
//  LoveCook
//
//  Created by qianfeng on 16/9/26.
//  Copyright © 2016年 LiuWei. All rights reserved.
//

import UIKit

class HeightCell: UITableViewCell {

    var dataArr = NSMutableArray()
    
    var section = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.contentView.backgroundColor = UIColor.redColor()
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
