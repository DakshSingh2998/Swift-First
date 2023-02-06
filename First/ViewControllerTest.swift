//
//  ViewControllerTest.swift
//  First
//
//  Created by Daksh on 06/02/23.
//


import UIKit

class ViewControllerTest: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    var tableData:[UIStackView] = []
    
    @IBOutlet weak var tbv: UITableView!
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tbv.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! StackCell
        
        for i in 0...9{
            var tempView = UIImageView()
            tempView.frame.size.width = 100
            tempView.frame.size.height = 100
            tempView.image = UIImage(named: "DownImage")
            //tempView.contentMode = .scaleAspectFit
            var tap = UITapGestureRecognizer(target: self, action: #selector(self.imageTapGesture))
            tempView.isUserInteractionEnabled = true
            tempView.addGestureRecognizer(tap)
            tempView.backgroundColor = .purple
            //allOutlets.append(tempView)
            cell.horizontalStack.addArrangedSubview(tempView)
            
        }
        //////
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    var allOutlets:[UIImageView] = []
    var curOutlet:UIImageView?
    
    @IBOutlet weak var scrollView: UIScrollView!
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradient(colorTop: UIColor(named: "DColor")!, colorBottom: UIColor(named: "DYellow")!)
        
    imagePicker.delegate = self
        tbv.delegate = self
        tbv.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        /*
        for j in 0...2{
            var horizontalStack = UIStackView()
            horizontalStack.axis = .horizontal
            horizontalStack.frame.size.height = 100
            horizontalStack.spacing = 10
            var left = NSLayoutConstraint(item: horizontalStack, attribute: NSLayoutConstraint.Attribute.leftMargin, relatedBy: NSLayoutConstraint.Relation.equal, toItem: scrollView, attribute: NSLayoutConstraint.Attribute.leftMargin, multiplier: 1, constant: 0)
            var top = NSLayoutConstraint(item: horizontalStack, attribute: NSLayoutConstraint.Attribute.topMargin, relatedBy: NSLayoutConstraint.Relation.equal, toItem: scrollView, attribute: NSLayoutConstraint.Attribute.topMargin, multiplier: 1, constant: 0)
            horizontalStack.addConstraints([left, top])
            
            //horizontalStack.distribution = .fillEqually
            scrollView.addSubview(horizontalStack)
            for i in 0...9{
                var tempView = UIImageView()
                tempView.frame.size.width = 100
                tempView.frame.size.height = 100
                tempView.image = UIImage(named: "DownImage")
                tempView.contentMode = .scaleAspectFit
                var tap = UITapGestureRecognizer(target: self, action: #selector(self.imageTapGesture))
                tempView.isUserInteractionEnabled = true
                tempView.addGestureRecognizer(tap)
                tempView.backgroundColor = .purple
                //allOutlets.append(tempView)
                horizontalStack.addArrangedSubview(tempView)
                
            }
        }
        
        */
        
        
        
    }
    
    
    @objc func imageTapGesture(sender: UITapGestureRecognizer){
        
        print(tbv.visibleCells[0].subviews[1].subviews[0].subviews[0].subviews)
        for cell in tbv.visibleCells{
            for horizontalStackView in cell.subviews[1].subviews[0].subviews[0].subviews{
                print(horizontalStackView)
                if(sender.view == horizontalStackView){
                    curOutlet = sender.view as? UIImageView
                    break
                }
            }
        }
        
        self.present(imagePicker, animated: true)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        print(curOutlet)
        //
        /*
        (horizontalStack.arrangedSubviews[curOutlet] as! UIImageView).frame.size.width = 100
        (horizontalStack.arrangedSubviews[curOutlet] as! UIImageView).frame.size.height = 100
        //(horizontalStack.arrangedSubviews[curOutlet] as! UIImageView).image = UIImage(named: "DownImage")
         */
        image = image.resized(to: CGSize(width: 75.0, height: 75.0))
        curOutlet?.image = image
         
        self.dismiss(animated: true)
    }
    
    
    func gradient(colorTop: UIColor, colorBottom: UIColor){
        var gradientL = CAGradientLayer()
        gradientL.colors = [colorTop.cgColor, colorBottom.cgColor]

        gradientL.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientL.endPoint = CGPoint(x: 1.1, y: 1.1)
        gradientL.locations = [0.1,1]
        gradientL.frame = view.bounds
        view.layer.insertSublayer(gradientL, at: 0)
        
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
extension UIImage{
    func resized(to size:CGSize) ->UIImage{
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
