//
//  RepoViewController.swift
//  GitHubClone
//
//  Created by Pavel Parkhomey on 4/4/17.
//  Copyright © 2017 Pavel Parkhomey. All rights reserved.
//

import UIKit

class RepoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        update()
    }
    func update() {
        print("Update Repo Controller Here")
        
        GitHub.shared.getRepos { (repositories) in
            //Update Table View for Lab
            print(repositories?.first)
        }
    }
}
