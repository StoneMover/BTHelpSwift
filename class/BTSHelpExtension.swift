//
//  BTSHelp.swift
//  BTHelpSwift
//
//  Created by apple on 2021/4/26.
//

import Foundation
import UIKit

//MARK: 数组
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

extension UILabel{
    
    static func bt_init(color : UIColor?,font : UIFont?,text : String?) -> UILabel{
        let label = UILabel.init()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = font
        label.textColor = color
        label.text = text
        return label
    }
    
    static func bt_init(color : UIColor?,font : UIFont?) -> UILabel{
        return bt_init(color: color, font: font, text: nil)
    }
    
}

extension UIButton{
    
    static func bt_init(color : UIColor?,font : UIFont?,text : String?,img : UIImage?)->UIButton{
        let btn = UIButton.init()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitleColor(color, for: .normal)
        btn.setTitle(text, for: .normal)
        btn.titleLabel?.font = font
        btn.setImage(img, for: .normal)
        return btn
    }
    
    static func bt_init(color : UIColor?,font : UIFont?,text : String?)->UIButton{
        return bt_init(color: color, font: font, text: text, img: nil)
    }
    
    static func bt_init(color : UIColor?,font : UIFont?)->UIButton{
        return bt_init(color: color, font: font, text: nil, img: nil)
    }
    
    static func bt_init(color : UIColor?,font : UIFont?,img : UIImage?)->UIButton{
        return bt_init(color: color, font: font, text: nil, img: img)
    }
    
    static func bt_init(img : UIImage?)->UIButton{
        return bt_init(color: nil, font: nil, text: nil, img: img)
    }
    
    func bt_set(color : UIColor?,font : UIFont?,text : String?){
        setTitleColor(color, for: .normal)
        setTitle(text, for: .normal)
        titleLabel?.font = font
    }
    
}


/**
 
 字符串的操作:https://www.jianshu.com/p/dcf6b52aa420
 
 */
extension String{
    
    
    /// 字符串中是否包含中文
    func bt_isIncludeChinese() -> Bool {
        for ch in self.unicodeScalars {
            // 中文字符范围：0x4e00 ~ 0x9fff
            if (0x4e00 < ch.value  && ch.value < 0x9fff) {
                return true
            }
        }
        
        return false
    }
    
    
    /// 汉字转拼音
    /// - Returns: 转换后结果
    func bt_transformToPinyin() -> String {
        
        let stringRef = NSMutableString(string: self) as CFMutableString
        // 转换为带音标的拼音
        CFStringTransform(stringRef,nil, kCFStringTransformToLatin, false)
        // 去掉音标
        CFStringTransform(stringRef, nil, kCFStringTransformStripCombiningMarks, false)
        let pinyin = stringRef as String
        return pinyin
    }
    
    
    /// 替换指定位置字符串,注意这里替换的是原来对象的数据
    /// - Parameters:
    ///   - startIndex: 开始位置
    ///   - endIndex: 结束位置
    ///   - replaceStr: 需要替换的字符串，可以与开始结束的长度不同
    /// - Returns: 无
    mutating func bt_replaceString(startIndex : Int, endIndex : Int, replaceStr : String) -> Void{
        let startIndexs = self.index(self.startIndex, offsetBy:startIndex)
        let endIndexs = self.index(self.startIndex, offsetBy:endIndex)
        let ranges = startIndexs...endIndexs
        replaceSubrange(ranges, with:replaceStr)
        
    }
    
    
    /// 替换指定字符串
    /// - Parameters:
    ///   - replaceStr: 需要被替换的字符串
    ///   - resultStr: 需要被显示的字符串
    /// - Returns: 替换后的结果
    func bt_replaceString(replaceStr : String, resultStr : String) ->String{
        
        return replacingOccurrences(of: replaceStr, with: resultStr)
    }
    
    
    /// 从字符串头部开始截取
    /// - Parameter length: 截取长度
    /// - Returns: 截取后结果
    func bt_subStart(length : Int)-> String{
        let result = prefix(length)
        return String(result)
    }
    
    
    /// 从字符串尾部开始截取
    /// - Parameter length: 截取长度
    /// - Returns: 截取后结果
    func bt_subEnd(length : Int)-> String{
        let result = suffix(length)
        return String(result)
    }
    
    
    /// 截取字符串按范围截取
    /// - Parameters:
    ///   - startIndex: 开始位置
    ///   - endIndex: 结束位置
    /// - Returns: 截取后结果
    func bt_subRang(startIndex : Int, endIndex : Int)-> String{
        let startIndexs = self.index(self.startIndex, offsetBy:startIndex)
        let endIndexs = self.index(self.startIndex, offsetBy:endIndex)
        let ranges = startIndexs...endIndexs
        let result = self[ranges]
        return String(result)
    }
    
}




