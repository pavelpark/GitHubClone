//
//  RepoDetailViewController.swift
//  GitHubClone
//
//  Created by Pavel Parkhomey on 4/5/17.
//  Copyright © 2017 Pavel Parkhomey. All rights reserved.
//

import UIKit
import SafariServices

class RepoDetailViewController: UIViewController {

    @IBOutlet weak var repoName: UILabel!
    
    @IBOutlet weak var repoDescription: UILabel!
    
    @IBOutlet weak var programmingLanguage: UILabel!
    
    @IBOutlet weak var numberOfStars: UILabel!
    
    @IBOutlet weak var isForked: UILabel!
    
    @IBOutlet weak var whenCreatedDate: UILabel!
    
    
    var personalRepo : Repository!
    
    //        didSet{
    //            self.repoName.text = personalRepo.name
    //            self.repoDescription.text = personalRepo.description
    //            self.programmingLanguage.text = personalRepo.language
    //            self.numberOfStars.text = personalRepo
    //            self.isForked.text = personalRepo
    //            self.whenCreatedDate.text = personalRepo
    //        }
    //
    //    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.repoName.text = personalRepo.name
        self.repoDescription.text = personalRepo.description
        self.programmingLanguage.text = personalRepo.language
        self.numberOfStars.text = String(describing: personalRepo.numberOfStars)
        self.isForked.text = personalRepo.isForked ? "Forked" : "Not Forked"
        self.whenCreatedDate.text = personalRepo.whenCreatedDate
        
        
        
    }
    
    @IBAction func moreDetailsPressed(_ sender: Any) {
        guard let personalRepo = personalRepo else { return }
        
        presentWebViewControllerWith(urlString: personalRepo.repoUrlString)
        
//        presentSafariViewControllerWith(urlString: personalRepo.repoUrlString)
    }
    func presentSafariViewControllerWith(urlString: String){
        
        guard let url = URL(string: urlString) else { return }
        
        let safariController = SFSafariViewController(url: url)
        self.present(safariController, animated: true, completion: nil)
    }
    
    func presentWebViewControllerWith(urlString: String){
        
        let webController = WebViewController()
        webController.url = urlString
        
        self.present(webController, animated: true, completion: nil)
    }
}
