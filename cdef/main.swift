//
//  main.swift
//  cdef
//
//  Created by François on 17/02/16.
//  Copyright © 2016 François 'ftiff' Levaux-Tiffreau. All rights reserved.
//

import Foundation
import FTApp

let argv = [String](CommandLine.arguments)
let argc = CommandLine.argc

func printUsage() -> Void {
    print("cdef v0.3.0 -- https://github.com/ftiff/cdef")
    print("usage: \(argv[0]) [ -readAllUti | -readDefaultUti | -readDefaultUrl ] [parameter]")
    print("usage: \(argv[0]) [ -writeDefaultUti | -writeDefaultUrl ] [parameter1] [parameter2]")
}

func printString(arg1: String, arg2: String) -> Void {
    print("\(arg1) -> \(arg2)")
}
func printArray(arg1: String, arg2: Array<String>) -> Void {
    for arg in arg2 {
        print("\(arg1) -> \(arg)")
    }
    
}

func readAllUti(argument: String) -> [String]? {
    let resultUArray = LSCopyAllRoleHandlersForContentType(argument as CFString, LSRolesMask.all)
    return resultUArray?.takeUnretainedValue() as! [String]?
}

func readDefaultUrl(argument: String) -> String? {
    return LSCopyDefaultHandlerForURLScheme(argument as CFString)?.takeRetainedValue() as? String
}

func readDefaultUti(argument: String) -> String? {
    return LSCopyDefaultRoleHandlerForContentType(argument as CFString, LSRolesMask.all)?.takeRetainedValue() as? String
}

func writeDefaultUrl(arg1: String, arg2: String) -> Void {
    let result = LSSetDefaultHandlerForURLScheme(arg1 as CFString, arg2 as CFString)
    
    if result != 0 {
        print("Error: \(result)")
    }
    
    exit(result)
}

func writeDefaultUti(arg1: String, arg2: String) -> Void {
    let result = LSSetDefaultRoleHandlerForContentType(arg1 as CFString, LSRolesMask.all, arg2 as CFString)
    
    if result != 0 {
        print("Error: \(result)")
    }
    
    exit(result)
}

if argc <= 2 || argc > 4 {
    print("Invalid number of parameters")
    printUsage()
    exit(EXIT_FAILURE)
}

switch argv[1] {
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
