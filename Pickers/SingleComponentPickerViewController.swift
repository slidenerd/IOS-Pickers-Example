//
//  SingleComponentPickerViewController.swift
//  Pickers
//
//  Created by Vivek Ramesh on 29/03/15.
//  Copyright (c) 2015 slidenerd. All rights reserved.
//

import UIKit

class SingleComponentPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var singlePicker: UIPickerView!
    let names = ["Vivz" , "Anky" , "Slidenerd" ,"Adam" ,"Bucky" , "Derek"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed(sender: AnyObject) {
        let row = singlePicker.selectedRowInComponent(0);
        let selected = names[row];
        let title = "You selected \(selected)";
        let alert = UIAlertController(title: title, message: "Thank You for choosing", preferredStyle: .Alert);
        let action = UIAlertAction(title: "You are welcome", style: .Default, handler: nil);
        alert.addAction(action);
        presentViewController(alert, animated: true, completion: nil);
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Picker Data Source Methods
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return names.count;
    }
    
    // MARK: Picker Delegate methods
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return names[row];
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
