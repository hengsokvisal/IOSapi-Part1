//
//  API.swift
//  apiDisplay
//
//  Created by HengVisal on 4/25/18.
//  Copyright © 2018 HengVisal. All rights reserved.
//

import Foundation

struct apiResult:Decodable
{
    let token_type : String
    let expires_in : Int
    let access_token : String
    let refresh_token : String
    let user_id : Int
}
