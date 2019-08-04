//
//  commonConfig.swift
//  selfTestObj
//
//  Created by dongouc on 2019/8/4.
//  Copyright © 2019 dongouc. All rights reserved.
//

import Foundation


/// 单向链表的节点
public class ListNode {
    var value:Int
    var next:ListNode?
    init(_ value:Int, _ next:ListNode?) {
        self.value = value
        self.next = next
    }
}

/// 链表值打印
///
/// - Parameter list: 头部节点
public func listNodeValuePrint(_ list:ListNode?) {
    var next = list
    var valueStr:String = String()
    while next != nil {
        valueStr.append(contentsOf: "\(next!.value)")
        next = next!.next
        valueStr.append(contentsOf: "->")
    }
    valueStr.append(contentsOf: "nil")
    debugPrint(valueStr)
}
