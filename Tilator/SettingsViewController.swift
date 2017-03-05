//
//  SettingsViewController.swift
//  Tilator
//
//  Created by Akshaya Muralidharan on 3/5/17.
//  Copyright © 2017 Akshaya Muralidharan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defTipSegCtrl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    @IBAction func defTipChange(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(defTipSegCtrl.selectedSegmentIndex,forKey:"selectedSegIndex")
        defaults.synchronize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let selSegIndex = defaults.integer(forKey: "selectedSegIndex")
        defTipSegCtrl.selectedSegmentIndex = selSegIndex
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let defaults = UserDefaults.standard
        let selSegIndex = defaults.integer(forKey: "selectedSegIndex")
        defTipSegCtrl.selectedSegmentIndex = selSegIndex
    }


}
