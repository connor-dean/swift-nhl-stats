//
//  NetworkingHelper.swift
//  NHL Stats
//
//  Created by Connor Dean on 2/17/19.
//  Copyright © 2019 Connor Dean. All rights reserved.
//

import Alamofire
import SwiftyJSON

class NetworkingHelper {
    
    func requestTeamsAPI() {
        var apiDict: [String: String] = [:]
        let apiRequestURL = "https://statsapi.web.nhl.com/api/v1/teams"
        
        AF.request(apiRequestURL).responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                for (key, subJson) in swiftyJsonVar["teams"] {
                    if let teamName = subJson["name"].string {
                        apiDict[key] = teamName
                    }
                }
                
                // Store dictionary into array
                let sortedApiDict = Array(apiDict.values).sorted(by: <)
                
                // TODO: Remove after debugging
                print(sortedApiDict)
            } else {
                print("There was an error!")
            }
        }
    }
}
