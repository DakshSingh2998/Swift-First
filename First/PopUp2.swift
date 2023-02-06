//
//  PopUp2.swift
//  First
//
//  Created by Daksh on 31/01/23.
//

import UIKit

class PopUp2: UIView {
    
    
    @IBOutlet var parentView: UIView!
    
    
    @IBOutlet weak var childView: UIView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func customUI(){
        Bundle.main.loadNibNamed("PopUp2", owner: self, options: nil)
        parentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        parentView.backgroundColor = .black.withAlphaComponent(0.8)
    }
    func appear(){
        
        
        let keyWindow = UIApplication.shared.windows.first
        keyWindow?.addSubview(parentView)
        print(parentView)
    }
    
    @IBAction func primaryButtonAction(_ sender: Any) {
        print(parentView)
        parentView.removeFromSuperview()
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
