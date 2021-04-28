//
//  BTSHelp.swift
//  BTHelpSwift
//
//  Created by apple on 2021/4/26.
//

import Foundation

//MARK:数组
extension Array where Element: Equatable {
 
    mutating func bt_remove(_ object : Element) {
        if let index = firstIndex(of: object) {
            remove(at: index)
        }
    }
    
    mutating func bt_remove(_ objects : Array<Element>) {
        for object in objects {
            if let index = firstIndex(of: object) {
                remove(at: index)
            }
        }
    }
    
    
    func bt_forEach(_ body: (_ item : Element,_ index : Int) -> Void){
        var index = 0
        for item in self {
            body(item,index)
            index = index + 1
        }
    }


}






