//
//  TeamItemCell.swift
//  NHL Stats
//
//  Created by Connor Dean on 2/17/19.
//  Copyright © 2019 Connor Dean. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    
    @IBOutlet var teamNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        teamNameLabel.adjustsFontForContentSizeCategory = true
    }
    
}
