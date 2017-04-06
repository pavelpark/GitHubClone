//
//  RepositoryCellTableViewCell.swift
//  GitHubClone
//
//  Created by Pavel Parkhomey on 4/5/17.
//  Copyright © 2017 Pavel Parkhomey. All rights reserved.
//

import UIKit

class RepoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var repoName: UILabel!
    @IBOutlet weak var repoDescription: UILabel!
    @IBOutlet weak var repoLanguage: UILabel!
    
    
    var repository : Repository! {
        didSet{
            repoName.text = repository.name
            repoDescription.text = repository.description
            repoLanguage.text = repository.language
            
            repoName.textColor = UIColor.black
            repoDescription.textColor = UIColor.black
            repoLanguage.textColor = UIColor.black
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
