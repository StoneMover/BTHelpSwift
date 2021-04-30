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
