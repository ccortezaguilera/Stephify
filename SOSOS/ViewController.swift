//
//  ViewController.swift
//  SOSOS
//
//  Created by Jonas Bauer on 7/15/16.
//  Copyright © 2016 Jonas Bauer. All rights reserved.
//

import UIKit

class ViewController: UIViewController, PBPebbleCentralDelegate {

    @IBOutlet weak var outputLabel: UILabel!
    var connectedWatch: PBWatch?
    var watch: PBWatch?
    var central = PBPebbleCentral.defaultCentral()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
                self.outputLabel.text = "AppMessage is supported!"
            }
            else {
                self.outputLabel.text = "AppMessage is NOT supported!"
            }
        })
        PBPebbleCentral.defaultCentral().run()
        }
        else{
            self.outputLabel.text = "Please Connect A Pebble Watch To Continue"
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


}

