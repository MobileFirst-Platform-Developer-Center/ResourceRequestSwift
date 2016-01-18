//
//  ViewController.swift
//  ResourceRequestSwift
//
//  Created by Nathan Hazout on 14/01/2016.
//  Copyright © 2016 Sample. All rights reserved.
//

import UIKit
import IBMMobileFirstPlatformFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var inputFirstName: UITextField!
    @IBOutlet weak var inputMiddleName: UITextField!
    @IBOutlet weak var inputLastName: UITextField!
    @IBOutlet weak var inputAge: UITextField!
    @IBOutlet weak var inputHeight: UITextField!
    @IBOutlet weak var inputDate: UITextField!
    @IBOutlet weak var outputText: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func submit(sender: UIButton) {
        
        //@PathParam
        let url = NSURL(string: "/adapters/JavaAdapter/users/"
                                + self.inputFirstName.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
                                + "/"
                                + self.inputMiddleName.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
                                + "/"
                                + self.inputLastName.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()))
        
        //Using POST
        let request = WLResourceRequest(URL: url, method: WLHttpMethodPost)
        
        //@QueryParam
        request.setQueryParameterValue(self.inputAge.text!, forName: "age")
        
        //@HeaderParam("Date")
        request.setHeaderValue(self.inputDate.text!, forName: "Date")
        
        //@FormParam("height")
        let formParams = ["height":self.inputHeight.text!]
        
        //Sending the request with Form parameters
        request.sendWithFormParameters(formParams) { (response, error) -> Void in
            if(error == nil){
                NSLog(response.responseText)
                var resultText = ""
                resultText += "Name = "
                resultText += (response.responseJSON["first"] as! String) + " " + (response.responseJSON["middle"] as! String) + " " + (response.responseJSON["last"] as! String) + "\n"
                resultText += "Age = " + (String(response.responseJSON["age"] as! Int)) + "\n"
                resultText += "Height = " + (response.responseJSON["height"] as! String) + "\n"
                resultText += "Date = " + (response.responseJSON["Date"] as! String) + "\n"
                
                self.outputText.text=resultText
            }
            else{
                NSLog(error.description)
                self.outputText.text = error.description
            }
        }
    }
    
}

