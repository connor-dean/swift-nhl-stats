//
//  TeamStore.swift
//  NHL Stats
//
//  Created by Connor Dean on 2/17/19.
//  Copyright © 2019 Connor Dean. All rights reserved.
//

import Foundation

class TeamStore: NSObject {
    var teamName: String?
    
    init(teamName: String) {
        self.teamName = teamName
    }
}
