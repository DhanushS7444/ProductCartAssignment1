//
//  ImageResource.swift
//  MVVM-Login
//
//  Created by Dhanush S on 08/02/23.
//

import Foundation

struct ImageResource {
    
    func getImageData(request: ImageRequest, completion: @escaping (_ result: ImageResponse?) -> Void) {
        let imageUrl = request.imageURL ?? ""
        let requestUrl = URL(string: imageUrl)!
        let httpUtility = HttpUtility()
        httpUtility.getApiData(requestUrl: requestUrl, resultType: ImageResponse.self) { imageApiResponse in
            _ = completion(imageApiResponse)
        }
    }
}
