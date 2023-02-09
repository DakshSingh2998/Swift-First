//
//  ViewController.swift
//  First
//
//  Created by Daksh on 19/01/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainView: UIView!
    @IBOutlet weak var parentView1: UIView!
    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var rightView: UIView!
    
    @IBOutlet weak var userButton1: UIButton!
    let popUp = PopUp()
    
    @IBOutlet weak var userLabel1: UILabel!
    @IBOutlet weak var labeltemp: UILabel!
    @IBOutlet weak var userNavigationBar: UINavigationItem!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.title = "Home"
        userButton1.setTitle("Next", for: .normal)
        userButton1.setTitle("Next :)", for: .highlighted)
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        temp()
    }
    
    @IBAction func alertButtonAction(_ sender: Any) {
        
        popUp.appear(numberOfButtons: .secondary)
        SharedPreference.shared.popUpType = .alert
        //popUp.inputViewController?.loadView()
        //popUp.appear(numberOfButtons: .secondary)
        //popUp.appear(sender: self)
    }
    
    @IBAction func warningButtonAction(_ sender: Any) {
        SharedPreference.shared.popUpType = .warning
        //popUp.inputViewController?.loadView()
        
        
        popUp.appear(numberOfButtons: .primary)
    }
    
    func temp(){
        PopUp.popUpAction = { [weak self] act in
            if act == .primary && SharedPreference.shared.popUpType == .warning{
                print("primary warning")
            }
            if( act == .secondary && SharedPreference.shared.popUpType == .alert){
                print("secondary alert")
            }
            if( act == .primary && SharedPreference.shared.popUpType == .alert){
                print("")
            }
        }
    }
    
    @IBAction func userButton1Action(_ sender: Any) {
        var s = userLabel1.text
        print("\(s!)")
        /*
        var svc = 	(self.storyboard?.instantiateViewController(withIdentifier: "ViewController2") as? ViewController2)!
         */
        let svc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ViewController2") as? ViewController2
        navigationController?.pushViewController(svc!, animated:true)
    }
    
    
    
    @IBAction func UIkit(_ sender: Any) {
        let svc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ViewController4") as? ViewController4
        navigationController?.pushViewController(svc!, animated: true)
    }
    
    @IBAction func testButtonAction(_ sender: Any) {
        let svc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ViewControllerCoreData") as? ViewControllerCoreData
        navigationController?.pushViewController(svc!, animated: true)
    }
    
}
