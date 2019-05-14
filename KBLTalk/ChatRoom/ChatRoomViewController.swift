//
//  ChatRoomViewController.swift
//  KBLTalk
//
//  Created by NICE_hwlee on 30/04/2019.
//  Copyright © 2019 KBL. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ChatRoomViewController: UIViewController {
    var data = [CellRepresentable]()
    
    @IBOutlet weak var tbChatrooms: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbChatrooms.delegate = self
        tbChatrooms.dataSource = self
        
        
//        //test
//        let db = SQLiteHelper()
//        db.createTable()
//        db.insertOldST()
//        db.selectOldST()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        initDatas()
    }
    
    
    func initDatas() {
        ChatRoomNetworkModel
            .getList(caller: NetworkRequestBuilder<Chatrooms>.init()
                .buildFail { errorString in
                    print(errorString)
                }
                .buildSuccess { resultData in
                    if resultData.result.resultCode == "001" {
                        if let chatrooms = resultData.data {
                            self.data.removeAll()
                            for chatroom in chatrooms {
                                self.data.append(ChatRoomViewModel(room: chatroom))
                            }
                            self.tbChatrooms.reloadData()
                        }
                        
                    }else {
                        self.data.removeAll()
                        self.tbChatrooms.reloadData()
                        //empty list
                    }
            }
        )
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
