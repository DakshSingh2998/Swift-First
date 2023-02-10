//
//  Reviews+CoreDataProperties.swift
//  First
//
//  Created by Daksh on 10/02/23.
//
//

import Foundation
import CoreData


extension Reviews {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Reviews> {
        return NSFetchRequest<Reviews>(entityName: "Reviews")
    }

    @NSManaged public var review: Int16

}

extension Reviews : Identifiable {

}
