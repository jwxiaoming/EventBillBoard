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
        //获取标题
        let title = webView.stringByEvaluatingJavaScript(from: "document.title") ?? "" as String
        print("title:\(title)")
        
        webView = UIWebView(frame: self.view.bounds)
        webView.scrollView.showsVerticalScrollIndicator = false
        webView.autoresizingMask = [.flexibleHeight]
        webView.backgroundColor = UIColor.white
        self.view .addSubview(webView)
        if myurl == nil {
            myurl = NSURL(string: "http://qbz.liruoming.xin")! as URL
        }
        let request = URLRequest(url : myurl!)
        
        self.webView.loadRequest(request)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        webView.delegate = self
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        let url = request.url?.absoluteString
        
        if request.url! != myurl && (url?.contains("mp.weixin.qq.com"))! || request.url! != myurl && (url?.contains("whd"))! || request.url! != myurl && (url?.contains("kdy"))! || request.url! != myurl && (url?.contains("syc"))! || request.url! != myurl && (url?.contains("lbm"))! {
            
            let vc = shouye()
            vc.myurl = request.url
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            
            return false
        }
        
        
        
        return true
    }
    
    
}
