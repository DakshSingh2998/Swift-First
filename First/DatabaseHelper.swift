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
        var movies:[Movies] = []
        //let fetchreq = NSFetchRequest<NSManagedObject>(entityName: "Movies")
        do{
            movies = try context?.fetch(NSFetchRequest(entityName: "Movies")) as! [Movies]
        }
        catch{
            print("Error in loading")
        }
        return movies
    }
    func deleteData(object:Movies) -> [Movies]{
        var movies = loadData()
        var toDelete:Movies? = nil
        var i = 0
        for ele in movies{
            if(ele == object){
                toDelete = ele
                break
            }
            i = i+1
        }
        if(toDelete == nil){
            return movies
        }
        
        do{
            try? context?.delete(toDelete!)
            try? (UIApplication.shared.delegate as?
                  AppDelegate)?.saveContext()
            
        }
        catch{
            print("Error in deleting")
        }
        movies.remove(at: i)
        return movies
    }
    func updateData(object:Movies, title:String? = "", language:String? = ""){
        var movies = loadData()
        var i = 0
        for ele in movies{
            if(ele == object){
                break
            }
            i = i+1
        }
        if(title != ""){
            object.title = title
        }
        if(language != ""){
            object.language = language
        }
        movies[i] = object
        
        do{
            try? context?.save()
        }
    }
    
}

