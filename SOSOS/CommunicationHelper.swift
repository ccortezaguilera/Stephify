//
//  CommunicationHelper.swift
//  SOSOS
//
//  Created by Jonas Bauer on 7/16/16.
//  Copyright © 2016 Jonas Bauer. All rights reserved.
//

import Foundation
import SpeechKit

class CommunicationHelper: UIView, SKTransactionDelegate, SKAudioPlayerDelegate {
var language: String!


var connectedWatch: PBWatch?
var watch: PBWatch?
var central = PBPebbleCentral.defaultCentral()
var walkedDistanceMeters: Int!
var activeKaloriesBurnt: Int!
let dataKeyDictionary: Dictionary<String,Int> = ["metresWalked":1,"kaloriesBurned":2,"amountOfSleep":3]
func getDataFromWatch (itemToGet: String){

    connectedWatch!.appMessagesAddReceiveUpdateHandler({(watch: PBWatch, update: [NSNumber: AnyObject]) -> Bool in
        print("Received message: \(update)")
        // Send Ack to Pebble
        let key = self.dataKeyDictionary[itemToGet]
        // If the key is present in the received dictionary
        if (update[key!] != nil) {
            // Read the integer value
            let value = update[key!]!
        }

        return true
    })
    watch!.releaseSharedSession()


}
    func speakString(stringToSpeak: String){
        language = LANGUAGE
        var skSession: SKSession?
        var skTransaction: SKTransaction?
        skTransaction = nil
        skSession = SKSession(URL: NSURL(string: SKSServerUrl), appToken: SKSAppKey)
        skTransaction = skSession!.speakString(stringToSpeak,
                                                    withLanguage: "eng-USA",
                                                    delegate: self)
    }
}