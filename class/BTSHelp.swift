//
//  BTSHelp.swift
//  BTHelpSwift
//
//  Created by apple on 2021/4/27.
//

import UIKit
import BTHelp
import BTWidgetView

public func bt_rgb(_ r : CGFloat,_ g : CGFloat,_ b : CGFloat)->UIColor{
    return UIColor.bt_R(r, g: g, b: b)
}

public func bt_rgba(_ r : CGFloat,_ g : CGFloat,_ b : CGFloat, _ a : CGFloat)->UIColor{
    return UIColor.bt_R(r, g: g, b: b, a: a)
}

public func bt_rgb(_ rgb : CGFloat) ->UIColor{
    return UIColor.bt_RGBSame(rgb)
}

public func bt_rgba(_ rgb : CGFloat,_ a : CGFloat)->UIColor{
    return UIColor.bt_RGBASame(rgb, a: a)
}

///16进制颜色转换
public func bt_color(str : String) ->UIColor{
    return UIColor.bt_color(withHexString: str)
}

public func bt_autoFont(_ fontSize : CGFloat,_ weight : UIFont.Weight)->UIFont{
    return UIFont.btAutoFont(withSize: fontSize, weight: weight)
}

public func bt_autoFont(_ fontSize : CGFloat)->UIFont{
    return UIFont.btAutoFont(withSize: fontSize, weight: .regular)
}



//MARK: 通知
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
    
    
    //根据NSDate获取每月的天数
    public static func getMonthDay(_ date : NSDate) ->Int{
        let calender = NSCalendar.init(calendarIdentifier: .gregorian)
        let range = calender?.range(of: .day, in: .month, for: date as Date)
        return range?.length ?? 0
    }
    
}
