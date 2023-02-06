//
//  SharedPreference.swift
//  First
//
//  Created by Daksh on 31/01/23.
//

import Foundation

class SharedPreference: NSObject{
    static var shared = SharedPreference()
    
    
    enum PopUpType{
        case alert
        case warning
    }
    var popUpType:PopUpType = .alert
}
