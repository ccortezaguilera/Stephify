//
//  ViewController.swift
//  Sosos
//
//  Created by Gonzalo Caballero on 7/15/16.
//  Copyright © 2016 JTAC2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let defaults = NSUserDefaults.standardUserDefaults()
    var firstTime = false
    var name = ""
    
    @IBOutlet weak var egg: UIImageView!
    @IBOutlet weak var nameOfEgg: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name = defaults.objectForKey("name")! as! String
        
        nameOfEgg.text! = name
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        //Is inverted because NSUserDefaults stars that way.
        firstTime = defaults.boolForKey("FirstTime")
        
        if firstTime == false {
            self.performSegueWithIdentifier("firstTime", sender: self)
            print("Loading Welcome Screen")
        }
    }
    
}

