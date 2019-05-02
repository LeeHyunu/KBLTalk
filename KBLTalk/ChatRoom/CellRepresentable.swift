//
//  CellRepresentable.swift
//  KBLTalk
//
//  Created by NICE_hwlee on 30/04/2019.
//  Copyright © 2019 KBL. All rights reserved.
//

import Foundation
import UIKit
protocol CellRepresentable {
    var rowHeight : CGFloat {get}
    func cellInstance(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
}
