//
//  HttpUtility.swift
//  MVVM-Login
//
//  Created by Dhanush S on 06/02/23.
//

import Foundation

struct HttpUtility {
    
    func getApiData<T:Decodable>(requestUrl: URL, resultType: T.Type, completionHandler: @escaping(_ result: T?) -> Void) {
        
        URLSession.shared.dataTask(with: requestUrl) {responseData, httpUrlResponse, error in
            if(error == nil && responseData != nil && responseData?.count != 0) {
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(T.self, from: responseData!)
                    _ = completionHandler(result)
                } catch let error {
                    debugPrint("error = \(error.localizedDescription)")
                }
            }
        }.resume()
    }
    
    func postApiData<T:Decodable>(requestUrl: URL, requestBody: Data, resultType: T.Type, completionHandler: @escaping(_ result: T) -> Void) {

        var urlRequest = URLRequest(url: requestUrl)
        urlRequest.httpMethod = "post"
        urlRequest.httpBody = requestBody
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")

        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if (data != nil && data?.count != 0) {
                do {
                    let result = try  JSONEncoder().encode(requestBody)
                    _ = completionHandler(result as! T)
                } catch let error {
                    debugPrint("error = \(error.localizedDescription)")
                }
            }
        }
    }
}
