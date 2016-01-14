//
//  ViewController.swift
//  ResourceRequestSwift
//
//  Created by Nathan Hazout on 14/01/2016.
//  Copyright © 2016 Sample. All rights reserved.
//

import UIKit
import IBMMobileFirstPlatformFoundation

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var openButton: UIButton!
    
    var pickerData: [String] = [String]()
    var selectedTag = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerData = ["MobileFirst_Platform", "MobileFirst_Playground", "Item 3", "Item 4", "Item 5", "Item 6"]
        self.picker.dataSource = self;
        self.picker.delegate = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func openPicker() {
        self.picker.hidden = false
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }

    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedTag = pickerData[row]
        self.openButton.setTitle(self.selectedTag, forState: .Normal)

        self.picker.hidden = true
    }
    @IBAction func sendRequest(sender: UIButton) {
        let request = WLResourceRequest(URL: NSURL(string: "/adapters/JavaHTTP/"), method: WLHttpMethodGet)
        request.setQueryParameterValue(self.selectedTag, forName: "tag")
        request.sendWithCompletionHandler { (response, error) -> Void in
            if(error == nil){
                NSLog(response.description)
            }
            else{
                NSLog(error.description)
            }
        }
        
    }
}

