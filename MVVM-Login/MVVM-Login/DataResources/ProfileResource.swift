//
//  ProfileResource.swift
//  MVVM-Login
//
//  Created by Dhanush S on 08/02/23.
//

import Foundation

struct ProfileResource {
    func getProfiletData(completion: @escaping (_ result: ProfileResponse?) -> Void) {
        let profileUrl = URL(string: ApiEndpoints.profile)!
        let httpUtility = HttpUtility()
        httpUtility.getApiData(requestUrl: profileUrl, resultType: ProfileResponse.self) { profileApiResponse in
            _ = completion(profileApiResponse)
        }
    }
}
