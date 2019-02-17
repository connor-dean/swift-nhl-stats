//
//  ViewController.swift
//  NHL Stats
//
//  Created by Connor Dean on 2/17/19.
//  Copyright © 2019 Connor Dean. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let networkHelper = NetworkingHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkHelper.requestTeamsAPI()
    }
}

