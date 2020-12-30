//
//  EditView.swift
//  CRUDHomeWork
//
//  Created by User19 on 2020/11/25.
//

import SwiftUI
import UIKit

struct EditView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var DataBase:TankDataBase
    var thisPresetData = PresetData()
    //var Mode:UseModeName
    var body: some View {
        //TankEditView(DataBase: DataBase, NewEditData: thisPresetData.PresetTank)
        AmmunitionEditView(DataBase: DataBase, NewEditData: thisPresetData.PresetAmmunition)
    }
}

struct TankEditView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var DataBase:TankDataBase
    @State var NewEditData:TankData
    var body: some View {
        VStack{
            List{
                    HStack{
                        Text("坦克名稱")
                        TextField("\(NewEditData.Name)",text:$NewEditData.Name)
                    }
                    HStack{
                        Text("主要武器")
                        GeometryReader{
                            geometry in
                            Picker(selection: $NewEditData.TankMainArmament.id,label: Text("選擇武器")){
                                ForEach(DataBase.ArmamentDataBase.indices, id: \.self){
                                    (DataNumber) in
                                    Text(DataBase.ArmamentDataBase[DataNumber].Name).tag(DataBase.ArmamentDataBase[DataNumber].id)
                                }
                            }.frame(width: geometry.size.width, height: geometry.size.height, alignment: .center).clipped()
                        }
                    }
                    HStack{
                        Text("次要武器")
                        GeometryReader{
                            geometry in
                            Picker(selection: $NewEditData.TankSecondaryArmament.id,label: Text("選擇武器")){
                                ForEach(DataBase.ArmamentDataBase.indices, id: \.self){
                                    (DataNumber) in
                                    Text(DataBase.ArmamentDataBase[DataNumber].Name).tag(DataBase.ArmamentDataBase[DataNumber].id)
                                }
                            }.frame(width: geometry.size.width, height: geometry.size.height, alignment: .center).clipped()
                        }
                    }
                    HStack{
                        Text("引擎")
                        GeometryReader{
                            geometry in
                            Picker(selection: $NewEditData.TankEngine.id,label: Text("選擇引擎")){
                                ForEach(DataBase.EngineDataBase.indices, id: \.self){
                                    (DataNumber) in
                                    Text(DataBase.EngineDataBase[DataNumber].Name).tag(DataBase.EngineDataBase[DataNumber].id)
                                }
                            }.frame(width: geometry.size.width, height: geometry.size.height, alignment: .center).clipped()
                        }
                    }
                    
            }
            //Spacer()
        }.navigationBarTitle("Edit Tank Data").navigationBarItems(trailing: Button("save"){
                for DataNumber in 0..<DataBase.ArmamentDataBase.endIndex{
                    if(DataBase.ArmamentDataBase[DataNumber].id == NewEditData.TankMainArmament.id){
                        NewEditData.TankMainArmament = DataBase.ArmamentDataBase[DataNumber]
                    }
                    if(DataBase.ArmamentDataBase[DataNumber].id == NewEditData.TankSecondaryArmament.id){
                        NewEditData.TankSecondaryArmament = DataBase.ArmamentDataBase[DataNumber]
                    }
                }
                for DataNumber in 0..<DataBase.EngineDataBase.endIndex{
                    if(DataBase.EngineDataBase[DataNumber].id == NewEditData.TankEngine.id){
                        NewEditData.TankEngine = DataBase.EngineDataBase[DataNumber]
                        break
                    }
                }
            for saveNumber in 0...DataBase.TankDataBase.endIndex{
                    if(saveNumber == DataBase.TankDataBase.endIndex){
                        DataBase.TankDataBase.insert(NewEditData, at: saveNumber)
                        break
                    }else if(DataBase.TankDataBase[saveNumber].id == NewEditData.id){
                        DataBase.TankDataBase[saveNumber] = NewEditData
                        break
                    }
                }
                self.presentationMode.wrappedValue.dismiss()
            })
    }
}

struct ArmamentEditView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var DataBase:TankDataBase
    @State var NewEditData:Armament
    var body: some View {
        VStack{
            List{
                    HStack{
                        Text("武器名稱")
                        TextField("\(NewEditData.Name)",text:$NewEditData.Name)
                    }
                    HStack{
                        Text("武器彈種")
                        GeometryReader{
                            geometry in
                            Picker(selection: $NewEditData.ArmamentAmmunition.id,label: Text("選擇武器")){
                                ForEach(DataBase.AmmunitionDataBase.indices, id: \.self){
                                    (DataNumber) in
                                    Text(DataBase.AmmunitionDataBase[DataNumber].Name).tag(DataBase.AmmunitionDataBase[DataNumber].id)
                                }
                            }.frame(width: geometry.size.width, height: geometry.size.height, alignment: .center).clipped()
                        }
                    }
            }
            //Spacer()
        }.navigationBarTitle("Edit armament Data").navigationBarItems(trailing: Button("save"){
                for DataNumber in 0..<DataBase.AmmunitionDataBase.endIndex{
                    if(DataBase.AmmunitionDataBase[DataNumber].id == NewEditData.ArmamentAmmunition.id){
                        NewEditData.ArmamentAmmunition = DataBase.AmmunitionDataBase[DataNumber]
                        break
                    }
                }
                for saveNumber in 0...DataBase.ArmamentDataBase.endIndex{
                    if(saveNumber == DataBase.ArmamentDataBase.endIndex){
                        DataBase.ArmamentDataBase.insert(NewEditData, at: saveNumber)
                        break
                    }else if(DataBase.ArmamentDataBase[saveNumber].id == NewEditData.id){
                        DataBase.ArmamentDataBase[saveNumber] = NewEditData
                        break
                    }
                }
                self.presentationMode.wrappedValue.dismiss()
            })
    }
}

