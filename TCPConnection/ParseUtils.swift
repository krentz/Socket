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
    
}

