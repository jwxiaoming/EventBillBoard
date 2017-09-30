//
//  shanju.swift
//  EventBillBoard
//
//  Created by 狗儿心 on 2017/9/17.
//  Copyright © 2017年 狗儿心. All rights reserved.
//

import UIKit

class shanju: UIViewController,UIWebViewDelegate {
    
    lazy var backBtn:UIBarButtonItem = {
        let backBtn = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(goBack))
        return backBtn
    }()

    @IBOutlet weak var webview: UIWebView!
    @IBOutlet weak var jiazai: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        webview.scrollView.showsVerticalScrollIndicator = false
        let url = URL(string : "https://mp.weixin.qq.com/mp/homepage?__biz=MzA3NTYyMDYwMg==&hid=1&sn=b43b5bac37b6895e54c8cfe9bb083819");
        let request = URLRequest(url: url!)
        webview.loadRequest(request)
        
    }
    
    @objc func goBack() {
        webview.goBack()
    }
    
}

extension shanju {
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        jiazai.isHidden = true
        let url = webview.request!.url!.absoluteString
        print(url)
        if url != "https://mp.weixin.qq.com/mp/homepage?__biz=MzA3NTYyMDYwMg==&hid=1&sn=b43b5bac37b6895e54c8cfe9bb083819" {
            self.navigationItem.leftBarButtonItem = backBtn
        } else {
            self.navigationItem.leftBarButtonItem = nil
        }
    }
    
}
