//
//  ImageViewModel.swift
//  MVVM-Login
//
//  Created by Dhanush S on 08/02/23.
//

import Foundation

struct ImageViewModel {
    func getImageData(imageRequest: ImageRequest?, completion: @escaping(_ result: ImageResponse?) -> Void) {
        let imageResource = ImageResource()
        imageResource.getImageData(request: imageRequest!) { imageApiResponse in
            _ = completion(imageApiResponse)
        }
    }
}
