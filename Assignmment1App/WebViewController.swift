//
//  WebViewController.swift
//  Assignmment1App
//
//  Created by Tanish Aggarwal on 2026-06-08.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {

    var myWebView: WKWebView!
        @IBOutlet weak var activity: UIActivityIndicatorView!

        override func viewDidLoad() {
            super.viewDidLoad()

            myWebView = WKWebView(frame: view.bounds)
            myWebView.navigationDelegate = self
            myWebView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            view.addSubview(myWebView)
            view.sendSubviewToBack(myWebView)

            if let url = URL(string: "https://www.apple.com") {
                myWebView.load(URLRequest(url: url))
            }
        }

        func webView(_ webView: WKWebView,
                     didStartProvisionalNavigation navigation: WKNavigation!) {
            activity.isHidden = false
            activity.startAnimating()
        }

        func webView(_ webView: WKWebView,
                     didFinish navigation: WKNavigation!) {
            activity.isHidden = true
            activity.stopAnimating()
        }

        func webView(_ webView: WKWebView,
                     didFailProvisionalNavigation navigation: WKNavigation!,
                     withError error: Error) {
            activity.isHidden = true
            activity.stopAnimating()
            print("Error: \(error.localizedDescription)")
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
