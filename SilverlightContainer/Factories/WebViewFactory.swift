//
//  WebViewFactory.swift
//  SilverlightContainer
//
//  Created by Paolo Carollo on 10/11/2018.
//  Copyright © 2018 Paolo Carollo. All rights reserved.
//

import Foundation
import WebKit

class WebViewFactory {
    
    class func createWebView(in frame: CGRect) -> WKWebView {
        
        return WKWebView(frame: frame, configuration: WebViewConfiguration.sharedInstance.configuration)
        
    }
    
}

//  Using the singleton we can share the configuration through all the WKWebViews we create
//  Let's see if this works
class WebViewConfiguration {
    
    static let sharedInstance = WebViewConfiguration()
    
    var configuration: WKWebViewConfiguration
    
    init() {
        
        configuration = WKWebViewConfiguration()
        configuration.processPool = WKProcessPool()
        configuration.websiteDataStore = WKWebsiteDataStore.default()
        
    }
    
}
