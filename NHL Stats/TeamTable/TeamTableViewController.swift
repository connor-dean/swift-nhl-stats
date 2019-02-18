//
//  TeamTableViewController.swift
//  NHL Stats
//
//  Created by Connor Dean on 2/17/19.
//  Copyright © 2019 Connor Dean. All rights reserved.
//

import Foundation
import UIKit

class TeamTableViewController: UIViewController {
    let networkingHelper = NetworkingHelper()
    
    // Temp
    var videos: [Teams] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        networkingHelper.getTeamsArray() { response, error in
            var tempTeams: [Teams] = []
            for element in response! {
                tempTeams.append(Teams(teamName: element))
                print(element)
            }
        }
    }
}
