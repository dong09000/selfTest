//
//  ViewController.swift
//  20191010-001
//
//  Created by dongouc on 2019/10/10.
//  Copyright © 2019 dongouc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor.red
        
        let btn = UIButton()
        btn.backgroundColor = UIColor.white
        btn.frame = CGRect(x: 100, y: 100, width: 100, height: 30)
        btn.setTitle("tapToFlutter", for: .normal)
        btn.setTitleColor(UIColor.blue, for: .normal)
        btn.addTarget(self, action: #selector(_tapToFlutter(_:)), for: .touchUpInside)
        view.addSubview(btn)
    }


    @objc func _tapToFlutter(_ :UIButton) {
        //
        let vc = WebViewController()
        vc.modalPresentationStyle = .formSheet
        self.present(vc, animated: true, completion: nil)
        
    }
}

