//
//  TeamTableViewController.swift
//  NHL Stats
//
//  Created by Connor Dean on 2/17/19.
//  Copyright © 2019 Connor Dean. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class TeamTableViewController: UIViewController {
    let networkingHelper = NetworkingHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkingHelper.requestTeamsAPI()
        networkingHelper.receiveDataFromUsers()
    }
}
