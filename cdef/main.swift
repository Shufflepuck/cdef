//
//  main.swift
//  cdef
//
//  Created by François on 17/02/16.
//  Copyright © 2016 François 'ftiff' Levaux-Tiffreau. All rights reserved.
//

import Foundation

let argv = [String](Process.arguments)
let argc = Process.argc

func printUsage() -> Void {
    print("usage: \(argv[0]) [ -readalluti | -readdefaultuti | -readdefaulturl ] [parameter]")
    print("usage: \(argv[0]) [ -writedefaultuti | -writedefaulturl ] [parameter1] [parameter2]")
}

func printString(arg1: String, arg2: String) -> Void {
    print("\(arg1) -> \(arg2)")
}
func printArray(arg1: String, arg2: Array<String>) -> Void {
    for arg in arg2 {
        print("\(arg1) -> \(arg)")
    }
    
}

func readAllUti(argument: String) -> Void {
    let resultUArray = LSCopyAllRoleHandlersForContentType(argument, LSRolesMask.All)
    if let resultArray = resultUArray?.takeUnretainedValue() {
        printArray(argument, arg2: resultArray as [AnyObject] as! [String])
    } else {
        printString(argument, arg2: "Unknown")
    }
}

func readDefaultUrl(argument: String) -> Void {
    if let result = LSCopyDefaultHandlerForURLScheme(argument)?.takeRetainedValue() {
        printString(argument, arg2: (result as String))
    } else {
        printString(argument, arg2: "Unknown")
    }
}

func readDefaultUti(argument: String) -> Void {
    if let result = LSCopyDefaultRoleHandlerForContentType(argument, LSRolesMask.All)?.takeRetainedValue() {
        printString(argument, arg2: (result as String))
    } else {
        printString(argument, arg2: "Unknown")
    }
}

func writeDefaultUrl(arg1: String, arg2: String) -> Void {
    let result = LSSetDefaultHandlerForURLScheme(arg1, arg2)
    
    if result != 0 {
        print("Error: \(result)")
    }
    
    exit(result)
}

func writeDefaultUti(arg1: String, arg2: String) -> Void {
    let result = LSSetDefaultRoleHandlerForContentType(arg1, LSRolesMask.All, arg2)
    
    if result != 0 {
        print("Error: \(result)")
    }
    
    exit(result)
}


if argc <= 2 || argc > 4 {
    printUsage()
    exit(EXIT_FAILURE)
}

switch argv[1] {
case "-readalluti":
    readAllUti(argv[2])
    break;
case "-readdefaultuti":
    readDefaultUti(argv[2])
    break;
case "-readdefaulturl":
    readDefaultUrl(argv[2])
    break;
case "-writedefaultuti":
    writeDefaultUti(argv[2], arg2: argv[3])
    break;
case "-writedefaulturl":
    writeDefaultUrl(argv[2], arg2: argv[3])
    break;
default:
    printUsage()
}