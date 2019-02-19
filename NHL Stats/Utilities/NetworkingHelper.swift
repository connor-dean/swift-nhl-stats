//
//  NetworkingHelper.swift
//  NHL Stats
//
//  Created by Connor Dean on 2/17/19.
//  Copyright © 2019 Connor Dean. All rights reserved.
//

import Alamofire
import SwiftyJSON
import CoreData

class NetworkingHelper {
    
    func requestTeamsAPI() {
        var apiDict: [String: String] = [:]
        let apiRequestURL = "https://statsapi.web.nhl.com/api/v1/teams"
        
        AF.request(apiRequestURL).responseJSON { responseData in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                for (key, subJson) in swiftyJsonVar["teams"] {
                    if let teamName = subJson["name"].string {
                        apiDict[key] = teamName
                    }
                }
                
                // Store dictionary into array
                let sortedApiDict = Array(apiDict.values).sorted(by: <)
                
                // Load teams to Core Data
                self.sendDataToUsers(coreDataString: sortedApiDict)
            } else {
                // TODO handle this error better
                print("There was an error!")
            }
        }
    }
    
    func sendDataToUsers(coreDataString newTeamName: [String]) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let teamEntity = NSEntityDescription.entity(forEntityName: "Teams", in: context)
        let addTeam = NSManagedObject(entity: teamEntity!, insertInto: context)
        
        for arrayElement in newTeamName {
            print(arrayElement)
            addTeam.setValue(arrayElement, forKey: "teamName")
        }
        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func receiveDataFromUsers() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Teams")
        request.returnsObjectsAsFaults = false
        
        do {
            let result = try context.fetch(request)
            for data in result as! [Teams] {
                print(data.value(forKey: "teamName") as! String)
            }
        } catch {
            // TODO handle this error better
            print("Failed")
        }
    }
    
}
