//
//  20190804test.swift
//  selfTestObj
//
//  Created by dongouc on 2019/8/4.
//  Copyright © 2019 dongouc. All rights reserved.
//  单链表翻转练习

import Foundation


/// 单向链表翻转01（头插法）
///
/// - Parameter head: 头节点
/// - Returns: 翻转后的链表
func reverseList01(_ head:ListNode?) -> ListNode? {
    // 记录头部节点
    var p = head
    // 新链表
    var newHead:ListNode? = nil
    // 直到p变空结束
    while p != nil {
        // 取出下个节点
        let temp = p?.next
        // p的下一个变成 newHead
        p?.next = newHead
        // 新链表以p为开头
        newHead = p
        // p变成了下个节点
        p = temp
    }
    
    /**
     输入
     1->2->3->nil
     while中第一轮
     temp = 2
     1->nil
     2->3->nil，
     newHead = 1->nil
     p = 2->3->nil
     第二轮
     temp = 3
     2->1->nil
     newHead = 2->1->nil
     p = 3->nil
     第三轮
     temp = nil
     3->2->1->nil
     newHead = 3->2->1->nil
     p = nil
     结束
     */
    return newHead
}

func reverseList02(_ head:ListNode?) -> ListNode? {
    if head == nil || head?.next == nil {
        return head
    }
    
    let temp = head?.next
    let newHead:ListNode? = reverseList02(temp)
    
    temp?.next = head
    head?.next = nil
    /** 分析
     输入
     1->2->3->nil
     
     temp = 2->3->nil
    递归1 newHead =
     temp = 3->nil
     递归2 newHead = 3->nil
     3->2
     2->nil
     
     此时递归1 newHead = 3->2->nil
     2->1
     1->nil
     */
    
    return newHead
}
