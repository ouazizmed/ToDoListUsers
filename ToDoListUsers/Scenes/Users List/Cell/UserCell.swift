//
//  UserCell.swift
//  ToDoListUsers
//
//  Created by Mac on 23/04/2022.
//

import UIKit

class UserCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let reuseIdentifier = "UserCell"
    
    // MARK: - Views

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure(users: UsersEntity?) {
        self.nameLabel.text = users?.name
        self.usernameLabel.text = users?.username
        self.emailLabel.text = users?.email
    }
    
}
