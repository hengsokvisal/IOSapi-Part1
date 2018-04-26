//
//  apiParam.swift
//  apiDisplay
//
//  Created by HengVisal on 4/25/18.
//  Copyright © 2018 HengVisal. All rights reserved.
//

class apiParam
{
    private init() {}
    static let shared = apiParam()
    
    func userName() -> String{
        return "suguru.sasaki@quad.co.jp"
    }
    func grant_type() -> String {
        return "password"
    }
    func password() -> String {
        return "abc123"
    }
    func client_id() -> String {
        return "3"
    }
    func client_secret() -> String {
        return "7d1rKIZCc80wQVEDk95uesFwUQnOGFpz7HPQGSbm"
    }
}
