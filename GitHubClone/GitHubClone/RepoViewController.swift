//
//  RepoViewController.swift
//  GitHubClone
//
//  Created by Pavel Parkhomey on 4/4/17.
//  Copyright © 2017 Pavel Parkhomey. All rights reserved.
//

import UIKit

class RepoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
//    
//    var allRepos = [Repository](){
//        didSet{
//            self.tableView.reloadData()
//        }
//    }
//    var displayRepos : [Repository]? {
//        didSet {
//            self.tableView.reloadData()
//        }
//    }
    
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

//extension RepoViewController: UITableViewDataSource {
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return.displayRepos?.count ?? allRepos.count
//    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        
//        cell.textLabel?.text = displayRepos?[indexPath.row].name ?? allRepos[indexPath.row].name
//        
//        return cell
//    }
//}

//extension RepoViewController: UISearchBarDelegate {
//    
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        if let searchedText = searchBar.text {
//            self.displayRepos = self.allRepos.filter{{$0.name.contains(searchedText)})
//        }
//            if searchBar.text == "" {
//                self.displayRepos = nil
//            }
//    }
//        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//            self.displayRepos = nil
//            self.searchBar.resignFirstResponder()
//        }
//        func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
//            self.searchBar.resignFirsstResponder()
//        }
//    }
