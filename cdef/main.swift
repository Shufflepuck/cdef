//
//  main.swift
//  cdef
//
//  Created by Francois Levaux on 04.07.17.
//

import Foundation

let argv = [String](CommandLine.arguments)
let argc = CommandLine.argc
let appName: String = String(describing: argv[0].split(separator: "/").last!)


if argc <= 2 || argc > 4 {
    print("Invalid number of parameters")
    printUsage()
    exit(EXIT_FAILURE)
}

switch argv[1].lowercased() {
case "-readdocumenttypes":
    readDocumentTypesFromApp(applicationPath: argv[2])
    break
case "-readurltypes":
    readURLTypesFromApp(applicationPath: argv[2])
    break
case "-readalluti":
    if let resultArray = readAllUti(argument: argv[2]) {
        printArray(arg1: argv[2], arg2: resultArray as [AnyObject] as! [String])
    } else {
        print("\(argv[2]) => Unknown")
    }
    break
case "-readdefaultuti":
    if let defaultUti = readDefaultUti(argument: argv[2]) {
        print("\(argv[2]) => \(defaultUti)")
    } else {
        print("\(argv[2]) => Unknown")
    }
    break
case "-readdefaulturl":
    if let defaultUrl = readDefaultUrl(argument: argv[2]) {
        print("\(argv[2]) => \(defaultUrl)")
    } else {
        print("\(argv[2]) => Unknown")
    }
    
    break
case "-writedefaultuti":
    if argc < 4 {
        print("-writeDefaultUti needs two parameters")
        printUsage()
        break
    }
    writeDefaultUti(arg1: argv[2], arg2: argv[3])
    break;
case "-writedefaulturl":
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
