//
//  ChatRoomNetworkModel.swift
//  KBLTalk
//
//  Created by NICE_hwlee on 13/05/2019.
//  Copyright © 2019 KBL. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct ChatRoomNetworkModel : RequestURLCreatable, NetworkErrorCheckable {
   
    public static func getList(caller: NetworkRequestBuilder<Chatrooms>) {
        AF.request(requestUrl(URI: "chatroom/getFriends"), method: .post)
            .responseJSON(){ response in
                let networkError = self.inNotNetworkError(resError: response.error)
                guard networkError.result else {
                    caller.fail?(networkError.errorString)
                    return
                }
                
                do {
                    let decoder  = JSONDecoder()
                    let result = try decoder.decode(Chatrooms.self, from: response.data!)
                    caller.success?(result)
                } catch {
                    caller.fail?("parse error: \(error)")
                }
        }
    }
    
    
    public static func addFriends(caller: NetworkRequestBuilder<NetworkResults>) {
        guard let parameter: Parameters = caller.parameter else {
            print("parameter is nil")
            return
        }
        
        AF.request(requestUrl(URI: "chatroom/addFriend"), method: .post, parameters: parameter)
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
                    caller.fail?("parse error: \(error)")
                }
        }
    }
}
