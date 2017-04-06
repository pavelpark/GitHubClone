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
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    var repos = [Repository]()
    
    var filterRepo : [Repository]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.repoTableView.dataSource = self
        self.repoTableView.delegate = self
        let nib = UINib(nibName: RepoTableViewCell.identifier, bundle: Bundle.main)
        repoTableView.register(nib, forCellReuseIdentifier: RepoTableViewCell.identifier)
        // Do any additional setup after loading the view.
        update()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == RepoDetailViewController.identifier {
            if let selectedIndex = self.repoTableView.indexPathForSelectedRow?.row {
                let selectedRepo = self.repos[selectedIndex]
                
                guard let destinationController = segue.destination as? RepoDetailViewController else { return }
                destinationController.personalRepo = selectedRepo
            }
            segue.destination.transitioningDelegate = self
        }
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: RepoTableViewCell.identifier, for: indexPath) as! RepoTableViewCell
        
        cell.repository = repos[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: RepoDetailViewController.identifier, sender: nil)
    }
    
}


extension RepoViewController: UIViewControllerTransitioningDelegate{
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return CustomTransition(duration: 1.0)
        
    }
//    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        return CustomTransition(duration: 1.0)
//    }
    
}

//extension RepoViewController: UITableViewDataSource, UITableViewDelegate {
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

extension RepoViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if !searchText.validate(){
            let lastIndex = searchText.index(before: searchText.endIndex)
            searchBar.text = searchText.substring(to: lastIndex)
        }
        
        if let searchedText = searchBar.text {
            self.filterRepo = self.repos.filter{$0.name.contains(searchedText)}
        }
        if searchBar.text == "" {
            self.filterRepo = nil
        }
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.filterRepo = nil
        self.searchBar.resignFirstResponder()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        self.searchBar.resignFirstResponder()
    }
}
