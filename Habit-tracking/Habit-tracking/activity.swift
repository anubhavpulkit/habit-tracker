//
//  activity.swift
//  Habit-tracking
//
//  Created by Pully on 06/03/21.
//

import Foundation

struct activityItem: Identifiable, Codable {
    var id = UUID()
    var title: String
    var desc: String
    var logo: String
}
