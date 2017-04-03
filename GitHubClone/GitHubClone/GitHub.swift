//
//  GitHub.swift
//  GitHubClone
//
//  Created by Pavel Parkhomey on 4/3/17.
//  Copyright © 2017 Pavel Parkhomey. All rights reserved.
//

import UIKit

let kOAuthBaseURLString = "https://github.com/login/oauth/"

enum GitHubAuthError : Error {
    case extractingCode
}

class GitHub {
    
    let gitHubClientID = "a1f5c7379d6a20fbd36b"
    let gitHubClientSecret = "401a3e2b16416eb4081e4cf16d32e56f21425c92"
    
    static let shared = GitHub()
    
    func oAuthRequestWith(parameters: [String: String]){
        var parametersString = ""
        
        for (key, value) in parameters {
            parametersString += "&\(key)=\(value)"
        }
        
        if let requestURL = URL(string: "\(kOAuthBaseURLString)authorize?client_id=\(gitHubClientID)\(parametersString)"){
            print(requestURL.absoluteString)
            
            UIApplication.shared.open(requestURL)
        }
    }
    
    func getCodeFrom(url: URL) throws -> String {
        
        guard let code = url.absoluteString.components(separatedBy: "=").last else {throw GitHubAuthError.extractingCode
        }
        
        return code
        
    }
    
}











