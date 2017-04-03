//
//  GitHubAuthControllerViewController.swift
//  GitHubClone
//
//  Created by Pavel Parkhomey on 4/3/17.
//  Copyright © 2017 Pavel Parkhomey. All rights reserved.
//

import UIKit

class GitHubAuthControllerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func printTokenPressed(_ sender: Any) {
    }

    @IBAction func logInButtonPressed(_ sender: Any) {
        
        let parameters = ["scope" : "email,user"]
        
        GitHub.shared.oAuthRequestWith(parameters: parameters)
        
    }
}
