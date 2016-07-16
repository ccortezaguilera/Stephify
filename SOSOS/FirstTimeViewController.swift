//
//  FirstTimeViewController.swift
//  Sosos
//
//  Created by Gonzalo Caballero on 7/15/16.
//  Copyright © 2016 JTAC2. All rights reserved.
//

import UIKit

class FirstTimeViewController: UIViewController {

    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer?
        tap = UITapGestureRecognizer(target: self, action: #selector(FirstTimeViewController.dismissKeyboard))
        view.addGestureRecognizer(tap!)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var nameOfSosos: UITextField!

    @IBAction func `continue`(sender: AnyObject) {
        
        defaults.setObject(nameOfSosos.text!, forKey: "name")
        defaults.setBool(true, forKey: "FirstTime")
        self.dismissViewControllerAnimated(true, completion: nil)

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
