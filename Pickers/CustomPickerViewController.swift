//
//  CustomPickerViewController.swift
//  Pickers
//
//  Created by Vivek Ramesh on 29/03/15.
//  Copyright (c) 2015 slidenerd. All rights reserved.
//

import UIKit

class CustomPickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var customPicker: UIPickerView!
    @IBOutlet weak var winLabel: UILabel!
    private var images : [UIImage]!
    //the method that runs the spin, guess how it works
    @IBAction func buttonPressed(sender: AnyObject) {
        var win = false;
        var numInRow = -1;
        var lastValue = -1;
        
        for i in 0..<3 {
            let newValue = Int(arc4random_uniform(UInt32(images.count)))
            if newValue == lastValue {
                numInRow++;
            }
            else{
                numInRow = 1;
            }
            lastValue = newValue;
            customPicker.selectRow(newValue, inComponent: i, animated: true);
            customPicker.reloadComponent(i);
            if numInRow >= 3 {
                win = true;
            }
            winLabel.text = win ? "WINNER!" : " "
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        for family in UIFont.familyNames() as! [String] {
            println(family)
            for font in UIFont.fontNamesForFamilyName(family)
            {
                println("\t \(font)");
            }
        }
        images = [
            UIImage(named: "number_0")!,
            UIImage(named: "number_1")!,
            UIImage(named: "number_2")!,
            UIImage(named: "number_3")!,
            UIImage(named: "number_4")!,
            UIImage(named: "number_5")!,
            UIImage(named: "number_6")!,
            UIImage(named: "number_7")!,
            UIImage(named: "number_8")!,
            UIImage(named: "number_9")!,
        ]
        //Note the space between the quotes
        winLabel.text = " "
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3;
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return images.count;
    }
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView!) -> UIView {
        let image = images[row]
        let imageView = UIImageView(image: image);
        return imageView;
    }

    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 128;
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
