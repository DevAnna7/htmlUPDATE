//
//  LogbookComposer.swift
//  htmlUPDATE
//
//  Created by Anna Denton on 2/2/18.
//  Copyright © 2018 AnnaDev7. All rights reserved.
//

import UIKit

class LogbookComposer: NSObject {
    
    
    
    // Referance HTML Templates
    let pathToLogbookHTMLTemplate = Bundle.main.path(forResource: "flightRECORD_BODYTEMP", ofType: "html")
    let pathToLogbookHTMLLineTemplate = Bundle.main.path(forResource: "flightRECORD_LINE", ofType: "html")
    
    
    // hard programmed for now
    //let captNAME:String = "DENTON"
    

    
    override init() {
        super.init()
    }
    

    // generate line Entries
    func lineEntry(captain:String) -> String! {
        
        do {
            
        // Load the logbook HTML template code into a String variable.
        var HTMLContentLine = try String(contentsOfFile: pathToLogbookHTMLLineTemplate!)
            
        // Replace all the placeholders with real values except for the items.
        // The capt Name.
        HTMLContentLine = HTMLContentLine.replacingOccurrences(of: "#CAPTAIN#", with: captain)
            
        // Set the items.
        //HTMLContent = HTMLContent.replacingOccurrences(of: "#ITEMS#", with: allItems)
            
        // The HTML code is ready.
        return HTMLContentLine
            
            
        }
        catch {
        print("Unable to open and use line HTML template files.")
        }
        return nil
    }
    
    // take the HTML Template and pass in ENTRY data to give back HTML String
    func renderLogbook(entry:String) -> String! {
        
        
        // Store the invoice number for future use.
        //self.captNAME = entry
        
        do {
            // Load the logbook HTML template code into a String variable.
            var HTMLContent = try String(contentsOfFile: pathToLogbookHTMLTemplate!)
            
            // Replace all the placeholders with real values except for the items.
            // The capt Name.
            HTMLContent = HTMLContent.replacingOccurrences(of: "#LINEENTRY#", with: entry)
        
        // Set the items.
        //HTMLContent = HTMLContent.replacingOccurrences(of: "#ITEMS#", with: allItems)
        
        // The HTML code is ready.
        return HTMLContent
        
    }
    catch {
    print("Unable to open and use HTML template files.")
    }
    
        return nil
    
    }


    
}
