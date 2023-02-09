//
//  ProfileViewModel.swift
//  MVVM-Login
//
//  Created by Dhanush S on 08/02/23.
//

import Foundation

protocol ProfileModelDelegate {
    func loggOutButtonTappedAction()
}

struct ProfileViewModel {
    
    var delegateProfile: ProfileModelDelegate?
    
    func getProfileData(completion: @escaping(_ result: ProfileResponse?) -> Void) {
        let profileResource = ProfileResource()
        profileResource.getProfiletData { profileApiResponse in
            _ = completion(profileApiResponse)
        }
    }
    
    func logoutUser() {
        self.delegateProfile?.loggOutButtonTappedAction()
    }
}
