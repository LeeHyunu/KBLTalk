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
    var name: String
    var profilePath : String
    
    init(name: String, profilePath: String?) {
        self.name = name
        guard let path = profilePath , path != "noData" else{
            self.profilePath = "defaultProfile"
            return
        }
        self.profilePath = path
    }
    
    convenience init(room: ChatroomVO) {
        self.init(name : room.id, profilePath: room.profilePath)
    }
    
    func cellInstance(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chatRoom", for: indexPath) as! ChatRoomCell
        cell.setViews(viewModel: self)
        return cell
    }
}
