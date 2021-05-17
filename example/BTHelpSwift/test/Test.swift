//
//  Test.swift
//  BTHelpSwift
//
//  Created by apple on 2021/4/30.
//

import UIKit

//MARK:可选的delegate回调写法
@objc protocol LiveHelpDelegate : NSObjectProtocol {
    
    @objc optional func liveConnectResult(str : String) -> Void
    
    
}


//MARK:方法传递引用类型参数
func autoAddGroup(_ groupArray : inout Array<String>) -> Void {
    groupArray.append("test")
}

//调用
func testAutoAddGroup() -> Void {
    var array = Array<String>.init()
    autoAddGroup(&array)
}
