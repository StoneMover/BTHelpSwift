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

}

//MARK:通知
public func bt_addNotification(_ observer: Any, _ selector: Selector, _ name: String, _ object: Any?)->Void{
    NotificationCenter.default.addObserver(observer, selector: selector, name: Notification.Name(name), object: object)
}

public func bt_addNotification(_ observer: Any, _ selector: Selector, _ name: String)->Void{
    bt_addNotification(observer, selector, name, nil)
}

public func bt_postNotification(_ name : String) ->Void{
    NotificationCenter.default.post(Notification.init(name: Notification.Name(name)))
}

public func bt_postNotification(_ name : String,_ object : Any?, _ userInfo : [AnyHashable : Any]? = nil) ->Void{
    NotificationCenter.default.post(name: NSNotification.Name(name), object: object, userInfo: userInfo)
}

public func bt_removeNotification(_ observer : Any){
    NotificationCenter.default.removeObserver(observer)
    
}

public func bt_removeNotification(_ observer : Any, name : String, object : Any?){
    NotificationCenter.default.removeObserver(observer, name: NSNotification.Name(name), object: object)
}