struct AmmunitionEditView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var DataBase:TankDataBase
    @State var NewEditData:Ammunition
    @State var inputMuzzleVelocity:String = ""
    @State var SaveMuzzleVelocity:Double? = 0.0
    @State var inputProjectileMass:String = ""
    @State private var showAlert = false
    @State private var showMuzzleVelocityAlert = false
    @State private var showProjectileMassAlert = false
    
    var body: some View {
        VStack{
            List{
                    HStack{
                        Text("彈種名稱")
                        TextField("\(NewEditData.Name)",text:$NewEditData.Name)
                    }
                    HStack{
                        Text("彈種初速")
                        TextField("\(NewEditData.AmmunitionMuzzleVelocity)",text:$inputMuzzleVelocity).textFieldStyle(RoundedBorderTextFieldStyle()).keyboardType(.numberPad).padding()
                        Text("m/s")
                    }
                    HStack{
                        Text("彈種質量")
                        TextField("\(NewEditData.AmmunitionProjectileMass)",text:$inputProjectileMass).textFieldStyle(RoundedBorderTextFieldStyle()).keyboardType(.numberPad).padding()
                        Text("kg")
                    }
            }
            //Spacer()
        }.navigationBarTitle("Edit Ammunition Data").navigationBarItems(trailing: Button("save"){
                if let MuzzleVelocity = Double(inputMuzzleVelocity){
                    NewEditData.AmmunitionMuzzleVelocity = MuzzleVelocity
                }else{
                    showMuzzleVelocityAlert = true
                }
                if let ProjectileMass = Double(inputProjectileMass){
                    NewEditData.AmmunitionProjectileMass = ProjectileMass
                }else{
                    showProjectileMassAlert = true
                }
            
                if showMuzzleVelocityAlert == false && showProjectileMassAlert == false{
                    for saveNumber in 0...DataBase.AmmunitionDataBase.endIndex{
                        if(saveNumber == DataBase.AmmunitionDataBase.endIndex){
                            DataBase.AmmunitionDataBase.insert(NewEditData, at: saveNumber)
                            break
                        }else if(DataBase.AmmunitionDataBase[saveNumber].id == NewEditData.id){
                            DataBase.AmmunitionDataBase[saveNumber] = NewEditData
                            break
                        }
                    }
                    self.presentationMode.wrappedValue.dismiss()
                }
        }.alert(isPresented: $showMuzzleVelocityAlert, content: {()->Alert in return Alert(title: Text("Beware"), message: Text("The 彈種初速 value entered is not a number or No input"))}).alert(isPresented: $showProjectileMassAlert, content: {   ()->Alert in return Alert(title: Text("Beware"), message: Text("The 彈種質量 value entered is not a number or No input"))})
        )
    }
}

struct EngineEditView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var DataBase:TankDataBase
    @State var NewEditData:Engine
    @State var inputHorsePower = ""
    @State private var showHorsePowerAlert = false
    var body: some View {
        VStack{
            List{
                    HStack{
                        Text("引擎名稱")
                        TextField("\(NewEditData.Name)",text:$NewEditData.Name)
                    }
                    HStack{
                        Text("引擎馬力")
                        TextField("\(NewEditData.HorsePower)",text:$inputHorsePower).textFieldStyle(RoundedBorderTextFieldStyle()).keyboardType(.numberPad).padding()
                        Text("hp")
                    }
            }
            //Spacer()
        }.navigationBarTitle("Edit Engine Data").navigationBarItems(trailing: Button("save"){
                if let HorsePower = Double(inputHorsePower){
                    NewEditData.HorsePower = HorsePower
                }else{
                    showHorsePowerAlert = true
                }
                if showHorsePowerAlert == false {
                    for saveNumber in 0...DataBase.EngineDataBase.endIndex{
                        if(saveNumber == DataBase.EngineDataBase.endIndex){
                            DataBase.EngineDataBase.insert(NewEditData, at: saveNumber)
                            break
                        }else if(DataBase.EngineDataBase[saveNumber].id == NewEditData.id){
                            DataBase.EngineDataBase[saveNumber] = NewEditData
                            break
                        }
                    }
                    self.presentationMode.wrappedValue.dismiss()
                }
        }.alert(isPresented: $showHorsePowerAlert, content: {
            ()->Alert in return Alert(title: Text("The 引擎馬力 value entered is not a number or No input"))
        }))
    }
}
struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        //EditView(DataBase: TankDataBase())
        TankEditView(DataBase: TankDataBase(), NewEditData: TankData(Name: "Test", TankMainArmament: TankDataBase().ArmamentDataBase[0], TankSecondaryArmament: TankDataBase().ArmamentDataBase[1], TankEngine: TankDataBase().EngineDataBase[0]))
    }
}
