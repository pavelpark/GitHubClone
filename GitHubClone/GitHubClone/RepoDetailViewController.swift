//
//  RepoDetailViewController.swift
//  GitHubClone
//
//  Created by Pavel Parkhomey on 4/5/17.
//  Copyright © 2017 Pavel Parkhomey. All rights reserved.
//

import UIKit

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
        self.isForked.text = personalRepo.isForked ? "is forked" : "not forked"
        self.whenCreatedDate.text = personalRepo.whenCreatedDate

        

    }
}
