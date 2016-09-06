//
//  main.swift
//  cdef
//
//  Created by François on 17/02/16.
//  Copyright © 2016 François 'ftiff' Levaux-Tiffreau. All rights reserved.
//

import Foundation


let argv = [String](CommandLine.arguments)
let argc = CommandLine.argc

func printUsage() -> Void {
    print("cdef v0.2.1 -- https://github.com/ftiff/cdef")
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
    let resultUArray = LSCopyAllRoleHandlersForContentType(argument as CFString, LSRolesMask.all)
    if let resultArray = resultUArray?.takeUnretainedValue() {
        printArray(arg1: argument, arg2: resultArray as [AnyObject] as! [String])
    } else {
        printString(arg1: argument, arg2: "Unknown")
    }
}

func readDefaultUrl(argument: String) -> Void {
    if let result = LSCopyDefaultHandlerForURLScheme(argument as CFString)?.takeRetainedValue() {
        printString(arg1: argument, arg2: (result as String))
    } else {
        printString(arg1: argument, arg2: "Unknown")
    }
}

func readDefaultUti(argument: String) -> Void {
    if let result = LSCopyDefaultRoleHandlerForContentType(argument as CFString, LSRolesMask.all)?.takeRetainedValue() {
        printString(arg1: argument, arg2: (result as String))
    } else {
        printString(arg1: argument, arg2: "Unknown")
    }
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
    readAllUti(argument: argv[2])
    break
case "-readdefaultuti":
    readDefaultUti(argument: argv[2])
    break
case "-readdefaulturl":
    readDefaultUrl(argument: argv[2])
    break
case "-writedefaultuti":
    if argc < 4 {
        print("-writedefaultuti needs two parameters")
        printUsage()
        break
    }
    writeDefaultUti(arg1: argv[2], arg2: argv[3])
    break;
case "-writedefaulturl":
    if argc < 4 {
        print("-writedefaulturl needs two parameters")
        printUsage()
        break
    }
    writeDefaultUrl(arg1: argv[2], arg2: argv[3])
    break
default:
    print("Unknown parameter")
    printUsage()
}
