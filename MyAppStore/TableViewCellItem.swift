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

    func setItem(item:Item){
        labelItemName.text = item.item_name
        labelStoreName.text = item.toStoreType?.store_name
        imageViewItemImage.image = item.image as! UIImage
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        
        labelDateAdd.text = dateFormatter.string(from: item.date_add as! Date)
        
    }
}
