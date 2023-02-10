//
//  ViewControllerCoreData.swift
//  First
//
//  Created by Daksh on 09/02/35.
//

import UIKit

class ViewControllerCoreData: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var titleTf: UITextField!
    
    @IBOutlet weak var languageTf: UITextField!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    var movies:[Movies] = []
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCellCoreData
        cell.titleLabel.text = movies[indexPath.row].title
        cell.languageLabel.text = movies[indexPath.row].language
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            movies = DatabaseHelper.shared.deleteData(object: movies[indexPath.row])
            tableView.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(titleTf.text == ""){
            let svc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ViewControllerReviews") as! ViewControllerReviews
            svc.movies = movies[indexPath.row]
            navigationController?.pushViewController(svc, animated: true)
            return
        }
        DatabaseHelper.shared.updateData(object: movies[indexPath.row], title: titleTf.text)
        tableView.reloadData()
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    var dataDict:[[String: String]] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        
    }
    func loadApiData(){
        dataDict = []
        var url = "https://api.themoviedb.org/3/movie/popular?api_key=314778b919b218a848acfcee10a6c785"
        var valuess:[[String:Any]] = []
        NetworkManager.shared.getData(url: url){ data in
            guard let data = data as? [String:Any]
            else{
                return
            }
            guard let values = data["results"] as?
            [[String: Any]]
            else{
                return
            }
            valuess = values
            for ele in values{
                var tempdict:[String:String] = [:]
                tempdict["title"] = "\( ele["title"]!)"
                tempdict["language"] = "\(ele["original_language"]!)"
                
                self.dataDict.append(tempdict)
            }
            print(self.dataDict)
            for ele in self.dataDict{
                DatabaseHelper.shared.saveData(object: ele)
            }
            
            //print(movies)
            
            DispatchQueue.main.async {
                self.movies = DatabaseHelper.shared.loadData()
                self.tableView.reloadData()
            }
            //print(self.dataDict)
        }
        
    }
    

    @IBAction func saveButton(_ sender: Any) {
        loadApiData()
        
        
    }
    @IBAction func loadButton(_ sender: Any) {
        movies = DatabaseHelper.shared.loadData()
        //print(movies)
        
        tableView.reloadData()
        
    }
    
    
    @IBAction func saveRecord(_ sender: Any) {
        DatabaseHelper.shared.saveData(object: ["title":titleTf.text!, "language":languageTf.text!])
        //movies.append(<#T##newElement: Movies##Movies#>)
        movies = DatabaseHelper.shared.loadData()
        tableView.reloadData()
    }
    
    
    
    @IBAction func deleteButton(_ sender: Any) {
        var toDelete:Movies?
        for ele in movies{
            if(ele.title == titleTf.text){
                toDelete = ele
            }
        }
        if toDelete != nil{
            movies = DatabaseHelper.shared.deleteData(object: toDelete!)
            tableView.reloadData()
        }
        
    }
    
    
    @IBAction func deleteAllButton(_ sender: Any) {
        for ele in movies{
            movies = DatabaseHelper.shared.deleteData(object: ele)
        }
        tableView.reloadData()
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
