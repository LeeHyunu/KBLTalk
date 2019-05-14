//
//  ChatroomVO.swift
//  KBLTalk
//
//  Created by NICE_hwlee on 14/05/2019.
//  Copyright © 2019 KBL. All rights reserved.
//

import Foundation
struct Chatrooms : Codable {
    var result: NetworkResult
    var data: [ChatroomVO]?
    private enum CodingKeys: String, CodingKey {
        case result
        case data
    }
}

struct ChatroomVO : Codable {
    var id: String
    var pw: String
    var profilePath: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case pw
        case profilePath
    }
}
