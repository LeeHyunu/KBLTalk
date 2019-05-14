//
//  NetworkRequestBuilder.swift
//  KBLTalk
//
//  Created by NICE_hwlee on 14/05/2019.
//  Copyright © 2019 KBL. All rights reserved.
//

import Foundation
import Alamofire

class NetworkRequestBuilder<T> {
    typealias Success = (T) -> ()
    typealias Fail = (String) -> ()
    
    var parameter : Parameters?
    var success : Success?
    var fail : Fail?
    
    func buildParameter(params: Parameters) -> NetworkRequestBuilder {
        self.parameter = params
        return self
    }
    
    func buildSuccess(success: @escaping Success) -> NetworkRequestBuilder {
        self.success = success
        return self
    }
    
    func buildFail(fail: @escaping Fail) -> NetworkRequestBuilder {
        self.fail = fail
        return self
    }
}

