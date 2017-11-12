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
    static let numberOfBlinks = "numberOfBlinks"
    static let blinkDuration = "blinkDuration"
    static let settings = "settings"
}

struct Record: Comparable {
    static func <(lhs: Record, rhs: Record) -> Bool {
        return lhs.value < rhs.value
    }
    
    static func ==(lhs: Record, rhs: Record) -> Bool {
        return lhs.value == lhs.value
    }
    
    let value: Int
    let name: String
    
}


struct Settings {
    var numberOfBlinks: Int
    var blinkDuration: TimeInterval
    
    init(withNumberOfBlinks numberOfBlinks: Int, blinkDuration: TimeInterval) {
        self.numberOfBlinks = numberOfBlinks
        self.blinkDuration = blinkDuration
    }
    
}

class DataManager {
    
    
    
    //Так как принял решение об одном глобальном dataManager'e, то shared нужен только для его инициализации
    
    var records: [Record] {
        get {
            return UserDefaults.standard.value(forKey: DataKeys.records)! as! [Record]
        }
        set {
            UserDefaults.standard.set(newValue, forKey: DataKeys.records)
        }
    }
    
    //Будет пока загружаться дефолт во viewDidLoad
    var settings: Settings!
    
    static var shared = DataManager.init()
    
    private let maxRecordsCount = 10
    
    private init() {
        
        //Установка стандарных настроек
//        print("asdf ", defaultSettings.numberOfBlinks)
        self.settings = Settings.init(withNumberOfBlinks: 6, blinkDuration: 0.2)
        
        if UserDefaults.standard.value(forKey: DataKeys.records) as? [Record] == nil {
            UserDefaults.standard.set(defaultRecords, forKey: DataKeys.records)
        } 
        
        print("records in init: \(UserDefaults.standard.value(forKey: DataKeys.records))")
        
    }
    
    //Функция, автоматически вставляющая рекорд на надлежащее место
    func setRecord(_ recordValue: Int) {
        
        let newRecord = Record(value: recordValue, name: "test")
        var records = self.records
        records.append(newRecord)
        
        records = records.sorted { (current, next) -> Bool in
            return current.value > next.value
        }
        
        
        
        UserDefaults.standard.set(records, forKey: DataKeys.records)
        
    }
    
    //Функция определяет, является ли набранный счет рекордным
    func saveIfIsRecord(newResult: Record) -> Bool {
        
        for i in 1..<20 {
            if self.records[20 - i].value < newResult.value {
                
                
                
                records[19] = newResult
                records.removeLast()
                records.sort(by: > )
            }
        }
        
        return true
    }
    
}
