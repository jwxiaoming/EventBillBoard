//
//  shouye.swift
//  EventBillBoard
//
//  Created by 狗儿心 on 2017/9/17.
//  Copyright © 2017年 狗儿心. All rights reserved.
//

import UIKit

class shouye: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var jiazai: UIActivityIndicatorView!
    var myurl: URL?
    
    var webView = UIWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        webView = UIWebView(frame: self.view.bounds)
        webView.scrollView.showsVerticalScrollIndicator = false
        webView.autoresizingMask = [.flexibleHeight]
        webView.backgroundColor = UIColor.white
        self.view .addSubview(webView)
        if myurl == nil {
            myurl = NSURL(string: "http://oss.site2e.cn/qbzshouye/index.html")! as URL
        }
        let request = URLRequest(url : myurl!)
        
        self.webView.loadRequest(request)
        webView.delegate = self
    }
    
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        if request.url! != myurl {
            
            let vc = shouye()
            vc.myurl = request.url
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            
            return false
        }
        
        
        
        return true
    }
    
    
}
