//
//  BuyFoodViewController.swift
//  
//
//  Created by Gonzalo Caballero on 7/16/16.
//
//

import UIKit

class BuyFoodViewController: UIViewController {

    @IBAction func backButton(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    @IBOutlet weak var error: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buyCookie(sender: AnyObject) {
        if money >= 10 {
            happiness += 1.0
            money -= 10
            hungerOfPet -= 1
            spentMoney += 10
        }
        else {
            error.hidden = false
        }
      
    }

}
