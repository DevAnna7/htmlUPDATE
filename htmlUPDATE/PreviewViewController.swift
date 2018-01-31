//
//  PreviewViewController.swift
//  htmlUPDATE
//
//  Created by Anna Denton on 31/1/18.
//  Copyright © 2018 AnnaDev7. All rights reserved.
//

import UIKit


class PreviewViewController: UIViewController, UIWebViewDelegate {
    
    
    @IBOutlet weak var webPreview: UIWebView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        createLogbookPageAsHTML()
        displayFileAsHTML()

        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    // Load HTML template and change its values and then save it again
    func createLogbookPageAsHTML() {
        
        
        
        
    }
    
    // displays the given file in the UIWebView
    func displayFileAsHTML() {

        // set url path and sets up a request
            let url = Bundle.main.url(forResource: "flightRECORD", withExtension:"html")
            let request = URLRequest(url: url!)
        
        
        // load the html file to the webView
        webPreview.loadRequest(request)
        
        // rotates the webView 90 deg clockwise
        webPreview.transform = CGAffineTransform(rotationAngle: (CGFloat(Double.pi/2)))
        
        // scales html content to fit the WebView
        webPreview.scalesPageToFit = true

        
    }
    
    
}
