import UIKit

class shenghuojia: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var jiazai: UIActivityIndicatorView!
    var myurl: URL?
    
    var webview = UIWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webview = UIWebView(frame: self.view.bounds)
        webview.scrollView.showsVerticalScrollIndicator = false
        webview.autoresizingMask = [.flexibleHeight]
        webview.backgroundColor = UIColor.white
        self.view .addSubview(webview)
        if myurl == nil {
            myurl = NSURL(string: "http://mp.weixin.qq.com/mp/homepage?__biz=MzA3NTYyMDYwMg==&hid=5&sn=accdb433e0896376e640d0ddd7265731")! as URL
        }
        let request = URLRequest(url : myurl!)
        
        self.webview.loadRequest(request)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        webview.delegate = self
    }
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        let url = request.url?.absoluteString
        
        if url == "http://mp.weixin.qq.com/mp/homepage?__biz=MzA3NTYyMDYwMg==&hid=5&sn=accdb433e0896376e640d0ddd7265731" || url == "https://mp.weixin.qq.com/mp/homepage?__biz=MzA3NTYyMDYwMg==&hid=5&sn=accdb433e0896376e640d0ddd7265731" {
            return true
        }
        else {
            if request.url! != myurl && (url?.contains("mp.weixin.qq.com"))! {
                
                let vc = shenghuojia()
                vc.myurl = request.url
                vc.hidesBottomBarWhenPushed = true
                navigationController?.pushViewController(vc, animated: true)
                
                return false
            }
        }
        
        
        
        return true
    }
}

