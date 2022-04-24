//
//  UserTasksCell.swift
//  ToDoListUsers
//
//  Created by Mac on 24/04/2022.
//

import UIKit

class UserTasksCell: UITableViewCell {
    
    // MARK: - Proprties
    
    static let reuseIdentifier = "UserTasksCell"
    
    // MARK: - Views
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
//    @IBOutlet weak var statusView: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setupUI(){
//        statusView.layer.cornerRadius = 25
    }
    
    func configure(userTasks: Tasks?){
        self.titleLabel.text = userTasks?.title
        if (userTasks?.completed != false) {
            self.statusLabel.text = "Done"
            self.statusLabel.textColor = .green
//            self.statusView.backgroundColor = .green
        }else{
            self.statusLabel.text = "No done"
            self.statusLabel.textColor = .red
        }
    }
    
}
