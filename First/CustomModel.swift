//
//  CustomModel.swift
//  First
//
//  Created by Daksh on 09/02/23.
//

import Foundation

class CustomerModel{
    var id:String?
    var original_language:String?
    var original_title:String?
    var overview:String?
    var popularity:String?
    var poster_path:String?
    var release_date:String?
    var title:String?
    var video:String?
    var vote_average:String?
    var vote_count:String?
    var genre_ids:[Int] = []
    init(){
        
    }
    init(data: [String:Any]) {
        if let genre_ids = data["genre_ids"]{ self.genre_ids = genre_ids as! [Int]
        }
        if let id = data["id"]{ self.id = id as? String
        }
        if let original_language = data["original_language"]{ self.original_language = original_language as? String
        }
        if let original_title = data["original_title"]{ self.original_title = original_title as? String
        }
        if let overview = data["overview"]{ self.overview = overview as? String
        }
        if let popularity = data["popularity"]{ self.popularity = popularity as? String
        }
        if let poster_path = data["poster_path"]{ self.poster_path = poster_path as? String
        }
        if let release_date = data["release_date"]{ self.release_date = release_date as? String
        }
        if let title = data["title"]{ self.title = title as? String
        }
        if let video = data["video"]{ self.video = video as? String
        }
        if let vote_average = data["vote_average"]{ self.vote_average = vote_average as? String
        }
        if let vote_count = data["vote_count"]{ self.vote_count = vote_count as? String
        }
    }
}
