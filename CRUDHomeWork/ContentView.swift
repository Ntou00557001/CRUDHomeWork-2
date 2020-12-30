//
//  ContentView.swift
//  CRUDHomeWork
//
//  Created by User08 on 2020/11/19.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var DataBase:TankDataBase
    var body: some View {
        NavigationView{
            NavigationLink(destination: UserView(DataBase:self.DataBase)){//UserView showDataView
                VStack{
                    Text("Hello,World!")
                    ZStack{
                        Circle()
                            .trim(from: CGFloat(DataBase.DataTypeRatioChartValue()[0]), to: CGFloat(DataBase.DataTypeRatioChartValue()[1]))
                         .stroke(Color.blue, style: StrokeStyle(lineWidth: 10))
                         .frame(width: 50, height: 50)
                        Circle()
                         .trim(from: CGFloat(DataBase.DataTypeRatioChartValue()[1]), to: CGFloat(DataBase.DataTypeRatioChartValue()[2]))
                         .stroke(Color.red, style: StrokeStyle(lineWidth: 10))
                         .frame(width: 50, height: 50)
                        Circle()
                         .trim(from: CGFloat(DataBase.DataTypeRatioChartValue()[2]), to: CGFloat(DataBase.DataTypeRatioChartValue()[3]))
                         .stroke(Color.green, style: StrokeStyle(lineWidth: 10))
                         .frame(width: 50, height: 50)
                        Circle()
                         .trim(from: CGFloat(DataBase.DataTypeRatioChartValue()[3]), to: 100)
                         .stroke(Color.black, style: StrokeStyle(lineWidth: 10))
                         .frame(width: 50, height: 50)
                    }
                    HStack{
                        Text("坦克").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        Spacer()
                        Text("武器").foregroundColor(.red)
                        Spacer()
                        Text("彈種").foregroundColor(.green)
                        Spacer()
                        Text("引擎").foregroundColor(.black)
                    }
                    HStack{
                        Text("\(DataBase.TankDataBase.endIndex)").foregroundColor(.blue)
                        Spacer()
                        Text("\(DataBase.ArmamentDataBase.endIndex)").foregroundColor(.red)
                        Spacer()
                        Text("\(DataBase.AmmunitionDataBase.endIndex)").foregroundColor(.green)
                        Spacer()
                        Text("\(DataBase.EngineDataBase.endIndex)").foregroundColor(.black)
                    }
                    HStack{
                        /*Text("\(Double(DataBase.TankDataBase.endIndex)/Double(DataBase.SumDataAmount())*100)").foregroundColor(.blue)*/
                        
                        
                        
                        
                        Text(String(format:"%.1lf%%",Double(DataBase.TankDataBase.endIndex)/Double(DataBase.SumDataAmount())*100))
                        Spacer()
                        Text(String(format:"%.1lf%%",Double(DataBase.ArmamentDataBase.endIndex)/Double(DataBase.SumDataAmount())*100)).foregroundColor(.red)
                        Spacer()
                        Text(String(format:"%.1lf%%",Double(DataBase.AmmunitionDataBase.endIndex)/Double(DataBase.SumDataAmount())*100)).foregroundColor(.green)
                        Spacer()
                        Text(String(format:"%.1lf%%",Double(DataBase.EngineDataBase.endIndex)/Double(DataBase.SumDataAmount())*100)).foregroundColor(.black)
                    }
                    Button("還原初始值"){
                        DataBase.LoadtestData()
                    }
                }
            }.navigationBarTitleDisplayMode(.inline).navigationBarHidden(true).navigationBarTitle("", displayMode: .inline)
        }.navigationBarTitleDisplayMode(.inline).navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ContentView(DataBase:TankDataBase())
        }
    }
}
