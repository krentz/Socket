//
//  ParseUtils.swift
//  TCPConnection
//
//  Created by Rafael Goncalves on 30/08/18.
//  Copyright © 2018 krentz. All rights reserved.
//

import Foundation

class ParseUtils{
    
    static let shared = ParseUtils()
    
    func formatMacAddress(mac: String) -> String {
        var mac = mac
        
        mac.insert(":", at: mac.index(mac.startIndex, offsetBy: 2))
        mac.insert(":", at: mac.index(mac.startIndex, offsetBy: 5))
        mac.insert(":", at: mac.index(mac.startIndex, offsetBy: 8))
        mac.insert(":", at: mac.index(mac.startIndex, offsetBy: 11))
        mac.insert(":", at: mac.index(mac.startIndex, offsetBy: 14))
        
        return mac.uppercased()
    }
    func getformatIpAddress(addr1: CShort, addr2: CShort) -> String{
        return "\(UInt8( Int(addr1 >> 8) & 0x00ff)).\(UInt8( Int(addr1) & 0x00ff)).\(UInt8( Int(addr2 >> 8) & 0x00ff)).\(UInt8( Int(addr2) & 0x00ff))"
    }
    
    func getStringFromValues(position1: Int, position2: Int, values: [CShort]) -> String{
        var string = ""
        for i in position1 ... position2{
            //String(Int(values[5]) & 0xffff, radix: 16)
            var array = Array<UInt8>()
            array.append( UInt8( Int(values[i] >> 8) & 0x00ff)) //high
            array.append( UInt8( Int(values[i]) & 0x00ff)) // low
            string = (string + getStringFromBytes(bytes: array)).replacingOccurrences(of: "\0", with: "", options: .regularExpression)
        }
        return string
    }
    
    func getStringFromBytes(bytes: [UInt8]) -> String{
        let getDataFromBytes = NSData(bytes: bytes , length: bytes.count)
        let dataString = NSString(data: getDataFromBytes as Data, encoding: String.Encoding.utf8.rawValue)
        if let result = dataString {
            return result as String
        }
        else{
            return ""
        }
    }
    func completeArray(bytes: [UInt8], size: Int) -> [UInt8]{
        var values = bytes
        for _ in bytes.count ..< size {
            values.append(0)
        }
        return values
    }
    func getBytesFromString(string: String) -> [UInt8]{
        
        if string.count == 0 {
            return [UInt8]()
        }
        
        // Get the String.UTF8View.
        let bytes = string.utf8
        //   print(bytes)
        
        // Get an array from the UTF8View.
        // ... This is a byte array of character data.
        var buffer = [UInt8](bytes)
        
        // Change the first byte in the byte array.
        // ... The byte array is mutable.
        buffer[0] = buffer[0] + UInt8(0)
        return buffer
        
    }
    
}

