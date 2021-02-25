//
//  FavoriteCD+CoreDataProperties.swift
//  PokeApi
//
//  Created by LKY on 24/02/21.
//
//

import Foundation
import CoreData


extension FavoriteCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteCD> {
        return NSFetchRequest<FavoriteCD>(entityName: "FavoriteCD")
    }

    @NSManaged public var nameFav: String?

}
