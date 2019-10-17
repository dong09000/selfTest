//
//  ViewController.swift
//  selfTestObj
//
//  Created by dongouc on 2019/8/4.
//  Copyright © 2019 dongouc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        test001()
    }
    

}

extension ViewController {
    
    /// 单链表翻转实验
    func test001() {
        let testListNode = ListNode(1, ListNode(2, ListNode(3, nil)))
        
        listNodeValuePrint(testListNode)
        debugPrint("============")
        listNodeValuePrint(reverseList01(testListNode)!)
        debugPrint("============")
        
        let testListNode2 = ListNode(1, ListNode(2, ListNode(3, nil)))
        listNodeValuePrint(testListNode2)
        debugPrint("============")
        listNodeValuePrint(reverseList02(testListNode2)!)
    }
}
