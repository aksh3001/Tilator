//
//  ViewController.swift
//  Tilator
//
//  Created by Akshaya Muralidharan on 3/3/17.
//  Copyright © 2017 Akshaya Muralidharan. All rights reserved.
//

import UIKit

extension Double {
    var asSeparatedLocaleCurrency:String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        return formatter.string(from: self as NSNumber)!
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipSegCtrl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }

    @IBAction func tipChange(_ sender: Any) {
        calculateTip(Any.self)
    }
    @IBAction func calculateTip(_ sender: Any) {
        let segCtrlValue = tipSegCtrl.titleForSegment(at: tipSegCtrl.selectedSegmentIndex)
        var segCtrlVal = segCtrlValue?.components(separatedBy: "%")
        
        let tipNo = Double((segCtrlVal?[0])!) ?? 0
        
        let tipPercent = tipNo/100
        
        let bill = Double(billField.text!) ?? 0
        
        let tip = bill * tipPercent
        
        let total = bill + tip

        let tipStr = String(format: "%.2f", tip)
        
        let tipAmt = Double(tipStr) ?? 0
        
        tipLabel.text = tipAmt.asSeparatedLocaleCurrency
        
        let totStr = String(format: "%.2f", total)
        
        let totAmt = Double(totStr) ?? 0
        
        totalLabel.text = totAmt.asSeparatedLocaleCurrency
        
        let defaults = UserDefaults.standard
        
        defaults.set(billField.text,forKey:"billValue")
        
        defaults.synchronize()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let selSegIndex = defaults.integer(forKey: "selectedSegIndex")
        tipSegCtrl.selectedSegmentIndex = selSegIndex
        
        let billVal = defaults.string(forKey: "billValue")
        billField.text = billVal
        Timer.scheduledTimer(timeInterval: 600, target:self, selector: #selector(ViewController.clearState), userInfo: nil, repeats: false)
        calculateTip(Any.self)
    }
    
    
    func clearState() {
        let defaults = UserDefaults.standard
        defaults.set("", forKey:"billValue")
        defaults.synchronize()
        viewWillAppear(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        billField.becomeFirstResponder()
        let defaults = UserDefaults.standard
        let selSegIndex = defaults.integer(forKey: "selectedSegIndex")
        tipSegCtrl.selectedSegmentIndex = selSegIndex
        calculateTip(Any.self)
    }
    
}

