//
//  TableViewCell.swift
//  First
//
//  Created by Daksh on 22/01/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var tbView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
