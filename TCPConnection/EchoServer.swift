//
//  EchoServer.swift
//  TCPConnection
//
//  Created by Rafael Krentz Gonçalves on 8/22/18.
//  Copyright © 2018 krentz. All rights reserved.
//

import Foundation
import Socket

class EchoServer {
    let bufferSize = 1024
    let port: Int
    let ipAddress: String
    let timeOut: Int
    
    var listenSocket: Socket? = nil
    var connectSocket: Socket? = nil
    var connected = [Int32: Socket]()
    var acceptNewConnection = true
    
    init(ipAddress: String, port: Int, timeOut: Int) {
        self.port = port
        self.ipAddress = ipAddress
        self.timeOut = timeOut
    }
    
    deinit {
        for socket in connected.values {
            socket.close()
        }
        listenSocket?.close()
    }

    func start() throws {
        let socket = try Socket.create()
        connectSocket = socket
        //99999999999
        try connectSocket?.connect(to: "10.51.11.21", port: 502, timeout: 9999, familyOnly: true)
        
        repeat {
            let connectedSocket = try socket.acceptClientConnection()
            print("Connection from: \(connectedSocket.remoteHostname)")
            newConnection(socket: connectedSocket)
        } while acceptNewConnection
    }
    
    func newConnection(socket: Socket) {
//        connected[socket.socketfd] = socket
//        var cont = true
//        var dataRead = Data(capacity: bufferSize)
//        repeat {
//            do {
//                let bytes = try socket.read(into: &dataRead)
//                if bytes > 0 {
//                    if let readStr = String(data: dataRead, encoding: .utf8) {
//                        print("Received: \(readStr)")
//                        try socket.write(from: readStr)
//                        if readStr.hasPrefix("quit") {
//                            cont = false
//                            socket.close()
//                        }
//                        dataRead.count = 0
//                    }
//                }
//            } catch let error {
//                print("error: \(error)")
//            }
//        } while cont
//        connected.removeValue(forKey: socket.socketfd)
//        socket.close()
    }
    
    
}
