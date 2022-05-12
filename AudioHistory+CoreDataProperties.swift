//
//  AudioHistory+CoreDataProperties.swift
//  Ebotti_Violence
//
//  Created by kwok chung  kwan on 2/4/2022.
//
//

import Foundation
import CoreData


extension AudioHistory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AudioHistory> {
        return NSFetchRequest<AudioHistory>(entityName: "AudioHistory")
    }

    @NSManaged public var file_name: String?
    @NSManaged public var history_date_time: String?
    @NSManaged public var message: String?
    @NSManaged public var mobile: [String]?
    @NSManaged public var person_name: [String]?

}

extension AudioHistory : Identifiable {

}
