//
//  NoteTableViewCell.swift
//  Notes ++
//
//  Created by Shahbaz Alam on 09/09/20.
//  Copyright © 2020 Shahbaz Alam. All rights reserved.
//

import UIKit

class NoteTableViewCell: UITableViewCell{

    @IBOutlet weak var tableViewCell: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        

        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
