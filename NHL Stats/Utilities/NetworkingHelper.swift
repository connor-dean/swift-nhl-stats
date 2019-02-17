//
//  NetworkingHelper.swift
//  NHL Stats
//
//  Created by Connor Dean on 2/17/19.
//  Copyright © 2019 Connor Dean. All rights reserved.
//

import Alamofire

class NetworkingHelper {
    func requestTeamsAPI() {
        AF.request("https://statsapi.web.nhl.com/api/v1/teams").responseJSON { response in
            print(response);
        }
    }
}
