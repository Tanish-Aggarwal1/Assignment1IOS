//
//  WebViewController.swift
//  Assignmment1App
//
//  Created by Tanish Aggarwal on 2026-06-08.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Check device type (Week 4, Slide 13-14)
        if UIDevice.current.userInterfaceIdiom == .phone {
            myWebView.isHidden = true
        } else {
            // Load on iPad
            if let url = URL(string: "https://www.apple.com") {
                myWebView.load(URLRequest(url: url))
            }
        }
    }
    
    // Show spinner when loading starts (Week 4, Slide 33)
        func webView(_ webView: WKWebView,
                     didStartProvisionalNavigation navigation: WKNavigation!) {
            activity.isHidden = false
            activity.startAnimating()
        }

        // Hide spinner when loading finishes (Week 4, Slide 34)
        func webView(_ webView: WKWebView,
                     didFinish navigation: WKNavigation!) {
            activity.isHidden = true
            activity.stopAnimating()
        }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
