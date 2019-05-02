//
//  ChatRoomViewController.swift
//  KBLTalk
//
//  Created by NICE_hwlee on 30/04/2019.
//  Copyright © 2019 KBL. All rights reserved.
//

import UIKit

class ChatRoomViewController: UIViewController {
    var data = [CellRepresentable]()
    
    @IBOutlet weak var tbChatrooms: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbChatrooms.delegate = self
        tbChatrooms.dataSource = self
        
        initDatas()
    }
    
    func initDatas() {
        data = [
            ChatRoomViewModel(room: ChatRoomModel(roomName: "testRoom1", profilePath: nil)),
            ChatRoomViewModel(room: ChatRoomModel(roomName: "testRoom2", profilePath: nil)),
            ChatRoomViewModel(room: ChatRoomModel(roomName: "testRoom3", profilePath: nil)),
            ChatRoomViewModel(room: ChatRoomModel(roomName: "testRoom4", profilePath: nil)),
            ChatRoomViewModel(room: ChatRoomModel(roomName: "testRoom5", profilePath: nil)),
            ChatRoomViewModel(room: ChatRoomModel(roomName: "testRoom6", profilePath: nil))
        ]
        tbChatrooms.reloadData()
    }

}


extension ChatRoomViewController : UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return data[indexPath.row].cellInstance(tableView, indexPath: indexPath)
    }
    
    
}

extension ChatRoomViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return data[indexPath.row].rowHeight
    }
}
