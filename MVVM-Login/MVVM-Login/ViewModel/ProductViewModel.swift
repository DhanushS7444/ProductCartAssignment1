//
//  ProductViewModel.swift
//  MVVM-Login
//
//  Created by Dhanush S on 07/02/23.
//

import Foundation

struct ProductViewModel {
    
    func getProductData(completion: @escaping(_ result: ProductResponse?) -> Void) {
        let productResource = ProductResource()
        productResource.getProductData { productApiResponse in
            _ = completion(productApiResponse)
        }
    }
}
