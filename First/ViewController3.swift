//
//  ViewController3.swift
//  First
//
//  Created by Daksh on 22/01/23.
//

import UIKit
protocol protocol1{
    func sendBool(bdata:Bool)
}

class ViewController3: UIViewController {

    
    @IBOutlet weak var sliderBright: UISlider!
    var delegate:protocol1? = nil

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var switch1: UISwitch!
    var name = ""
    var marks = 0
    
    
    @IBOutlet weak var sliderLabelHor: NSLayoutConstraint!
    
    
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var slider1: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label1.text = name
        label2.text = "\(marks)"
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func sliderbutton(_ sender: Any) {
        print(slider1.value)
        slider1.value = 1.0
    }
    @IBAction func button1action(_ sender: Any) {
        
    }
    @IBOutlet weak var sliderHor: NSLayoutConstraint!
    @IBAction func sliderAction(_ sender: Any) {
        sliderLabel.text = String( Int(slider1.value * 100))
        slider1.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi / 2))
        sliderHor.constant = 30
    }
    override func viewDidDisappear(_ animated: Bool) {
        delegate?.sendBool(bdata: switch1.isOn)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    
    @IBAction func sliderBrightTouchDrag(_ sender: Any) {
        sliderLabelHor.constant = CGFloat(sliderBright.value*275)-138
        
    }
    @IBOutlet weak var sliderLabelNew: UILabel!
    
    @IBAction func switchChange(_ sender: Any) {
        slider1.setThumbImage(UIImage.init(ciImage: CIImage(image: UIImage(named: "DownImage")!)!, scale: 9, orientation: .up), for: .normal)
    }
    
    
    @IBAction func sliderBrightChanged(_ sender: Any) {
        sliderLabelNew.text = String(Int(sliderBright.value*100))
    }
    
    @IBAction func sliderEventTouchUp(_ sender: Any) {
        var curVal = sliderBright.value
        var finalVal = 0
        var i = 1
        while(i <= 11){
            if((curVal*10) <= Float(i)){
                finalVal = i-1
                break
            }
            i = i+2
        }
        sliderBright.setValue(Float(finalVal)/10, animated: true)
        print(curVal, finalVal)
    }
    
    
    @IBAction func showPopUp(_ sender: Any) {
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
