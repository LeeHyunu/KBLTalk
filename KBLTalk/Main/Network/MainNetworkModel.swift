//
//  MainNetworkModel.swift
//  KBLTalk
//
//  Created by NICE_hwlee on 14/05/2019.
//  Copyright © 2019 KBL. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct MainNetworkModel : RequestURLCreatable, NetworkErrorCheckable {
    
    public static func doLogin(caller: NetworkRequestBuilder<NetworkResults>) {
        guard let parameter: Parameters = caller.parameter else {
            print("parameter is nil")
            return
        }
        
        AF.request(requestUrl(URI: "login"), method: .post, parameters: parameter)
            .response(){ response in
                let networkError = self.inNotNetworkError(resError: response.error)
                guard networkError.result else {
                    caller.fail?(networkError.errorString)
                    return
                }
                
                do {
                    let decoder  = JSONDecoder()
                    let result = try decoder.decode(NetworkResults.self, from: response.data!)
                    caller.success?(result)
                } catch {
                    print(response.data!)
                    caller.fail?("parse error: \(error)")
                }
        }
    }
}
