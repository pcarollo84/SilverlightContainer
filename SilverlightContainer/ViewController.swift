//
//  ViewController.swift
//  SilverlightContainer
//
//  Created by Paolo Carollo on 10/11/2018.
//  Copyright © 2018 Paolo Carollo. All rights reserved.
//

import Cocoa
import WebKit

class ViewController: NSViewController, WKUIDelegate {

    private var webView1: WKWebView?
    private var webView2: WKWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView1 = WebViewFactory.createWebView(in: CGRect(x: 20, y: 20, width: 700, height: 400))
        if let webView1 = webView1 {
            self.view.addSubview(webView1)
        }
        
        webView2 = WebViewFactory.createWebView(in: CGRect(x: 750, y: 20, width: 600, height: 400))
        if let webView2 = webView2 {
            self.view.addSubview(webView2)
        }

    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    
    @IBAction func handleLoadGoogleButton(_ sender: Any) {
        
        guard let webView = webView1 else {
            return
        }
        
        loadGoogle(in: webView)
        
    }
    
    @IBAction func handleOpenGmailButton(_ sender: Any) {
        
        guard let webView = webView2 else {
            return
        }
        
        loadGoogle(in: webView)
        
    }
    
    func loadGoogle(in webView: WKWebView) {
        
        guard let url = URL(string: "https://www.google.com") else {
            print("url is not valid")
            return
        }

        loadRequest(in: webView, for: url)

    }
    
    func loadGmail(in webView: WKWebView) {
        
        guard let url = URL(string: "https://mail.google.com/mail/u/0/#inbox") else {
            print("url is not valid")
            return
        }
        
        loadRequest(in: webView, for: url)

    }
    
    func loadRequest(in webView: WKWebView, for url: URL) {
        
        let request = URLRequest(url: url)
        webView.load(request)
        
    }
    
}

