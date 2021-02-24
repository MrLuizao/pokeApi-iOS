//
//  Pokemon+CoreDataProperties.swift
//  PokeApi
//
//  Created by LKY on 24/02/21.
//
//

import Foundation
import CoreData


extension Pokemon {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pokemon> {
        return NSFetchRequest<Pokemon>(entityName: "Pokemon")
    }

    @NSManaged public var name: String?

}
