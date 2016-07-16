//
//  ViewController.swift
//  SOSOS
//
//  Created by Jonas Bauer on 7/15/16.
//  Copyright © 2016 Jonas Bauer. All rights reserved.
//

import UIKit

class ViewController: UIViewController, PBPebbleCentralDelegate {
    let defaults = NSUserDefaults.standardUserDefaults()
    var firstTime = false
    var name = ""
    
    @IBOutlet weak var egg: UIImageView!
    @IBOutlet weak var nameOfEgg: UILabel!
    
    var connectedWatch: PBWatch?
    var watch: PBWatch?
    var central = PBPebbleCentral.defaultCentral()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        name = defaults.objectForKey("name")! as! String
        
        nameOfEgg.text! = name
        // Set the delegate to receive PebbleKit events
        if central.lastConnectedWatch() != nil{
        watch = central.lastConnectedWatch()
        self.central = PBPebbleCentral.defaultCentral()
        self.central.delegate = self
        // Register UUID
        self.central.appUUID = PBSportsUUID
        // Begin connection
        self.central.run()
        PBPebbleCentral.defaultCentral().delegate = self
        self.watch!.appMessagesGetIsSupported({(watch: PBWatch, isAppMessagesSupported: Bool) -> Void in
            if isAppMessagesSupported {
                // Tell the user using the Label
            }
            else {
            }
        })
        PBPebbleCentral.defaultCentral().run()
        }
        else{
        }
    }
    
    func pebbleCentral(central: PBPebbleCentral, watchDidConnect watch: PBWatch, isNew: Bool) {
        print("Pebble connected: \(watch.name)")
        // Keep a reference to this watch
        self.connectedWatch = watch
    }
    
    func pebbleCentral(central: PBPebbleCentral, watchDidDisconnect watch: PBWatch) {
        print("Pebble disconnected: \(watch.name)")
        // If this was the recently connected watch, forget it
        if watch.isEqual(self.connectedWatch) {
            self.connectedWatch = nil
        }
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

