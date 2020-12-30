//
//  ViewModel.swift
//  CRUDHomeWork
//
//  Created by User08 on 2020/11/19.
//

import SwiftUI

enum UseModeName{
    case TankMode,ArmamentMode,AmmunititonMode,EngineMode
}

class TankDataBase:ObservableObject{
    @AppStorage("Tank") var SaveTankData: Data?
    @AppStorage("Armament") var SaveArmamentData: Data?
    @AppStorage("Ammunition") var SaveAmmunitionData: Data?
    @AppStorage("Engine") var SaveEngineData: Data?
    
    @Published var TankDataBase = [TankData]() {
        didSet{
            let encoder = JSONEncoder()
            do{
                let data = try encoder.encode(TankDataBase)
                SaveTankData = data
            }
            catch {
                
            }
        }
    }
    @Published var ArmamentDataBase = [Armament]() {
        didSet{
            let encoder = JSONEncoder()
            do{
                let data = try encoder.encode(ArmamentDataBase)
                SaveArmamentData = data
            }
            catch {
                
            }
        }
    }
    @Published var AmmunitionDataBase = [Ammunition]() {
        didSet{
            let encoder = JSONEncoder()
            do{
                let data = try encoder.encode(AmmunitionDataBase)
                SaveAmmunitionData = data
            }
            catch {
                
            }
        }
    }
    @Published var EngineDataBase = [Engine]() {
        didSet{
            let encoder = JSONEncoder()
            do{
                let data = try encoder.encode(EngineDataBase)
                SaveEngineData = data
            }
            catch {
                
            }
        }
    }
    
    init(){
        if let SaveTankData = SaveTankData{
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([TankData].self, from: SaveTankData){
                TankDataBase = decodedData
            }
        }
        if let SaveArmamentData = SaveArmamentData{
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([Armament].self, from: SaveArmamentData){
                ArmamentDataBase = decodedData
            }
        }
        if let SaveAmmunitionData = SaveAmmunitionData{
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([Ammunition].self, from: SaveAmmunitionData){
                AmmunitionDataBase = decodedData
            }
        }
        if let SaveEngineData = SaveEngineData{
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([Engine].self, from: SaveEngineData){
                EngineDataBase = decodedData
            }
        }
        //LoadtestData()
    }
    
    func loadCountries(){
        /*AmmunitionDataBase = [Ammunition(AmmunitionName: "AP-50mm", AmmunitionMuzzleVelocity: 1000.0, AmmunitionProjectileMass: 5.0),Ammunition(AmmunitionName: "AP-20mm", AmmunitionMuzzleVelocity: 1500.0, AmmunitionProjectileMass: 0.01)]
        ArmamentDataBase = [Armament(ArmamentName: "Main_Cannon-50mm", ArmamentAmmunition: AmmunitionDataBase[0]),Armament(ArmamentName: "Machine_Gun-20mm", ArmamentAmmunition: AmmunitionDataBase[1])]
        EngineDataBase = [Engine(EngineName: "E1P1", HorsePower: 100.0)]
        TankDataBase = [TankData(TankName: "MainTank-Ex", TankMainArmament: ArmamentDataBase[0], TankSecondaryArmament: ArmamentDataBase[1], TankEngine: EngineDataBase[0])]*/
    }
    
    func LoadtestData(){
        AmmunitionDataBase = [Ammunition(Name: "AP-50mm", AmmunitionMuzzleVelocity: 1000.0, AmmunitionProjectileMass: 5.0),Ammunition(Name: "AP-20mm", AmmunitionMuzzleVelocity: 1500.0, AmmunitionProjectileMass: 0.01)]
        ArmamentDataBase = [Armament(Name: "Main_Cannon-50mm", ArmamentAmmunition: AmmunitionDataBase[0]),Armament(Name: "Machine_Gun-20mm", ArmamentAmmunition: AmmunitionDataBase[1])]
        EngineDataBase = [Engine(Name: "E1P1", HorsePower: 100.0)]
        TankDataBase = [TankData(Name: "MainTank-Ex", TankMainArmament: ArmamentDataBase[0], TankSecondaryArmament: ArmamentDataBase[1], TankEngine: EngineDataBase[0])]
    }
    
    func removeCountry(_ index: Int){
        self.TankDataBase.remove(at: index)
    }
    
    func TankDataRemove(_ inputObj:TankData){
        for loopInt in 0..<TankDataBase.count{
            if(TankDataBase[loopInt].id == inputObj.id){
                TankDataBase.remove(at: loopInt)
                break
            }
        }
    }
    
