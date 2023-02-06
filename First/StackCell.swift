//
//  StackCell.swift
//  First
//
//  Created by Daksh on 06/02/23.
//

import UIKit

class StackCell: UITableViewCell {

    @IBOutlet weak var horizontalStack: UIStackView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
