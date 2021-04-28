//
//  BTSHelp.swift
//  BTHelpSwift
//
//  Created by apple on 2021/4/27.
//

import UIKit


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

class BTSHelp: NSObject {
    
    //打印字典字符串
    public static func printJsonStr(_ obj : Any){
        printJsonStr(obj,nil)
    }
    
    public static func printJsonStr(_ obj : Any, _ tag : String?){
        printJsonStr(obj, tag, nil)
    }
    
    
    public static func printJsonStr(_ obj : Any, _ tag : String?,_ extra : String?){
        let data = try? JSONSerialization.data(withJSONObject: obj, options: []) as NSData?
        if data == nil {
            log("printJsonStr 传入参数转换数据错误", nil)
            return
        }
        let JSONString = NSString(data:data! as Data,encoding: String.Encoding.utf8.rawValue)
        if extra != nil {
            log(extra! + "--" + String(describing: JSONString), tag)
        }else{
            log(String(describing: JSONString), tag)
        }
        
    }
    
    //输出标记Log
    public static func log(_ contentStr : String?, _ tag : String?){
        if contentStr == nil {
            return
        }
        
        if tag == nil {
            print("BTTAG:" + contentStr!)
            return
        }
        
        print(tag! + ":" + contentStr!)
        
        
    }
    
    public static func log(_ content : String?){
        log(content, nil)
    }
    
}
