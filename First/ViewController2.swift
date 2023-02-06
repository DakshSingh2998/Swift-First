//
//  ViewController2.swift
//  First
//
//  Created by Daksh on 19/01/23.
//
struct Data{
    var a1:String
    var a2:Int
    
}

import UIKit

class ViewController2: UIViewController, UITableViewDataSource, UITableViewDelegate, protocol1 {
    var sett: Set<Int> = []
    
    var switchbool:Bool = false
    var last:Int = 0
    func sendBool(bdata: Bool) {
        switchbool = bdata
        if(switchbool){
            sett.insert(last)
        }
        else{
            //if(sett.contains(last)){
                sett.remove(last)
            
        }
        tbv.reloadData()
        
        }
    
    
    
    @IBOutlet weak var tbv: UITableView!
    var data:[Data] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell
        cell?.label1.text = data[indexPath.row].a1
        cell?.label2.text = "\(data[indexPath.row].a2)"
        
        if(sett.contains(indexPath.row)){
            cell?.tbView.backgroundColor = .red
        }
        else{
            cell?.tbView.backgroundColor = .white
        }
        print(last)
        return cell!
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var svc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ViewController3") as? ViewController3
        svc?.name = data[indexPath.row].a1
        svc?.marks = data[indexPath.row].a2
        svc?.delegate = self
        last = indexPath.row
        
        navigationController?.pushViewController(svc!, animated: true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("2nd")
        tbv.delegate = self
        tbv.dataSource = self
        for i in 0...30{
            data.append(Data(a1: "D\(i)", a2: i))
        }
        // Do any additional setup after loading the view.
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
