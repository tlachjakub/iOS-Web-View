//
//  ViewController.swift
//  iOS-Web-View
//
//  Created by Jakub Tlach on 2/22/18.
//  Copyright © 2018 Jakub Tlach. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UIWebViewDelegate {


	@IBOutlet weak var webView: WKWebView!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.navigationController?.isNavigationBarHidden = true
		
		webView.allowsBackForwardNavigationGestures = true
		
		
		// Adding webView content
		do {
			guard let filePath = Bundle.main.path(forResource: "http/index", ofType: "htm")
				else {
					// File Error
					print ("File reading error")
					return
			}
			
			let contents =  try String(contentsOfFile: filePath, encoding: .utf8)
			let baseUrl = URL(fileURLWithPath: filePath)
			webView.loadHTMLString(contents as String, baseURL: baseUrl)
		}
		catch {
			print ("File HTML error")
		}
	}
	
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		// Hide the navigation bar on the this view controller
		self.navigationController?.setNavigationBarHidden(true, animated: animated)
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

