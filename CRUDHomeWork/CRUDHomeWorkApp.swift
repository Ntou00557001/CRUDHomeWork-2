//
//  CRUDHomeWorkApp.swift
//  CRUDHomeWork
//
//  Created by User08 on 2020/11/19.
//

import SwiftUI

@main
struct CRUDHomeWorkApp: App {
    @ObservedObject var DataBase:TankDataBase = TankDataBase()
    var body: some Scene {
        WindowGroup {
            ContentView(DataBase:self.DataBase)
        }
    }
}
