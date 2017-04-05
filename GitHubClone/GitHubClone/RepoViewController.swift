//
//  RepoViewController.swift
//  GitHubClone
//
//  Created by Pavel Parkhomey on 4/4/17.
//  Copyright © 2017 Pavel Parkhomey. All rights reserved.
//

import UIKit

class RepoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var repoTableView: UITableView!
    
    var repos = [Repository]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.repoTableView.dataSource = self
        self.repoTableView.delegate = self
        // Do any additional setup after loading the view.
        update()
    }
    
    func update() {
        print("Update Repo Controller Here")
        
        GitHub.shared.getRepos { (repositories) in
            //Update Table View for Lab
            if let repositories = repositories {
                self.repos = repositories
                self.repoTableView.reloadData()
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repoCell", for: indexPath) as! RepoTableViewCell
        
        cell.repoNameLabel.text = repos[indexPath.row].name
        cell.repoNameLabel.textColor = UIColor.black
        return cell
    }
}
