//
//  Core.swift
//  swiftbook-olimp-project
//
//  Created by Калугин on 11.11.17.
//  Copyright © 2017 Gleb Kalachev. All rights reserved.
//

import Foundation
import UIKit


//Ключи для извлечения информации из UserDefaults. Отсутствие такой структуры-енума - есть бэд практис

struct DataKeys {
    static let records = "records"
}

struct Record {
    let value: Int
    let name: String
}

class DataManager {
    
    //Так как принял решение об одном глобальном dataManager'e, то shared нужен только для его инициализации
    
    var records: [Record] {
        return UserDefaults.standard.value(forKey: DataKeys.records)! as! [Record]
    }
    
    static var shared = DataManager.init()
    
    private init() {
        
        
        if UserDefaults.standard.value(forKey: DataKeys.records) as? [Record] == nil {
            UserDefaults.standard.set(Array<Record>(), forKey: DataKeys.records)
        }    
        
    }
    
    
    //Функция определяет, является ли набранный счет рекордным
    func isRecord(_ value: Int) -> Bool {
        
        
        
        
        return true 
    }
    
    
    //Функция, автоматически вставляющая рекорд на надлежащее место
    func setRecord(_ recordValue: Int) {
        
    }
    
    
    
}
