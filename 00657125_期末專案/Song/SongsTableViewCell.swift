//
//  SongsTableViewCell.swift
//  00657125_期末專案
//
//  Created by User04 on 2019/6/20.
//  Copyright © 2019 ntou. All rights reserved.
//

import UIKit

class SongsTableViewCell: UITableViewCell {
    
    var previewUrl:URL?
    
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var collectionNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
