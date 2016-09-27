//
//  SimpleTCell.swift
//  LoveCook
//
//  Created by qianfeng on 16/9/27.
//  Copyright © 2016年 LiuWei. All rights reserved.
//

import UIKit

class SimpleTCell: UITableViewCell {

    @IBOutlet weak var imageV: UIImageView!
    
    @IBOutlet weak var titleL: UILabel!
    
    
    @IBOutlet weak var DesL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
