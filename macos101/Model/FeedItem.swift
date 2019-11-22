//
//  FeedItem.swift
//  macos101
//
//  Created by Nguyen Huu Loc on 11/22/19.
//  Copyright © 2019 Assistant. All rights reserved.
//

import Cocoa

class FeedItem: NSObject {
    let id: String
    let journey_name: String
    let departure_location_name: String
    let departure_location_lat: String
    let departure_location_long: String
    let departure_location_note: String
    let destination_location_name: String
    let destination_location_lat: String
    let destination_location_long: String
    let destination_location_note: String
    let total_distance: String
    let total_duration: String
    let status: String
    let created_by: String
    let created_date: String
    let last_modified_by: String
    let last_modified_date: String
    
    init(dictionary: NSDictionary) {
        self.id = dictionary.object(forKey: "id") as! String
        self.journey_name = dictionary.object(forKey: "journey_name") as! String
        self.departure_location_name = dictionary.object(forKey: "departure_location_name") as! String
        self.departure_location_lat = dictionary.object(forKey: "departure_location_lat") as! String
        self.departure_location_long = dictionary.object(forKey: "departure_location_long") as! String
        self.departure_location_note = dictionary.object(forKey: "departure_location_note") as! String
        self.destination_location_name = dictionary.object(forKey: "destination_location_name") as! String
        self.destination_location_lat = dictionary.object(forKey: "destination_location_lat") as! String
        self.destination_location_long = dictionary.object(forKey: "destination_location_long") as! String
        self.destination_location_note = dictionary.object(forKey: "destination_location_note") as! String
        self.total_distance = dictionary.object(forKey: "total_distance") as! String
        self.total_duration = dictionary.object(forKey: "total_duration") as! String
        self.status = dictionary.object(forKey: "status") as! String
        self.created_by = dictionary.object(forKey: "created_by") as! String
        self.created_date = dictionary.object(forKey: "created_date") as! String
        self.last_modified_by = dictionary.object(forKey: "last_modified_by") as! String
        self.last_modified_date = dictionary.object(forKey: "last_modified_date") as! String
        
    }
}
