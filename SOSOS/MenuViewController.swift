//
//  MenuViewController.swift
//  SOSOS
//
//  Created by Gonzalo Caballero on 7/15/16.
//  Copyright © 2016 Jonas Bauer. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBAction func closeMenu(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var daysALive: UILabel!
    @IBOutlet weak var Weight: UILabel!
    @IBOutlet weak var Hunger: UILabel!
    @IBOutlet weak var Happiness: UILabel!
    
    @IBOutlet weak var currentPet: UIImageView!
    
    
    let eggImage = UIImage(named: "egg1.png")
    let childImage = UIImage(named: "Child.png")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch actualAge {
        case .Egg:
            currentPet.image = eggImage!
        case .Child:
            currentPet.image = childImage!
        default:
            print("SHIT WENT WRONG")
        }
        nameOfPet = defaults.objectForKey("name") as! String
        name.text! = "Name: \(nameOfPet)"


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
