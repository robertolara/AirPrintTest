//
//  ViewController.swift
//  AirPrintTest
//
//  Created by Roberto E Lara on 1/8/17.
//  Copyright © 2017 Roberto E Lara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        webView.loadHTMLString("<html><body>Hello World</body></html>", baseURL: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Print(_ sender: Any) {
        var pInfo : UIPrintInfo = UIPrintInfo.printInfo()
        pInfo.outputType = UIPrintInfoOutputType.general
        pInfo.jobName = (webView.request?.url?.absoluteString)!
        pInfo.orientation = UIPrintInfoOrientation.portrait
        
        var printController = UIPrintInteractionController.shared
        printController.printInfo = pInfo
        printController.showsPageRange = true
        printController.printFormatter = webView.viewPrintFormatter()
        
        printController.present(animated: true, completionHandler: nil)
    }

}

