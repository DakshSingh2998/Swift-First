//
//  NetworkManager.swift
//  First
//
//  Created by Daksh on 09/02/35.
//

import Foundation

class NetworkManager{
    static var shared = NetworkManager()
    func getData(url:String, completition: ((Any) -> ())?){
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let session = URLSession.shared
        session.dataTask(with: request, completionHandler: { data, response, err in
            guard let data = data else {
                print(err?.localizedDescription)
                return
            }
            guard let jsonData = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) else {
                print("Error in parsing")
                return
            }
            print(jsonData)
            completition!(jsonData)
        }).resume()
        
    }
}
