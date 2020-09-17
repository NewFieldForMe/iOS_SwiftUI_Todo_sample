//
//  PointData+CoreDataProperties.swift
//  NGenTodo
//
//  Created by yamada.ryo on 2020/09/14.
//  Copyright © 2020 yamada.ryo. All rights reserved.
//
//

import Foundation
import CoreData


extension PointData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PointData> {
        return NSFetchRequest<PointData>(entityName: "PointData")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var date: Date?
    @NSManaged public var point: Int

}

extension PointData: Identifiable { }

extension PointData {
    var dateString: String {
        get {
            guard let date = date else { return "" }
            return DateFormatters.ymdFormatter.string(from: date)
        }
    }
}
