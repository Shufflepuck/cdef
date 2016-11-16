//
//  main.swift
//  cdef
//
//  Created by François on 17/02/16.
//  Copyright © 2016 François 'ftiff' Levaux-Tiffreau. All rights reserved.
//

import Foundation
import FTApp

func printUsage() -> Void {
    print("cdef v0.3.0 -- https://github.com/ftiff/cdef")
    print("usage: \(CommandLine.arguments[0]) [ -readAllUti | -readDefaultUti | -readDefaultUrl ] [parameter]")
    print("usage: \(CommandLine.arguments[0]) [ -writeDefaultUti | -writeDefaultUrl ] [parameter1] [parameter2]")
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


