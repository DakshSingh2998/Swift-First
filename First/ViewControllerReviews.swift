//
//  ViewControllerReviews.swift
//  First
//
//  Created by Daksh on 10/02/23.
//

import UIKit
import CoreData

class ViewControllerReviews: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviewsList.count
    }
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = "\(reviewsList[indexPath.row])"
    return cell
            
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    var movies: Movies?
    var reviews: NSSet?
    var reviewsList:[Int16] = []
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var reviewTf: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        loadReview()
    }
    func loadReview(){
        reviews = movies?.relationship
        reviewsList = []
        for ele in reviews!{
            reviewsList.append((ele as AnyObject).review!)
        }
        tableView.reloadData()
    }
    
    @IBAction func saveReview(_ sender: Any) {
        var toAdd = Reviews(context: context)
        toAdd.review = Int16(Int(reviewTf.text!)!)
        movies?.addToRelationship(toAdd)
        do{
            try context.save()
        }catch{
            print("error in saving")
        }
        loadReview()
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
