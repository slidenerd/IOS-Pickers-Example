//
//  DatePickerViewController.swift
//  Pickers
//
//  Created by Vivek Ramesh on 29/03/15.
//  Copyright (c) 2015 slidenerd. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        let date = NSDate();
        datePicker.setDate(date, animated: true);

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func buttonPressed(sender: AnyObject) {
        let date = datePicker.date;
        let message = "the date and the time you selected is \(date)";
        let alert = UIAlertController(title: "Date and Time Selected", message: message, preferredStyle: .Alert);
        let action = UIAlertAction(title: "Thats so true", style: .Default, handler: nil);
        alert.addAction(action);
        presentViewController(alert, animated: true, completion: nil);
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
