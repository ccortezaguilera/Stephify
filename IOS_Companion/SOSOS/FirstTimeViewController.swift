//
//  FirstTimeViewController.swift
//  Sosos
//
//  Created by Gonzalo Caballero on 7/15/16.
//  Copyright © 2016 JTAC2. All rights reserved.
//

import UIKit
import RealmSwift

class FirstTimeViewController: UIViewController {
    
    
    @IBOutlet weak var errorLabel: UILabel!
    //TODO: FINISH THE PERSISTEND DATA PART
    class Pet : Object {
        dynamic var name = ""
        dynamic var dayBorn = NSDate()
        dynamic var money = ""
        dynamic var happiness = 3.0
        dynamic var hunger = 3.0
    }
    
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    class RealmHelper {
        static func addNewPet(pet: Pet) {
            let realm = try! Realm()
            try! realm.write() {
                realm.add(pet)
            }
        }
        
    }
    
    override func viewDidLoad() {
        defaults.setObject("Test", forKey: "name")
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
        
        
        if nameOfSosos.text! == "" {
            errorLabel.hidden = false
        }
        else {
            defaults.setObject(nameOfSosos.text!, forKey: "name")
            defaults.setBool(true, forKey: "FirstTime")
            self.dismissViewControllerAnimated(true, completion: nil)
            nameOfPet = nameOfSosos.text!
        }
        
        
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "firstTime" {
            var nextScene =  segue.destinationViewController as! ViewController
            
            nextScene.nameOfEgg.text! = nameOfSosos.text!
        }
        var nextScene = segue.destinationViewController as! MenuViewController
        nextScene.name.text! = nameOfSosos.text!
    }
}