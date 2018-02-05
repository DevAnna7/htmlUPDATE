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
    
    // import logbookComposer var
    var logbookComposer:LogbookComposer!
    
    var htmlContent:String!
    
    var slideCDs:[String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        createLogbookAsHTML()
        //displayFileAsHTML()

        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        webPreview.transform = CGAffineTransform(translationX: 0, y: -28)
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

    
    
    // displays the given file in the UIWebView // CHECK TEMPLATES
    func displayFileAsHTML() {

        // set url path and sets up a request
            let url = Bundle.main.url(forResource: "flightRECORD_BODYTEMP", withExtension:"html")
            let request = URLRequest(url: url!)
        
        
        // load the html file to the webView
        webPreview.loadRequest(request)
        
        // rotates the webView 90 deg clockwise
        webPreview.transform = CGAffineTransform(rotationAngle: (CGFloat(Double.pi/2)))
        
        // scales html content to fit the WebView
        webPreview.scalesPageToFit = true

        
    }
    
    
    /////// SETUP DATA ENTRY
    
    // set the dummy entry data
    
    func setData() {
        

        slideCDs = ["DENTON", "WATSON", "MILLER", "JONES"]
        
        
        
        
    }
    
    
    
    
    
    // Load HTML template and change its default values
    func createLogbookAsHTML() {
        
        // creates object to work with
        logbookComposer = LogbookComposer()
        
        // some dummy HARD data
        setData()
        
        // line data
        var lineEntry = ""
        
        // add line entries for each leg
        for i in 0..<slideCDs.count {

            lineEntry += logbookComposer.lineEntry(captain: slideCDs[i])
            
        }
        
        // then add blank lines for remainder to make up a full page
        let reqBlanks = 43 - slideCDs.count
        
        //add blank line entries
        for _ in 0..<reqBlanks {

            lineEntry += logbookComposer.lineEntry(captain: "")
        
        }
    
        
        // change HTML file with inputs and set the htmlContent var AND Display it on the WEBVIEW
        if let logbookHTML = logbookComposer.renderLogbook(entry: lineEntry) {
            
            
            // load HTML String into the webview
            webPreview.loadHTMLString(logbookHTML, baseURL: NSURL(string: logbookComposer.pathToLogbookHTMLTemplate!)! as URL)
            htmlContent = logbookHTML

            
            // rotates the webView 90 deg clockwise
            webPreview.transform = CGAffineTransform(rotationAngle: (CGFloat(Double.pi/2)))
            
                        // TEST ONLY Scale webView to fit bounds
            
                        //webPreview.frame = self.view.bounds
            
            // move the webview below nav bar
            let leftCont = NSLayoutConstraint(item: webPreview, attribute: .leftMargin, relatedBy: .equal, toItem: view, attribute: .leftMargin, multiplier: 1.0, constant: 0)
            let rightCont = NSLayoutConstraint(item: webPreview, attribute: .rightMargin, relatedBy: .equal, toItem: view, attribute: .rightMargin, multiplier: 1.0, constant: 0)
            let topCont = NSLayoutConstraint(item: webPreview, attribute: .topMargin, relatedBy: .equal, toItem: view, attribute: .topMargin, multiplier: 1.0, constant: 0)
            let botCont = NSLayoutConstraint(item: webPreview, attribute: .bottomMargin, relatedBy: .equal, toItem: view, attribute: .bottomMargin, multiplier: 1.0, constant: 0)
            
            view.addConstraints([leftCont, rightCont, topCont, botCont])
            
            // scales html content to fit the WebView
            webPreview.scalesPageToFit = true
            
        }

    
    }



}
