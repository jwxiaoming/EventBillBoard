import UIKit

class shanju: UIViewController, UIWebViewDelegate {
    
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
            myurl = NSURL(string: "https://mp.weixin.qq.com/mp/homepage?__biz=MzA3NTYyMDYwMg==&hid=1&sn=b43b5bac37b6895e54c8cfe9bb083819")! as URL
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
        
        if request.url! != myurl && (url?.contains("mp.weixin.qq.com"))! || request.url! != myurl && (url?.contains("oss.site2e"))! {
            
            let vc = shanju()
            vc.myurl = request.url
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            
            return false
        }
        
        return true
    }
}



