//
//  ProductResource.swift
//  MVVM-Login
//
//  Created by Dhanush S on 07/02/23.
//

import Foundation

struct ProductResource {
    
    func getProductData(completion: @escaping (_ result: ProductResponse?) -> Void) {
        let productUrl = URL(string: ApiEndpoints.product)!
        let httpUtility = HttpUtility()
        httpUtility.getApiData(requestUrl: productUrl, resultType: ProductResponse.self) { productApiResponse in
            _ = completion(productApiResponse)
        }
    }
}
