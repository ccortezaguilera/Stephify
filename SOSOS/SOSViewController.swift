//
//  SOSViewController.swift
//  SOSOS
//
//  Created by Gonzalo Caballero on 7/16/16.
//  Copyright © 2016 Jonas Bauer. All rights reserved.
//

import UIKit
import RealmSwift

class SOSViewController: UIViewController {

    
    @IBOutlet weak var yourName: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    
    class PersonInfo : Object {
        
        static var name = ""
        static var number = 123456789
    }
    
    var User = PersonInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func continueButton(sender: AnyObject) {
        
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
