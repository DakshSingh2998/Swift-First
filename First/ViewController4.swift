//
//  ViewController4.swift
//  First
//
//  Created by Daksh on 02/02/23.
//

import UIKit
import WebKit


class ViewController4: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate,UIWebViewDelegate, UIGestureRecognizerDelegate, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet weak var imagePicker1: UIImageView!
    var imagePickerController = UIImagePickerController()
    @IBOutlet weak var webView1: WKWebView!
    
    var pickerDate:[Int] = []
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDate.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        print("here")
        return "\(pickerDate[row])"
    }
    

    @IBOutlet weak var datePicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.dataSource = self
        datePicker.delegate = self
        
        imagePickerController.modalPresentationStyle = UIModalPresentationStyle.currentContext
        imagePickerController.delegate = self
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        for i in 1...28{
            pickerDate.append(i)
        }
        imagePicker1.layer.cornerRadius = imagePicker1.bounds.width/2
        /*
        datePicker.reloadAllComponents()
        let myURL = URL(string:"https://www.apple.com")
           let myRequest = URLRequest(url: myURL!)
           webView1.load(myRequest)
        */
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        tap.delegate = self
            imagePicker1.isUserInteractionEnabled = true
        imagePicker1.addGestureRecognizer(tap)
    }

    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        
        self.present(imagePickerController, animated: true)
        
        //imagePickerController(picker: imagePickerController, didFinishPickingMediaWithInfo: [String: Any])
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var tempImage:UIImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        imagePicker1.image = tempImage

        self.dismiss(animated: true)
    }
    
    /*
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info:NSDictionary!) {
        
        var tempImage:UIImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        imagePicker1.image = tempImage

        self.dismiss(animated: true)

    }
     */
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
