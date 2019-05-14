//
//  NetworkResults.swift
//  KBLTalk
//
//  Created by NICE_hwlee on 14/05/2019.
//  Copyright © 2019 KBL. All rights reserved.
//

import Foundation
struct NetworkResults : Codable {
    let result : NetworkResult
    
    private enum CodingKeys: String, CodingKey {
        case result
    }
}

struct NetworkResult : Codable {
    let resultCode: String
    let resultMsg : String
    
    private enum CodingKeys: String, CodingKey {
        case resultCode
        case resultMsg
    }
}
