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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        hasToken()
    }

    
    
    @IBOutlet weak var logInButton: UIButton!
    
    func hasToken() {
        if UserDefaults.standard.getAccessToken() == nil {
            print("Please Log In")
            logInButton.isEnabled = true
            logInButton.isHidden = false
        } else {
            print("Already Logged In")
            logInButton.isHidden = true
            logInButton.isEnabled = false
        }
    }
    
    @IBAction func printTokenPressed(_ sender: Any) {
    }

    @IBAction func logInButtonPressed(_ sender: Any) {
//        hasToken()
        let parameters = ["scope" : "email,user,repo"]
        
        GitHub.shared.oAuthRequestWith(parameters: parameters)
        
    }
    
    func dismissAuthController() {
        self.view.removeFromSuperview()
        self.removeFromParentViewController()
    }
}
