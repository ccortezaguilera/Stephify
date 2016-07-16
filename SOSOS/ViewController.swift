//
//  ViewController.swift
//  SOSOS
//
//  Created by Jonas Bauer on 7/15/16.
//  Copyright © 2016 Jonas Bauer. All rights reserved.
//

import UIKit
import SpeechKit

//IM STUPID IM USING GLOBAL VARIABLES

class ViewController: UIViewController, PBPebbleCentralDelegate, SKTransactionDelegate {
    var skTransaction:SKTransaction?
    var skSession:SKSession?
    var firstTime = false
    
    @IBOutlet weak var hunger3: UIImageView!
    @IBOutlet weak var hunger2: UIImageView!
    @IBOutlet weak var hunger: UIImageView!
    
    let eggImage = UIImage(named: "egg1.png")
    let childImage = UIImage(named: "Child.png")
    
    
    @IBOutlet weak var egg: UIImageView!
    @IBOutlet weak var nameOfEgg: UILabel!
    @IBOutlet weak var petImage: UIImageView!
    @IBOutlet weak var moneyQuantity: UILabel!
    
    var foodTimer = NSTimer()
    
    var connectedWatch: PBWatch?
    var watch: PBWatch?
    var central = PBPebbleCentral.defaultCentral()
    
    func update() {
        
        switch hungerOfPet {
        case 3:
            hunger3.hidden = true
            hungerOfPet = 2
        case 2:
            hunger2.hidden = true
            hungerOfPet = 1
        case 1:
            hunger.hidden = true
            hungerOfPet = 0
        default:
            print("HOLA")
        }
       
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        defaults.setObject(" ", forKey: "name")
//        nameOfPet = defaults.objectForKey("name")! as! String
        nameOfEgg.text! = nameOfPet
        
        switch actualAge {
        case .Egg:
            petImage.image = eggImage!
        case .Child:
            petImage.image = childImage!
        default:
            print("SOMETHING WENT WRONG")
        }
        
        moneyQuantity.text! = String(money)
        var timer = NSTimer.scheduledTimerWithTimeInterval(10, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)

        
//PEBBLE STUFF-----------------------------------------------------------
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
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "refreshData:", name: "refresh", object: nil)

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
        //defaults.setBool(false, forKey: "FirstTime")
        if firstTime == false {
            self.performSegueWithIdentifier("firstTime", sender: self)
            print("Loading Welcome Screen")
        }
    }
    
    func speakString(stringToSpeak: String){
        
        self.skTransaction = nil
        self.skSession = SKSession(URL: NSURL(string: SKSServerUrl), appToken: SKSAppKey)
        self.skTransaction = self.skSession!.speakString(stringToSpeak,
                                                         withLanguage: "eng-USA",
                                                         delegate: self)
    }
    func refreshData (notification: NSNotification) {
        moneyQuantity.text! = String(money)

    }
    @IBAction func unwindToHome (segue:UIStoryboardSegue) {
        
    }

}

