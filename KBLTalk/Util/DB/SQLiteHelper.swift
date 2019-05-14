//
//  SQLiteHelper.swift
//  KBLTalk
//
//  Created by NICE_hwlee on 09/05/2019.
//  Copyright © 2019 KBL. All rights reserved.
//

import Foundation
import SQLite


class SQLiteHelper {
    let db: Connection?
    
    let userInfo = Table("UserInfo")
    let id = Expression<String>("id")
    let name = Expression<String>("name")
    let profilePath = Expression<String>("profilePath")
    
    init() {
        db = try? Connection()
    }
    
    func createTable() {
        guard let db = db else {
            print("db connection failed!")
            return
        }
        
        do {
            try db.run(userInfo.create{ table in
                table.column(id, primaryKey: true)
                table.column(name)
                table.column(profilePath)
            })
        } catch {
            print(error)
        }
    }
    
    
    func createTableOldST() {
        guard let db = db else {
            print("db connection failed!")
            return
        }
        
        let tableSql =
        """
        CREATE TABLE UserInfo (id TEXT PRIMARY KEY NOT NULL, name TEXT, profilePath TEXT)
        """
        do {
            try db.execute(tableSql)
        } catch {
            print(error)
        }
    }
    
    func insertOldST() {
        guard let db = db else {
            print("db connection failed!")
            return
        }
        let sql =
        """
        INSERT INTO UserInfo Values('test', 'test', 'notSet')
        """
        do {
            try db.execute(sql)
        } catch {
            print(error)
        }
    }
    
    func insert() {
        guard let db = db else {
            print("db connection failed!")
            return
        }
        
        do {
            try db.run(userInfo.insert(id <- "test", name <- "test", profilePath <- "notSet"))
        } catch {
            print(error)
        }
    }
    
    func select() {
        guard let db = db else {
            print("db connection failed!")
            return
        }
        
        let query = userInfo.select(userInfo[*])
        
        do {
            for userInfo in try db.prepare(query) {
                print(userInfo)
            }
        } catch {
            print(error)
        }
    }
    
    
    func selectOldST() {
        guard let db = db else {
            print("db connection failed!")
            return
        }
        
//        let query = userInfo.select(userInfo[*])
        let query = "SELECT * FROM UserInfo"
        do {
            for userInfo in try db.prepare(query) {
                print(userInfo)
            }
        } catch {
            print(error)
        }
    }
}
