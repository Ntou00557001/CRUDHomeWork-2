//
//  View.swift
//  CRUDHomeWork
//
//  Created by User08 on 2020/11/19.
//

import SwiftUI

struct UserView: View {
    //@ObservedObject var DataBase:TankDataBase = TankDataBase()
    @ObservedObject var DataBase:TankDataBase
    /*init(){
        DataBase.LoadtestData()
    }*/
    
    var body: some View {
        TabView{
            TankListEditView(DataBase: self.DataBase).tabItem { Text("坦克資料") }
            ArmamentListEditView(DataBase: self.DataBase).tabItem { Text("武器資料") }
            AmmunitionListEditView(DataBase: self.DataBase).tabItem { Text("彈種資料") }
            EngineListEditView(DataBase:self.DataBase).tabItem { Text("引擎資料") }
            //EditView(DataBase: self.DataBase)
        }
        
    }
}

struct ListEditView: View{
    @ObservedObject var DataBase:TankDataBase
    var ListMode:UseModeName
    
    var body: some View{
        VStack{
            List{
                ForEach(DataBase.TankDataBase){
                    snowTankData in
                    ScrollView{
                        HStack{
                            Text(snowTankData.Name)
                            Spacer()
                            Text("編輯")
                            Text("刪除")
                        }
                    }.fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                }
                ScrollView{
                    NavigationLink(destination: EditView(DataBase: self.DataBase)){
                        HStack{
                            switch ListMode {
                            case .TankMode: Text("新建坦克資料＋")
                            case .ArmamentMode: Text("新建武器資料＋")
                            case .AmmunititonMode: Text("新建彈種資料＋")
                            case .EngineMode: Text("新建引擎資料＋")
                            }
                        }
                    }
                }
            }
        }.navigationBarTitle("坦克列表")
    }
}

struct TankListEditView: View{
    @ObservedObject var DataBase:TankDataBase
    var thisPresetData = PresetData()
    var body: some View{
        VStack{
            List{
                ForEach(DataBase.TankDataBase){
                    snowTankData in
                    ScrollView{
                        NavigationLink(destination: showTankDataView(DataBase: self.DataBase, ShowData: snowTankData)){
                            HStack{
                                Text(snowTankData.Name).foregroundColor(.black)
                                Spacer()
                                NavigationLink(destination: TankEditView(DataBase: self.DataBase,NewEditData:snowTankData)){
                                    Text("編輯")
                                }
                                Button("刪除") {
                                    DataBase.TankDataRemove(snowTankData)
                                }
                            }
                        }
                    }.fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                }
                ScrollView{
                    NavigationLink(destination: TankEditView(DataBase: self.DataBase,NewEditData:thisPresetData.PresetTank)){
                        HStack{
                            Text("新建坦克資料")
                            Text("＋")
                        }
                    }
                }
            }
        }.navigationBarTitle("坦克列表")
    }
}

struct ArmamentListEditView: View{
    @ObservedObject var DataBase:TankDataBase
    var thisPresetData = PresetData()
    var body: some View{
        VStack{
            List{
                ForEach(DataBase.ArmamentDataBase){
                    snowTankData in
                    ScrollView{
                        NavigationLink(destination: showArmamentDataView(DataBase: self.DataBase, ShowData: snowTankData)){
                            HStack{
                                Text(snowTankData.Name).foregroundColor(.black)
                                Spacer()
                                NavigationLink(destination: ArmamentEditView(DataBase: self.DataBase,NewEditData:snowTankData)){
                                    Text("編輯")
                                }
                                Button("刪除") {
                                    DataBase.ArmamentDataRemove(snowTankData)
                                }
                            }
                        }
                        
                    }.fixedSize(horizontal: false, vertical: true
                    )
                }
                ScrollView{
                    NavigationLink(destination: ArmamentEditView(DataBase: self.DataBase,NewEditData:thisPresetData.PresetArmament)){
                        HStack{
                            Text("新建武器資料")
                            Text("＋")
                        }
                    }
                }
            }
        }.navigationBarTitle("武器列表")
    }
}

struct AmmunitionListEditView: View{
    @ObservedObject var DataBase:TankDataBase
    var thisPresetData = PresetData()
    var body: some View{
        VStack{
            List{
                ForEach(DataBase.AmmunitionDataBase){
                    snowTankData in
                    ScrollView{
                        NavigationLink(destination: showAmmunititonDataView(DataBase: self.DataBase, ShowData: snowTankData)){
                            HStack{
                                Text(snowTankData.Name).foregroundColor(.black)
                                Spacer()
                                NavigationLink(destination: AmmunitionEditView(DataBase: self.DataBase,NewEditData:snowTankData)){
                                    Text("編輯")
                                }
                                Button("刪除") {
                                    DataBase.AmmunitionDataRemove(snowTankData)
                                }
                            }
                        }
                        
                    }.fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                }
                ScrollView{
                    NavigationLink(destination: AmmunitionEditView(DataBase: self.DataBase,NewEditData:thisPresetData.PresetAmmunition)){
                        HStack{
                            Text("新建彈種資料")
                            Text("＋")
                        }
                    }
                }
            }
        }.navigationBarTitle("彈種列表")
    }
}

struct EngineListEditView: View{
    @ObservedObject var DataBase:TankDataBase
    var thisPresetData = PresetData()
    var body: some View{
        VStack{
            List{
                ForEach(DataBase.EngineDataBase){
                    snowTankData in
                    ScrollView{
                        NavigationLink(destination: showEngineDataView(DataBase: self.DataBase, ShowData: snowTankData)){
                            HStack{
                                Text(snowTankData.Name).foregroundColor(.black)
                                Spacer()
                                NavigationLink(destination: EngineEditView(DataBase: self.DataBase,NewEditData:snowTankData)){
                                    Text("編輯")
                                }
                                Button("刪除") {
                                    DataBase.EngineDataRemove(snowTankData)
                                }
                            }
                        }
                        
                    }.fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                }
                ScrollView{
                    NavigationLink(destination: EngineEditView(DataBase: self.DataBase,NewEditData:thisPresetData.PresetEngine)){
                        HStack{
                            Text("新建引擎資料")
                            Text("＋")
                        }
                    }
                }
            }
        }.navigationBarTitle("引擎列表")
    }
}




struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(DataBase:TankDataBase())
    }
}
