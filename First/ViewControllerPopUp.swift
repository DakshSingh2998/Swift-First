//
//  ViewControllerPopUp.swift
//  First
//
//  Created by Daksh on 28/01/23.
//

import UIKit

class ViewControllerPopUp: UIViewController {
    
    @IBOutlet var backView: UIView!
    
    @IBOutlet weak var popUpView: UIView!
    
    init() {
        super.init(nibName: "ViewControllerPopUp", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        load()
        // Do any additional setup after loading the view.
    }
    func load(){
        //self.modalPresentationStyle = .overFullScreen
        //self.view.backgroundColor = .clear
        self.backView.backgroundColor = .black		.withAlphaComponent(0.4)
        self.backView.alpha = 0
        self.popUpView.alpha = 0
    }
    
    func appear(sender: UIViewController){
        sender.present(self, animated: false)
        UIView.animate(withDuration: 1, delay: 0) {
            self.backView.alpha = 1
            self.popUpView.alpha = 1
        }
    }
    

    @IBAction func hide(_ sender: Any) {
        UIView.animate(withDuration: 1) {
            self.backView.alpha = 0
            self.popUpView.alpha = 0
        } completion: { _ in
            self.dismiss(animated: false)
            self.removeFromParent()
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
