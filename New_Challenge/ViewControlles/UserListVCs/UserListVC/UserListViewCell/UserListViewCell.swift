//
//  UserListViewCell.swift
//  New_Challenge
//
//  Created by Saad Saissi Hassani on 29/5/2023.
//

import UIKit

class UserListViewCell: UITableViewCell {
    
    //MARK: Properties -
     var imageRequest: Cancellable?
    var user : UserListViewModel! {
        didSet {
            self.creatUI()
        }
    }
    
    
    //MARK: Outlets -
    @IBOutlet weak var ul_userEmail: UILabel!
    @IBOutlet weak var ul_userName: UILabel!
    @IBOutlet weak var img_userPhoto: UIImageView!
    
    
    
    //MARK: Init Methods -
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   
    override func prepareForReuse() {
        super.prepareForReuse()
        img_userPhoto.image = nil
        imageRequest?.cancel()
    }
    //MARK: Actions -
}
//MARK: Helpers
extension UserListViewCell {
    
    func creatUI() {
        img_userPhoto.layer.cornerRadius = img_userPhoto.frame.height / 2
        img_userPhoto.layer.borderWidth = 0.5
        img_userPhoto.layer.borderColor = UIColor.systemGray4.cgColor
        guard let user else { return }
        ul_userName.text = user.name
        ul_userEmail.text = user.email
    }
}


