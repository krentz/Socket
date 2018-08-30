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
    
    func getStringFromValues(position1: Int, position2: Int, values: [CShort]) -> String{
        var string = ""
        for i in 80 ... 96{
            var array = Array<UInt8>()
            array.append(UInt8(values[i] >> 8) & 0x00ff) //high
            array.append(UInt8(values[i] & 0x00ff)) // low
            string = (string + getStringFromBytes(bytes: array)).replacingOccurrences(of: "\0", with: "", options: .regularExpression)
        }
        return string
    }
    
    func getStringFromBytes(bytes: [UInt8]) -> String{
        let getDataFromBytes = NSData(bytes: bytes , length: bytes.count)
        let dataString = NSString(data: getDataFromBytes as Data, encoding: String.Encoding.utf8.rawValue)
        return dataString! as String
    }
    
}

