//
//  showDataView.swift
//  CRUDHomeWork
//
//  Created by User15 on 2020/12/17.
//

import SwiftUI

struct showDataView: View {
    var testData = PresetData()
    var body: some View {
        showTankDataView(DataBase: TankDataBase(), ShowData: testData.PresetTank)
    }
}

struct showTankDataView:View{
    @ObservedObject var DataBase:TankDataBase
    var ShowData:TankData
    var body:some View{
        VStack{
            List{
                ScrollView{
                    HStack{
                        Text("坦克名稱")
                        Spacer()
                        Text("\(ShowData.Name)")
                    }
                }
                ScrollView{
                    HStack{
                        Text("主要武器")
                        Spacer()
                        NavigationLink(destination: showArmamentDataView(DataBase: self.DataBase,ShowData:ShowData.TankMainArmament)){
                            Text("\(ShowData.TankMainArmament.Name)")
                        }
                    }
                }
                ScrollView{
                    HStack{
                        Text("次要武器")
                        Spacer()
                        NavigationLink(destination: showArmamentDataView(DataBase: self.DataBase,ShowData:ShowData.TankSecondaryArmament)){
                            Text("\(ShowData.TankSecondaryArmament.Name)")
                        }
                    }
                }
                ScrollView{
                    HStack{
                        Text("引擎")
                        Spacer()
                        NavigationLink(destination: showEngineDataView(DataBase: self.DataBase,ShowData:ShowData.TankEngine)){
                            Text("\(ShowData.TankEngine.Name)")
                        }
                    }
                }
                showTextAndValue(inputTextString: "主砲砲彈初速", inputValue:self.DataBase.AmmunitionMuzzleVelocityPercentage(ShowData.TankMainArmament.ArmamentAmmunition.AmmunitionMuzzleVelocity))
                
                showTextAndValue(inputTextString: "副砲砲彈初速", inputValue:self.DataBase.AmmunitionMuzzleVelocityPercentage(ShowData.TankSecondaryArmament.ArmamentAmmunition.AmmunitionMuzzleVelocity))
                
                showTextAndValue(inputTextString: "主砲砲彈質量", inputValue:self.DataBase.AmmunitionProjectileMassPercentage(ShowData.TankMainArmament.ArmamentAmmunition.AmmunitionProjectileMass) )
                
                showTextAndValue(inputTextString: "副砲砲彈質量", inputValue:self.DataBase.AmmunitionProjectileMassPercentage(ShowData.TankSecondaryArmament.ArmamentAmmunition.AmmunitionProjectileMass) )
                
                showTextAndValue(inputTextString: "引擎馬力", inputValue: self.DataBase.EngineHorsePowerPercentage(ShowData.TankEngine.HorsePower))
            }
        }
    }
}


struct showArmamentDataView:View{
    @ObservedObject var DataBase:TankDataBase
    var ShowData:Armament
    var body:some View{
        VStack{
            List{
                ScrollView{
                    HStack{
                        Text("武器名稱")
                        Spacer()
                        Text("\(ShowData.Name)")
                    }
                }
                ScrollView{
                    HStack{
                        Text("彈種名稱")
                        NavigationLink(destination: showAmmunititonDataView(DataBase: self.DataBase,ShowData:ShowData.ArmamentAmmunition)){
                            Text("\(ShowData.ArmamentAmmunition.Name)")
                        }
                    }
                }
            }
        }
    }
}

struct showAmmunititonDataView:View{
    @ObservedObject var DataBase:TankDataBase
    var ShowData:Ammunition
    var body:some View{
        VStack{
            List{
                ScrollView{
                    HStack{
                        Text("彈種名稱")
                        Spacer()
                        Text("\(ShowData.Name)")
                    }
                }
                ScrollView{
                    HStack{
                        Text("初速")
                        Text("\(ShowData.AmmunitionMuzzleVelocity) m/s")
                    }
                }
                ScrollView{
                    HStack{
                        Text("質量")
                        Text("\(ShowData.AmmunitionProjectileMass) kg")
                    }
                }
            }
        }
    }
}

struct showEngineDataView:View{
    @ObservedObject var DataBase:TankDataBase
    var ShowData:Engine
    var body:some View{
        VStack{
            List{
                ScrollView{
                    HStack{
                        Text("引擎名稱")
                        Spacer()
                        Text("\(ShowData.Name)")
                    }
                }
                ScrollView{
                    HStack{
                        Text("引擎馬力")
                        Text(String(format:"%.2lf",ShowData.HorsePower))
                    }
                }
            }
        }
    }
}

struct showTankNameDataView:View{
    @ObservedObject var DataBase:TankDataBase
    var body:some View{
        ForEach(DataBase.TankDataBase){
            snowTankData in
            ScrollView{
                HStack{
                    Text(snowTankData.Name)
                    Spacer()
                    NavigationLink(destination: TankEditView(DataBase: self.DataBase,NewEditData:snowTankData)){
                        Text("編輯")
                    }
                    Button("刪除") {
                        DataBase.TankDataRemove(snowTankData)
                    }
                }
            }.fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
        }
    }
}

struct showArmamentNameDataView:View{
    @ObservedObject var DataBase:TankDataBase
    var body:some View{
        ForEach(DataBase.TankDataBase){
            snowTankData in
            ScrollView{
                HStack{
                    Text(snowTankData.Name)
                    Spacer()
                    NavigationLink(destination: TankEditView(DataBase: self.DataBase,NewEditData:snowTankData)){
                        Text("編輯")
                    }
                    Button("刪除") {
                        DataBase.TankDataRemove(snowTankData)
                    }
                }
            }.fixedSize(horizontal: false, vertical: true)
        }
    }
}

struct showAmmunititonNameDataView:View{
    @ObservedObject var DataBase:TankDataBase
    var body:some View{
        ForEach(DataBase.TankDataBase){
            snowTankData in
            ScrollView{
                HStack{
                    Text(snowTankData.Name)
                    Spacer()
                    NavigationLink(destination: TankEditView(DataBase: self.DataBase,NewEditData:snowTankData)){
                        Text("編輯")
                    }
                    Button("刪除") {
                        DataBase.TankDataRemove(snowTankData)
                    }
                }
            }.fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
        }
    }
}

struct showEngineNameDataView:View{
    @ObservedObject var DataBase:TankDataBase
    var body:some View{
        ForEach(DataBase.TankDataBase){
            snowTankData in
            ScrollView{
                HStack{
                    Text(snowTankData.Name)
                    Spacer()
                    NavigationLink(destination: TankEditView(DataBase: self.DataBase,NewEditData:snowTankData)){
                        Text("編輯")
                    }
                    Button("刪除") {
                        DataBase.TankDataRemove(snowTankData)
                    }
                }
            }.fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
        }
    }
}

struct showTextAndValue:View{
    var inputTextString:String
    var inputValue:Double
    var body: some View{
        HStack{
            Text(inputTextString)
            ZStack{
                Text(String(format:"%.2lf%%",inputValue))
                Path{
                    (path) in
                    path.move(to: CGPoint(x:0,y:20))
                    path.addLine(to: CGPoint(x: inputValue, y: 20))
                }.stroke(Color.red)
            }
        }
    }
}

struct showDataView_Previews: PreviewProvider {
    static var previews: some View {
        showDataView()
    }
}
