//
//  Repository.swift
//  GitHubClone
//
//  Created by Pavel Parkhomey on 4/4/17.
//  Copyright © 2017 Pavel Parkhomey. All rights reserved.
//

import Foundation

class Repository {
    
    let name: String
    let description: String?
    let language: String?
    
    init?(json: [String: Any]){
        
        print(json)
        if let name = json["name"] as? String {
            self.name = name
            if let description = json["description"] as? String, let language = json["language"] as? String {
                self.description = description
                self.language = language
            } else {
                self.description = "No Description"
                self.language = "No Language"
            }
        } else {
            return nil
        }
    }
}
