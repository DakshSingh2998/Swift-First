//
//  CustomButton.swift
//  First
//
//  Created by Daksh on 23/01/23.
//
import UIKit
import Foundation
class CustomButton: UIButton{
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
        
        self.layer.cornerRadius = self.frame.width / 2
        self.tintColor = UIColor(named: "DYellow")
        self.backgroundColor = UIColor(named: "DColor")
        self.alpha = 1.0
        self.titleLabel?.font = UIFont(name: "Noteworthy-Bold", size: 30.0)
        
        
        
    }
    
}
