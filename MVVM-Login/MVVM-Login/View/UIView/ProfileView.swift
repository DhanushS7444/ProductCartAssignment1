//
//  ProfileView.swift
//  MVVM-Login
//
//  Created by Dhanush S on 08/02/23.
//

import Foundation
import UIKit

class ProfileView: UIView {
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var rewardPoints: UILabel!
    @IBOutlet weak var balance: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var dob: UILabel!
    
    private var profileViewModel = ProfileViewModel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    private func commonInit() {
        let bundle = Bundle.init(for: ProfileView.self)
        if let viewToAdd = bundle.loadNibNamed("ProfileView", owner: self, options: nil), let contentView = viewToAdd.first as? UIView {
            addSubview(contentView)
            contentView.frame = self.bounds
            contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        }
    }
    
    @IBAction func logoutButtonTapped(_ sender: Any) {
        profileViewModel.logoutUser()
    }
    
}
