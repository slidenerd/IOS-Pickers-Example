//
//  DependentComponentPickerViewController.swift
//  Pickers
//
//  Created by Vivek Ramesh on 29/03/15.
//  Copyright (c) 2015 slidenerd. All rights reserved.
//

import UIKit

class DependentComponentPickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{

    @IBOutlet weak var dependentPicker: UIPickerView!
    private let stateComponent = 0;
    private let zipComponent = 1;
    private var stateZips : [String : [String]]!
    private var states: [String]!
    private var zips: [String]!
    override func viewDidLoad() {
        super.viewDidLoad()
        let bundle = NSBundle.mainBundle();
        let plistURL = bundle.pathForResource("states", ofType : "plist");
        println(plistURL!);
        stateZips = NSDictionary(contentsOfFile: plistURL!) as! [String : [String]]
        println(stateZips)
        let allStates = stateZips.keys;
        states = sorted(allStates);
        println(states)
        let selectedState = states[0];
        zips = stateZips[selectedState];
        println(zips)
        
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed(sender: AnyObject) {
        let stateRow = dependentPicker.selectedRowInComponent(stateComponent);
        let zipRow = dependentPicker.selectedRowInComponent(zipComponent);
        let state = states[stateRow];
        let zip = zips[zipRow];
        let title = "you selected zip code \(zip)"
        let message = "\(zip) is in \(state)"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert);
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil);
        alert.addAction(action);
        presentViewController(alert, animated: true, completion: nil);
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: PickerView Data source
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2;
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return component == stateComponent ? states.count : zips.count;
    }

    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        let pickerWidth = pickerView.bounds.size.width;
        if component == zipComponent {
            return pickerWidth/3;
        }
        else{
            return 2 * pickerWidth/3;
        }
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        if component == stateComponent {
            return states[row]
        }
        else{
            return zips[row]
        }
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == stateComponent {
            let selectedState = states[row];
            zips = stateZips[selectedState];
            dependentPicker.reloadComponent(zipComponent);
            dependentPicker.selectRow(0, inComponent: zipComponent, animated: true);
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
