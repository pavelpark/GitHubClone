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
    var description: String?
    var language: String?
    let numberOfStars: Int
    let isForked: Bool
    let whenCreatedDate: String
    
    let repoUrlString : String
    
    init?(json: [String: Any]){
        
        print(json)
        if let name = json["name"] as? String {
            self.name = name
//                        
        } else {
            return nil
        }
        if let description = json["description"] as? String {
            self.description = description
        } else {
            return nil
        }
        if let language = json["language"] as? String {
            self.language = language
        } else {
            return nil
        }
        if let numberOfStars = json["stargazers_count"] as? Int {
            self.numberOfStars = numberOfStars
        } else {
            return nil
        }
        if let isForked = json["fork"] as? Bool {
            self.isForked = isForked
        } else {
            return nil
        }
        if let whenCreatedDate = json["created_at"] as? String {
            self.whenCreatedDate = whenCreatedDate
        } else {
            return nil
        }
        self.repoUrlString = json["html_url"] as? String ?? "https://www.github.com"
    }
}
