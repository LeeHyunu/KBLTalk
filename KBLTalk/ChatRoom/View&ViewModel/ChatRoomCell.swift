//
//  ChatRoomCell.swift
//  KBLTalk
//
//  Created by NICE_hwlee on 30/04/2019.
//  Copyright © 2019 KBL. All rights reserved.
//

import UIKit

class ChatRoomCell: UITableViewCell {

    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var laChatRoomName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setViews(viewModel: ChatRoomViewModel) {
        imgProfile.image = UIImage(named: viewModel.imgPath)
        laChatRoomName.text = viewModel.room.roomName
    }
    
}
