//
//  DoubleComponentPickerViewController.swift
//  Pickers
//
//  Created by Vivek Ramesh on 29/03/15.
//  Copyright (c) 2015 slidenerd. All rights reserved.
//

import UIKit

class DoubleComponentPickerViewController: UIViewController, UIPickerViewDelegate , UIPickerViewDataSource{

    @IBOutlet weak var doublePIcker: UIPickerView!
    private let fillingComponent = 0;
    private let breadComponent = 1;
    private let fillingTypes = ["Ham" , "Turkey" , "Peanut Butter" , "Tuna Salad" , "Chicken Salad" , "Roast Beef" , "Vegemite"]
    private let breadTypes = ["White" , "Whole Wheat" , "Rye" , "Sourdough" , "Seven Grain"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        let fillingRow = doublePIcker.selectedRowInComponent(fillingComponent);
        let breadRow = doublePIcker.selectedRowInComponent(breadComponent);
        let filling = fillingTypes[fillingRow];
        let bread = breadTypes[breadRow];
        let message = "Your \(filling) on \(bread) will be right up."
        let alert = UIAlertController(title: "Thank you for your order", message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "Great", style: .Default, handler: nil);
        alert.addAction(action);
        presentViewController(alert, animated: true, completion: nil);
    }

    // MARK: Picker Data source methods
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return  2;
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == breadComponent {
            return breadTypes.count
        }
        else {
            return fillingTypes.count
        }
    }
    // MARK: Picker Delegate method
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        if component == breadComponent {
            return breadTypes[row]
        }
        else{
            return fillingTypes[row]
        }
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
