//
//  WebViewController.swift
//  20191010-001
//
//  Created by dongouc on 2019/10/11.
//  Copyright © 2019 dongouc. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.green
        // Do any additional setup after loading the view.
        let webView = WKWebView(frame: view.bounds)
        view.addSubview(webView)
//        let req = URLRequest(url: URL(string: "https://m.jd.com")!)
//        webView.load(req)
        webView.loadHTMLString("<div style='text-align:center;height:300px;line-height:300px;color:#333;font-size:48px;'>当前无网络<div>", baseURL: nil)
    }
   
}
