//
//  DatabaseHelper.swift
//  First
//
//  Created by Daksh on 09/02/23.
//

import CoreData
import UIKit
import Foundation
class DatabaseHelper: NSManagedObject{
    static var shared = DatabaseHelper()
    let context = (UIApplication.shared.delegate as?
                   AppDelegate)?.persistentContainer.viewContext
    
    func saveData(object:[String:String]){
        let movie = NSEntityDescription.insertNewObject(forEntityName: "Movies", into: context!) as! Movies
        movie.title = object["title"]
        movie.language = object["language"]
        do{
            try? context?.save()
        }
        catch{
            print("Error in saving")
        }
    }
    func loadData() -> [Movies]{
        var movies = [Movies]()
        let fetchreq = NSFetchRequest<NSManagedObject>(entityName: "Movies")
        do{
            movies = try context?.fetch(NSFetchRequest(entityName: "Movies")) as! [Movies]
        }
        catch{
            print("Error in loading")
        }
        return movies
    }
}

