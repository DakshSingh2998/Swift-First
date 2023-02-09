//
//  ViewControllerTest.swift
//  First
//
//  Created by Daksh on 06/02/23.
//


import UIKit

class ViewControllerTest: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("15")
        return 15
    }
    
    var tableData:[[UIImageView?]] = []
    var tableDataImage:[[UIImage?]] = []
    
    @IBOutlet weak var tbv: UITableView!
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tbv.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! StackCell
        var idx = 0
        for temp in cell.horizontalStack.subviews{
            temp.removeFromSuperview()
            idx = idx + 1
        }
        print(cell.horizontalStack.subviews.count, idx)
        //cell.scrollView.setContentOffset(CGPoint(x: 0.0, y: 0.0), animated: false)
        for i in 0...9{
            //print("\(indexPath.row)  \(i)")
            //print(tempView, indexPath.row, i)
            //if(tempView == nil){
                //print("HERE")
            var tempView:UIImageView? = UIImageView()
                tempView!.frame.size.width = 100
                tempView!.frame.size.height = 100
                
                //tempView.contentMode = .scaleAspectFit
                var tap = UITapGestureRecognizer(target: self, action: #selector(self.imageTapGesture))
                tempView!.isUserInteractionEnabled = true
                tempView!.addGestureRecognizer(tap)
                tempView!.backgroundColor = .purple
                tableData[indexPath.row][i] = tempView
                tempView?.image = tableDataImage[indexPath.row][i]
                //allOutlets.append(tempView)
                cell.horizontalStack.addArrangedSubview(tempView!)
            //}
            
            
        }
        //////
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    var allOutlets:[UIImageView] = []
    var curOutlet:UIImageView?
    
    @IBOutlet weak var scrollView: UIScrollView!
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 0...14{
            var tempArray:[UIImageView?] = []
            var tempImage:[UIImage?] = []
            for _ in 0...9{
                tempArray.append(nil)
                var image = UIImage(named: "DownImage")!
                image = image.resized(to: CGSize(width: 100.0, height: 100.0))
                tempImage.append(image)
            }
            tableDataImage.append(tempImage)
            tableData.append(tempArray)
        }
        
        gradient(colorTop: UIColor(named: "DColor")!, colorBottom: UIColor(named: "DYellow")!)
        
        imagePicker.delegate = self
        tbv.delegate = self
        tbv.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    
    @objc func imageTapGesture(sender: UITapGestureRecognizer){
        
        //print(tbv.visibleCells[0].subviews[1].subviews[0].subviews[0].subviews)
        for cell in tbv.visibleCells{
            for imageView in cell.subviews[1].subviews[0].subviews[0].subviews{
                //print(horizontalStackView)
                if(sender.view == imageView){
                    curOutlet = sender.view as? UIImageView
                    break
                }
            }
        }
        
        self.present(imagePicker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        //
        /*
        (horizontalStack.arrangedSubviews[curOutlet] as! UIImageView).frame.size.width = 100
        (horizontalStack.arrangedSubviews[curOutlet] as! UIImageView).frame.size.height = 100
        //(horizontalStack.arrangedSubviews[curOutlet] as! UIImageView).image = UIImage(named: "DownImage")
         */
        image = image.resized(to: CGSize(width: 100.0, height: 100.0))
        curOutlet?.image = image
        for i in 0..<tableData.count{
            for j in 0...9{
                if(curOutlet == tableData[i][j]){
                    print(i,j)
                    tableData[i][j] = curOutlet
                    tableDataImage[i][j] = image
                    break
                }
            }
        }
        self.dismiss(animated: true)
    }
    
    
    func gradient(colorTop: UIColor, colorBottom: UIColor){
        let gradientL = CAGradientLayer()
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
