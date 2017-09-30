//
//  shenghuojia.swift
//  EventBillBoard
//
//  Created by 狗儿心 on 2017/9/17.
//  Copyright © 2017年 狗儿心. All rights reserved.
//

import UIKit

class shenghuojia: UIViewController,UIWebViewDelegate {
    
    lazy var backBtn:UIBarButtonItem = {
        let backBtn = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(goBack))
        return backBtn
    }()


    @IBOutlet weak var webview: UIWebView!
    @IBOutlet weak var jiazai: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        webview.scrollView.showsVerticalScrollIndicator = false
        let url = URL(string : "https://mp.weixin.qq.com/mp/homepage?__biz=MzA3NTYyMDYwMg==&hid=2&sn=7653cff66a6651318143b7816429662e");
        let request = URLRequest(url: url!)
        webview.loadRequest(request)
        
    }
    
    @objc func goBack() {
        webview.goBack()
    }
    
}

extension shenghuojia {
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        jiazai.isHidden = true
        let url = webview.request!.url!.absoluteString
        print(url)
        if url != "https://mp.weixin.qq.com/mp/homepage?__biz=MzA3NTYyMDYwMg==&hid=2&sn=7653cff66a6651318143b7816429662e" {
            self.navigationItem.leftBarButtonItem = backBtn
        } else {
            self.navigationItem.leftBarButtonItem = nil
        }
    }
    
}
