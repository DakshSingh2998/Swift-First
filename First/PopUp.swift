//
//  PopUp.swift
//  First
//
//  Created by Daksh on 30/01/23.
//

import UIKit

enum PopupButtonTap {
    case primary
    case secondary
}


class PopUp: UIView {
    
    @IBOutlet var superParentView: UIView!
    
    
    @IBOutlet weak var secondButton: UIButton!
    static var popUpAction: ((PopupButtonTap) -> Void)?
    var noOfButtons:PopupButtonTap = .primary
    
    @IBOutlet var parentView: PopUp!
    //@IBOutlet var label1: UILabel!
    var tt = 0
    override init(frame: CGRect) {
        super.init(frame: frame)
        customUI()
    }
    func customUI(){
        let firstView = Bundle.main.loadNibNamed("PopUp", owner: self, options: nil)
        //sender.view.addSubview(firstView!)
        
        
        //parentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]

        superParentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        superParentView.backgroundColor = .black.withAlphaComponent(0.8)
        
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    func appear(numberOfButtons: PopupButtonTap){
        UIApplication.shared.windows.first?.addSubview(superParentView)
        noOfButtons = numberOfButtons
        if noOfButtons == .primary{
            secondButton.isHidden = true
        }
        else{
            secondButton.isHidden = false
        }
    }
    
    
    
    @IBAction func cancelButton(_ sender: Any) {
        superParentView.removeFromSuperview()
    }
    
    
    @IBAction func firstButtonAction(_ sender: Any) {
        PopUp.popUpAction?(.primary)
        
        superParentView.removeFromSuperview()
        
        //self.removeFromSuperview()
    }
    
    @IBAction func seconButtonAction(_ sender: Any) {
        PopUp.popUpAction?(.secondary)
        superParentView.removeFromSuperview()
        
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.

}
