//
//  ViewControllerCoreData.swift
//  First
//
//  Created by Daksh on 09/02/35.
//

import UIKit

class ViewControllerCoreData: UIViewController, UITableViewDelegate, UITableViewDataSource {
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
            //print(self.dataDict)
        }
        
    }
    

    @IBAction func saveButton(_ sender: Any) {
        loadApiData()
        
        
        
        
        
    }
    @IBAction func loadButton(_ sender: Any) {
        movies = DatabaseHelper.shared.loadData()
        print(movies)
        
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
