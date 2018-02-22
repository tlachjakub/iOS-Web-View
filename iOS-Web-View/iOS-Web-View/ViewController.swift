//
//  ViewController.swift
//  iOS-Web-View
//
//  Created by Jakub Tlach on 2/22/18.
//  Copyright © 2018 Jakub Tlach. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		let myWebView:UIWebView = UIWebView(frame: CGRect(x: 0, y: 20, width: self.view.frame.width, height: self.view.frame.height))
		myWebView.delegate = self
		self.view.addSubview(myWebView)
		let url = URL (string: "https://r-up.jp/en/company/");
		let request = URLRequest(url: url! as URL);
		myWebView.loadRequest(request);
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	func webViewDidStartLoad(_ webView: UIWebView) {
		print("web view start loading")
	}
	
	func webViewDidFinishLoad(_ webView: UIWebView) {
		print("web view load completely")
	}
	
	func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
		print("web view loading fail : ",error.localizedDescription)
	}

}