    func ArmamentDataRemove(_ inputObj:Armament){
        for loopInt in 0..<ArmamentDataBase.count{
            if(ArmamentDataBase[loopInt].id == inputObj.id){
                ArmamentDataBase.remove(at: loopInt)
                break
            }
        }
    }
    
    func AmmunitionDataRemove(_ inputObj:Ammunition){
        for loopInt in 0..<AmmunitionDataBase.count{
            if(AmmunitionDataBase[loopInt].id == inputObj.id){
                AmmunitionDataBase.remove(at: loopInt)
                break
            }
        }
    }
    
    func EngineDataRemove(_ inputObj:Engine){
        for loopInt in 0..<EngineDataBase.count{
            if(EngineDataBase[loopInt].id == inputObj.id){
                EngineDataBase.remove(at: loopInt)
                break
            }
        }
    }
    
    func DataTypeRatioChartValue()->[Double]{
        var returnDouble = [Double]()
        let sumDataLength = self.TankDataBase.endIndex + self.ArmamentDataBase.endIndex + self.AmmunitionDataBase.endIndex + self.EngineDataBase.endIndex
        
        returnDouble.insert(0, at: 0)
        returnDouble.insert(Double(self.TankDataBase.endIndex)/Double(sumDataLength), at: returnDouble.endIndex)
        returnDouble.insert(Double(self.ArmamentDataBase.endIndex)/Double(sumDataLength)+returnDouble[1], at: returnDouble.endIndex)
        returnDouble.insert(Double(self.AmmunitionDataBase.endIndex)/Double(sumDataLength)+returnDouble[2], at: returnDouble.endIndex)
        returnDouble.insert(100, at: returnDouble.endIndex)
        return returnDouble
    }
    
    func SumDataAmount()->Int{
        return self.TankDataBase.endIndex + self.ArmamentDataBase.endIndex + self.AmmunitionDataBase.endIndex + self.EngineDataBase.endIndex
    }
    
    func Percentage(inputValue:Double,MaxValue:Double)->Double{
        if inputValue < MaxValue {
            return inputValue/MaxValue*100.0
        }else {
            return MaxValue/inputValue*100.0
        }
    }
    
    func findMaxAmmunitionMuzzleVelocity()->Double{
        var returnDouble:Double = 0.0
        for inValue in 0..<AmmunitionDataBase.endIndex{
            if(returnDouble < AmmunitionDataBase[inValue].AmmunitionMuzzleVelocity){
                returnDouble = AmmunitionDataBase[inValue].AmmunitionMuzzleVelocity
            }
        }
        return returnDouble
    }
    
    func findMaxAmmunitionProjectileMass()->Double{
        var returnDouble:Double = 0.0
        for inValue in 0..<AmmunitionDataBase.endIndex{
            if(returnDouble < AmmunitionDataBase[inValue].AmmunitionProjectileMass){
                returnDouble = AmmunitionDataBase[inValue].AmmunitionProjectileMass
            }
        }
        return returnDouble
    }
    
    func findMaxEngineHorsePower()->Double{
        var returnDouble:Double = 0.0
        for inValue in 0..<EngineDataBase.endIndex{
            if(returnDouble < EngineDataBase[inValue].HorsePower){
                returnDouble = EngineDataBase[inValue].HorsePower
            }
        }
        return returnDouble
    }
    
    func AmmunitionMuzzleVelocityPercentage(_ inputValue:Double)->Double{
        if Percentage(inputValue: inputValue, MaxValue: findMaxAmmunitionMuzzleVelocity()) <= 0{
            return 100.0
        }else{
            return Percentage(inputValue: inputValue, MaxValue: findMaxAmmunitionMuzzleVelocity())
        }
            
    }
    
    func AmmunitionProjectileMassPercentage(_ inputValue:Double)->Double{
        if Percentage(inputValue: inputValue, MaxValue: findMaxAmmunitionProjectileMass()) <= 0{
            return 100.0
        }else{
            return Percentage(inputValue: inputValue, MaxValue: findMaxAmmunitionProjectileMass())
        }
    }
    
    func EngineHorsePowerPercentage(_ inputValue:Double)->Double{
        if Percentage(inputValue: inputValue, MaxValue: findMaxEngineHorsePower()) <= 0{
            return 100.0
        }else{
            return Percentage(inputValue: inputValue, MaxValue: findMaxEngineHorsePower())
        }
    }
}
