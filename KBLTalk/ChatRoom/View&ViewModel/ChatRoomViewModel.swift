//
//  ChatRoomViewModel.swift
//  KBLTalk
//
//  Created by NICE_hwlee on 30/04/2019.
//  Copyright © 2019 KBL. All rights reserved.
//

import Foundation
import UIKit

class ChatRoomViewModel : CellRepresentable{
    var rowHeight: CGFloat = 80
    var room : ChatRoomModel
    
    init(room: ChatRoomModel) {
        self.room = room
    }
    
    var imgPath: String {
        if let path = room.profilePath {
            return path
        }
        return "defaultProfile"
    }
    
    
    func cellInstance(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chatRoom", for: indexPath) as! ChatRoomCell
        cell.setViews(viewModel: self)
        return cell
    }
}
