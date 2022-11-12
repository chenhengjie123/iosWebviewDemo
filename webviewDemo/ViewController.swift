//
//  ViewController.swift
//  webviewDemo
//
//  Created by chenhengjie on 2022/11/12.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let uiWebViewBtn = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 50))
        uiWebViewBtn.setTitle("UIWebView", for: .normal)
        uiWebViewBtn.backgroundColor = .red
        uiWebViewBtn.addTarget(self, action: #selector(uiWebViewBtnOnClick), for: .touchUpInside)
        self.view.addSubview(uiWebViewBtn)
        
        
        let wkWebviewBtn = UIButton(frame: CGRect(x: 100, y: 500, width: 200, height: 50))
        wkWebviewBtn.setTitle("WKWebView", for: .normal)
        wkWebviewBtn.backgroundColor = .blue
        wkWebviewBtn.addTarget(self, action: #selector(wkWebViewBtnOnClick), for: .touchUpInside)
        self.view.addSubview(wkWebviewBtn)
    }
    
    @objc func uiWebViewBtnOnClick(sender:UIButton!) {
        print("UIWebViewBtnOnClick")
        
        let uiWebView = UIWebView()
        uiWebView.frame = CGRect(x: 200, y: 100, width: 100, height: 100)
        
        let url = URL(string: "https://testerhome.com/topics/34815")
        uiWebView.loadRequest(URLRequest(url: url!))
        
        self.view.addSubview(uiWebView)
    }
    
    @objc func wkWebViewBtnOnClick(sender:UIButton!) {
        print("WKWebViewBtnOnClick")
        
        let wkWebView = WKWebView()
        wkWebView.frame = CGRect(x: 200, y: 500, width: 100, height: 100)
        
        let url = URL(string: "https://testerhome.com/topics/34815")
        wkWebView.load(URLRequest(url: url!))
        
        self.view.addSubview(wkWebView)
    }


}

