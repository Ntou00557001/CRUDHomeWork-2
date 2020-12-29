//
//  PromptClass.swift
//  CRUDHomeWork
//
//  Created by User15 on 2020/12/17.
//

import SwiftUI

class prompt1:UIAlertController{
    func deleteSomething() {
            // ...
    }
    func presentDeletionAlert(DataBase:TankDataBase,NewEditData:Ammunition) {
        let prompt = UIAlertController(title: "Prompt", message: "The value entered is not a number", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default){(_) in
            AmmunitionEditView(DataBase: DataBase, NewEditData: NewEditData)
        }
        prompt.addAction(okAction)
        self.present(prompt, animated: true, completion: nil)
    }

}
