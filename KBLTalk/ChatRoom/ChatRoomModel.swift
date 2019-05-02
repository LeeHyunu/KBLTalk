//
//  ChatRoomModel.swift
//  KBLTalk
//
//  Created by NICE_hwlee on 30/04/2019.
//  Copyright © 2019 KBL. All rights reserved.
//

import Foundation
class ChatRoomModel {
    var roomName : String
    var profilePath : String?
    
    init(roomName: String, profilePath: String?) {
        self.roomName = roomName
        self.profilePath = profilePath
    }
}
