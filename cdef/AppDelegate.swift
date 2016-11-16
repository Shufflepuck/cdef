//
//  AppDelegate.swift
//  cdef
//
//  Created by François Levaux on 16.11.16.
//
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    let argv = [String](CommandLine.arguments)
    let argc = CommandLine.argc
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        

        
        if argc <= 2 || argc > 4 {
            print("Invalid number of parameters")
            printUsage()
            exit(EXIT_FAILURE)
        }
        
        switch argv[1] {
        case "-readDocumentTypes":
            readDocumentTypesFromApp(applicationPath: argv[2])
            break
        case "-readURLTypes":
            readURLTypesFromApp(applicationPath: argv[2])
            break
        case "-readalluti":
            fallthrough
        case "-readAllUti":
            if let resultArray = readAllUti(argument: argv[2]) {
                printArray(arg1: argv[2], arg2: resultArray as [AnyObject] as! [String])
            } else {
                print("\(argv[2]) => Unknown")
            }
            break
        case "-readdefaultuti":
            fallthrough
        case "-readDefaultUti":
            if let defaultUti = readDefaultUti(argument: argv[2]) {
                print("\(argv[2]) => \(defaultUti)")
            } else {
                print("\(argv[2]) => Unknown")
            }
            break
        case "-readdefaulturl":
            fallthrough
        case "-readDefaultUrl":
            if let defaultUrl = readDefaultUrl(argument: argv[2]) {
                print("\(argv[2]) => \(defaultUrl)")
            } else {
                print("\(argv[2]) => Unknown")
            }
            
            break
        case "-writedefaultuti":
            fallthrough
        case "-writeDefaultUti":
            if argc < 4 {
                print("-writeDefaultUti needs two parameters")
                printUsage()
                break
            }
            writeDefaultUti(arg1: argv[2], arg2: argv[3])
            break;
        case "-writedefaulturl":
            fallthrough
        case "-writeDefaultUrl":
            if argc < 4 {
                print("-writeDefaultUrl needs two parameters")
                printUsage()
                break
            }
            writeDefaultUrl(arg1: argv[2], arg2: argv[3])
            break
        default:
            print("Unknown parameter")
            printUsage()
            
        }
        
        NSApp.terminate(self)

    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

