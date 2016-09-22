//
//  simpleCell.swift
//  LoveCook
//
//  Created by qianfeng on 16/9/21.
//  Copyright © 2016年 LiuWei. All rights reserved.
//

import UIKit

class simpleCell: UITableViewCell {
    
    @IBOutlet weak var imageV: UIImageView!
    
    
    @IBOutlet weak var titleL: UILabel!
    
    @IBOutlet weak var descL: UILabel!
       
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
