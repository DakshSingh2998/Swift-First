//
//  TableViewCellCoreData.swift
//  First
//
//  Created by Daksh on 09/02/23.
//

import UIKit

class TableViewCellCoreData: UITableViewCell {

    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
