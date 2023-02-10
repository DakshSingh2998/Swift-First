//
//  Movies+CoreDataProperties.swift
//  First
//
//  Created by Daksh on 10/02/23.
//
//

import Foundation
import CoreData


extension Movies {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movies> {
        return NSFetchRequest<Movies>(entityName: "Movies")
    }

    @NSManaged public var language: String?
    @NSManaged public var title: String?
    @NSManaged public var relationship: NSSet?

}

// MARK: Generated accessors for relationship
extension Movies {

    @objc(addRelationshipObject:)
    @NSManaged public func addToRelationship(_ value: Reviews)

    @objc(removeRelationshipObject:)
    @NSManaged public func removeFromRelationship(_ value: Reviews)

    @objc(addRelationship:)
    @NSManaged public func addToRelationship(_ values: NSSet)

    @objc(removeRelationship:)
    @NSManaged public func removeFromRelationship(_ values: NSSet)

}

extension Movies : Identifiable {

}
