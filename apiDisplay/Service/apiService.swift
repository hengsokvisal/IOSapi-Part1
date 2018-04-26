//
//  apiService.swift
//  apiDisplay
//
//  Created by HengVisal on 4/25/18.
//  Copyright © 2018 HengVisal. All rights reserved.
//

import Foundation

class apiService
{
    let apiIn = apiResult.self
    
    static let shared = apiService()
    private init() {}
    
    func apiPostRequest(completion: @escaping (apiResult) -> Void) {
        let parameter = ["username":apiParam.shared.userName(),"grant_type":apiParam.shared.grant_type(),"password":apiParam.shared.password(),"client_secret":apiParam.shared.client_secret(),"client_id":apiParam.shared.client_id()]
        
        guard let endpoint = URL(string: "https://nsapp.neurospace.jp/oauth/token") else {return}
        var request = URLRequest(url:endpoint)
        request.httpMethod = "POST"
        var headers = request.allHTTPHeaderFields ?? [:]
        headers["Content-Type"] = "application/json"
        request.allHTTPHeaderFields = headers
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(parameter)
            request.httpBody = jsonData
        } catch {
            print(error)
        }
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (responseData, response, responseError) in
            guard responseError == nil else {
                print(responseError!)
                return
            }
            do{
                guard let data = responseData else {return}
                let json = try JSONDecoder().decode(self.apiIn, from: data)
                DispatchQueue.main.async {
                    completion(json)
                }
            }catch
            {
                print(responseError!)
            }
        }
        task.resume()

    }
}

