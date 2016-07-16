//
//  SKSConfiguration.swift
//  SpeechKitSample
//
//  All Nuance Developers configuration parameters can be set here.
//
//  Copyright (c) 2015 Nuance Communications. All rights reserved.
//

import Foundation

var SKSAppKey = "7a588533e6fb10d62ea700dd9c829605e9eaf8e241bf74fb013c0fa6ef03d16a5b569d4151ad187f54185cf09af2f684ddee661eaddb19af172955072c277188"
var SKSAppId = "NMDPTRIAL_8391dppm_gmail_com20160716052819"
var SKSServerHost = "sslsandbox.nmdp.nuancemobility.net"
var SKSServerPort = "443"

var SKSLanguage = "eng-USA"

var SKSServerUrl = String(format: "nmsps://%@@%@:%@", SKSAppId, SKSServerHost, SKSServerPort)

// Only needed if using NLU/Bolt
var SKSNLUContextTag = "!NLU_CONTEXT_TAG!"


let LANGUAGE = SKSLanguage == "!LANGUAGE!" ? "eng-USA" : SKSLanguage