//
//  CustomLabel.swift
//  First
//
//  Created by Daksh on 24/01/23.
//

import Foundation
import UIKit
class CustomLabel: UILabel{
    required init?(coder aDecoder:NSCoder){
        super.init(coder: aDecoder)
            self.layer.cornerRadius = self.frame.width / 2
            self.backgroundColor = UIColor(named: "DColor")
            self.clipsToBounds = true
        
    }
}
