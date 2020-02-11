//
//  TableViewCellItem.swift
//  MyAppStore
//
//  Created by local192 on 11/02/2020.
//  Copyright © 2020 Université La Rochelle. All rights reserved.
//

import UIKit

class TableViewCellItem: UITableViewCell {

    @IBOutlet weak var labelStoreName: UILabel!
    @IBOutlet weak var labelDateAdd: UILabel!
    @IBOutlet weak var imageViewItemImage: UIImageView!
    @IBOutlet weak var labelItemName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
