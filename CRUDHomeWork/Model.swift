//
//  Model.swift
//  CRUDHomeWork
//
//  Created by User08 on 2020/11/19.
//

import SwiftUI

protocol MainAttributes:Identifiable,Codable{
    var id: UUID { get set }
    var Name: String { get set }
}

struct TankData:MainAttributes{
    var id: UUID = UUID()
    var Name: String
    //var TankName:String
    var TankMainArmament:Armament
    var TankSecondaryArmament:Armament
    var TankEngine:Engine
    
    
    enum CodingKeys:String, CodingKey{
        case id
        case Name = "TankName"
        case TankMainArmament
        case TankSecondaryArmament
        case TankEngine
    }
}

struct Armament:MainAttributes{
    var id: UUID = UUID()
    var Name: String
    //var ArmamentName:String
    var ArmamentAmmunition:Ammunition
    
    
    enum CodingKeys:String, CodingKey{
        case id
        case Name = "ArmamentName"
        case ArmamentAmmunition
    }
    
}

struct Ammunition:MainAttributes{
    var id: UUID = UUID()
    var Name: String
    //var AmmunitionName:String
    var AmmunitionMuzzleVelocity:Double
    var AmmunitionProjectileMass:Double
    
    enum CodingKeys:String, CodingKey{
        case id
        case Name = "AmmunitionName"
        case AmmunitionMuzzleVelocity
        case AmmunitionProjectileMass
    }
}

struct Engine:MainAttributes{
    var id: UUID = UUID()
    var Name: String
    //var EngineName:String
    var HorsePower:Double
    
    enum CodingKeys:String, CodingKey{
        case id
        case Name = "EngineName"
        case HorsePower
    }
}

class PresetData:MainAttributes{
    var id:UUID = UUID()
    var Name = "No"
    var PresetTank:TankData
    var PresetArmament:Armament
    var PresetAmmunition:Ammunition
    var PresetEngine:Engine
    
    init(){
        self.PresetAmmunition = Ammunition(Name: "Preset Ammunition",AmmunitionMuzzleVelocity:0.0,AmmunitionProjectileMass:0.0)
        self.PresetArmament = Armament(Name: "Preset Armament",ArmamentAmmunition: PresetAmmunition)
        self.PresetEngine = Engine(Name: "Preset Engine",HorsePower:1500.0)
        self.PresetTank = TankData(Name: "Preset Main Tank", TankMainArmament: self.PresetArmament, TankSecondaryArmament: self.PresetArmament, TankEngine: self.PresetEngine)
    }
}
