//
//  transationItems.swift
//  moneyManager
//
//  Created by John Linnehan on 12/6/21.
//

import Foundation
import UserNotifications

class transactionItems {
    var transactionsArray: [transactionItem] = []
    
    func saveData() {
        let directoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let documentURL = directoryURL.appendingPathComponent("todos").appendingPathExtension("json")
        
        let jsonEncoder = JSONEncoder()
        let data = try? jsonEncoder.encode(transactionsArray)
        do {
            try data?.write(to: documentURL, options: .noFileProtection)
        } catch {
            print("Could not save data")
        }
        //setNotifications()
    }
    
    
//    func loadData(completed: @escaping ()->()) {
//            let directoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//            let documentURL = directoryURL.appendingPathComponent("todos").appendingPathExtension("json")
//    
//            guard let data = try? Data(contentsOf: documentURL) else {return}
//            let jsonDecoder = JSONDecoder()
//            do {
//                transactionsArray = try jsonDecoder.decode(Array<ToDoItem>.self, from: data)
//            } catch {
//                print("Could not load data")
//            }
//            //completed()
//    }
    
}
