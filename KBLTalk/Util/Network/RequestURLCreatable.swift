//
//  RequestURLCreatable.swift
//  KBLTalk
//
//  Created by NICE_hwlee on 14/05/2019.
//  Copyright © 2019 KBL. All rights reserved.
//

import Foundation
protocol RequestURLCreatable {
    static func requestUrl(URI:String) -> String
}

extension RequestURLCreatable {
    static func requestUrl(URI:String) -> String {
        let BASEURL = "http://192.168.0.51:3000"
        let requestURL = String(format: "%@/%@",BASEURL, URI)
        return requestURL
    }
}
