//
//  ViewController.swift
//  TCPConnection
//
//  Created by Rafael Krentz Gonçalves on 8/22/18.
//  Copyright © 2018 krentz. All rights reserved.
//

import UIKit
import Socket
import Dispatch
import SwiftSocket

class ViewController: UIViewController {

    var client: TCPClient!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var textView: UITextView!
    
    func showError(){
        print("error")
        IJProgressView.shared.hideProgressView()
    }
    
    func parseByte(data: [UInt8], size: Int){
        var values : [CShort] = []
        var cont = 3
        for _ in 0 ... size{
            values.append(CShort( ((CShort(data[cont])) << 8) | (CShort(data[cont+1])) ) )
            cont = cont + 2
        }
        
    }
    
    @IBAction func getRegisters(_ sender: Any) {
        IJProgressView.shared.showProgressView(view)
        self.textView.text = ""
        self.client = TCPClient(address: "10.51.10.199", port: 502)
        
        switch self.client.connect(timeout: 10) {
        case .success:
            switch self.client.send(data: self.sendRHR(addr: 0, size: 100)) {
            case .success:
                guard let data = self.client.read(300, timeout: 10) else { return }
                self.parseByte(data: data, size: 100)
                self.textView.text = " \(data)"
                
                //IF BIT DE ERRO SETADO RETURN
                //ELSE PARSE
                
                StatusParser.shared.parseStatus1(data: data)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    
                    switch self.client.send(data: self.sendRHR(addr: 100, size: 100)) {
                    case .success:
                        guard let data = self.client.read(300, timeout: 10) else { return }
                        
                        //IF BIT DE ERRO SETADO RETURN
                        //ELSE PARSE
                        print(data)
                        StatusParser.shared.parseStatus2(data: data)
                      
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        
                            switch self.client.send(data: self.sendRHR(addr: 200 , size: 35)) {
                            case .success:
                                guard let data = self.client.read(300, timeout: 10) else { return }
                                print("data 3 : \(data)")
                                StatusParser.shared.parseStatus3(data: data)
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                    switch self.client.send(data: self.sendRHR(addr: 1000 , size: 100)) {
                                    case .success:
                                        guard let data = self.client.read(300, timeout: 10) else { return }
                                        print("config 1 : \(data)")
                                        //StatusParser.shared.parseStatus3(data: data)
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                            switch self.client.send(data: self.sendRHR(addr: 1100 , size: 100)) {
                                            case .success:
                                                guard let data = self.client.read(300, timeout: 10) else { return }
                                                print("config 2 : \(data)")
                                                //StatusParser.shared.parseStatus3(data: data)
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                                    switch self.client.send(data: self.sendRHR(addr: 1200 , size: 100)) {
                                                    case .success:
                                                        guard let data = self.client.read(300, timeout: 10) else { return }
                                                        print("config 3 : \(data)")
                                                        //StatusParser.shared.parseStatus3(data: data)
                                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                                            switch self.client.send(data: self.sendRHR(addr: 1300 , size: 100)) {
                                                            case .success:
                                                                guard let data = self.client.read(300, timeout: 10) else { return }
                                                                print("config 4 : \(data)")
                                                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                                                    switch self.client.send(data: self.sendRHR(addr: 1400 , size: 100)) {
                                                                    case .success:
                                                                        guard let data = self.client.read(300, timeout: 10) else { return }
                                                                        print("config 5 : \(data)")
                                                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                                                            switch self.client.send(data: self.sendRHR(addr: 1500 , size: 100)) {
                                                                            case .success:
                                                                                guard let data = self.client.read(300, timeout: 10) else { return }
                                                                                print("config 6 : \(data)")
                                                                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                                                                    switch self.client.send(data: self.sendRHR(addr: 1600 , size: 100)) {
                                                                                    case .success:
                                                                                        guard let data = self.client.read(300, timeout: 10) else { return }
                                                                                        print("config 7 : \(data)")
                                                                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                                                                            switch self.client.send(data: self.sendRHR(addr: 1700 , size: 100)) {
                                                                                            case .success:
                                                                                                guard let data = self.client.read(300, timeout: 10) else { return }
                                                                                                print("config 8 : \(data)")
                                                                                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                                                                                    switch self.client.send(data: self.sendRHR(addr: 1800 , size: 100)) {
                                                                                                    case .success:
                                                                                                        guard let data = self.client.read(300, timeout: 10) else { return }
                                                                                                        print("config 9 : \(data)")
                                                                                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                                                                                            switch self.client.send(data: self.sendRHR(addr: 1900 , size: 100)) {
                                                                                                            case .success:
                                                                                                                guard let data = self.client.read(300, timeout: 10) else { return }
                                                                                                                print("config 10 : \(data)")
                                                                                                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                                                                                                    switch self.client.send(data: self.sendRHR(addr: 2000 , size: 95)) {
                                                                                                                    case .success:
                                                                                                                        guard let data = self.client.read(300, timeout: 10) else { return }
                                                                                                                        print("config 11 : \(data)")
                                                                                                                        self.client.close()
                                                                                                                        IJProgressView.shared.hideProgressView()
                                                                                                                    case .failure(let error):
                                                                                                                        self.client.close()
                                                                                                                        self.showError()
                                                                                                                        self.textView.text = "\(error)"
                                                                                                                    }                                                                                                            }
                                                                                                            case .failure(let error):
                                                                                                                self.client.close()
                                                                                                                self.showError()
                                                                                                                self.textView.text = "\(error)"
                                                                                                            }
                                                                                                        }
                                                                                                    case .failure(let error):
                                                                                                        self.client.close()
                                                                                                        self.showError()
                                                                                                        self.textView.text = "\(error)"
                                                                                                    }
                                                                                                }
                                                                                            case .failure(let error):
                                                                                                self.client.close()
                                                                                                self.showError()
                                                                                                self.textView.text = "\(error)"
                                                                                            }
                                                                                        }
                                                                                    case .failure(let error):
                                                                                        self.client.close()
                                                                                        self.showError()
                                                                                        self.textView.text = "\(error)"
                                                                                    }
                                                                                }
                                                                            case .failure(let error):
                                                                                self.client.close()
                                                                                self.showError()
                                                                                self.textView.text = "\(error)"
                                                                            }
                                                                        }
                                                                    case .failure(let error):
                                                                        self.client.close()
                                                                        self.showError()
                                                                        self.textView.text = "\(error)"
                                                                    }
                                                                }
                                                            case .failure(let error):
                                                                self.client.close()
                                                                self.showError()
                                                                self.textView.text = "\(error)"
                                                            }
                                                        }
                                                    case .failure(let error):
                                                        self.client.close()
                                                        self.showError()
                                                        self.textView.text = "\(error)"
                                                    }
                                                }
                                            case .failure(let error):
                                                self.client.close()
                                                self.showError()
                                                self.textView.text = "\(error)"
                                            }
                                        }
                                    case .failure(let error):
                                        self.client.close()
                                        self.showError()
                                        self.textView.text = "\(error)"
                                    }
                                }
                            case .failure(let error):
                                self.client.close()
                                self.showError()
                                self.textView.text = "\(error)"
                            }
                        }
                    case .failure(let error):
                        self.client.close()
                        self.showError()
                        self.textView.text = "\(error)"
                    }
                }
            case .failure(let error):
                self.client.close()
                self.showError()
                self.textView.text = "\(error)"
            }
        case .failure(let error):
            self.client.close()
            self.showError()
            self.textView.text = "\(error)"
        }
    }
    @IBAction func connect(_ sender: Any) {
        
        IJProgressView.shared.showProgressView(self.view)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            var data: [UInt8] = [UInt8]()
            
            if (sender as AnyObject).tag == 0{ // wifi open config session
                data = [0x01, 0x65, 0x01, 0x01, 0x43, 0x6F, 0x6E, 0x66, 0x69, 0x67, 0x53, 0x65, 0x01, 0x64]
            }
            else if (sender as AnyObject).tag == 1{ // wifi open calib session
                data = [0x01, 0x65, 0x01, 0x02, 0x50, 0x61, 0x73, 0x43, 0x61, 0x6c, 0x4e, 0x4F, 0xAE, 0x2A]
            }
            else if (sender as AnyObject).tag == 2{ // wifi close calib session
                data = [0x01, 0x65, 0x02, 0x02, 0x50, 0x61, 0x73, 0x43, 0x61, 0x6c, 0x4e, 0x4F, 0xAE, 0x2A]
            }
            else if (sender as AnyObject).tag == 3{ // wifi close config session
                data = [0x01, 0x65, 0x02, 0x01, 0x43, 0x6F, 0x6E, 0x66, 0x69, 0x67, 0x53, 0x65, 0x01, 0x64]
            }
            else if (sender as AnyObject).tag == 4{ // wifi start session
                data = [0x01, 0x65, 0x03, 0x05, 0x53, 0x74, 0x61, 0x72, 0x74, 0x53, 0x74, 0x6F, 0x74, 0xCA]
            }
            else if (sender as AnyObject).tag == 5{ // wifi stop session
                data = [0x01, 0x65, 0x04, 0x05, 0x53, 0x74, 0x61, 0x72, 0x74, 0x53, 0x74, 0x6F, 0xC5, 0x10]
            }
            else if (sender as AnyObject).tag == 6{ // wifi close download session
                data = [0x01, 0x65, 0x01, 0x03, 0x43, 0x6F, 0x6C, 0x6C, 0x65, 0x63, 0x74, 0x53, 0xF8, 0x90]
            }
            else if (sender as AnyObject).tag == 7{ // wifi open download session
                data = [0x01, 0x65, 0x02, 0x03, 0x43, 0x6F, 0x6C, 0x6C, 0x65, 0x63, 0x74, 0x53, 0xF8, 0x90]
            }
            else if (sender as AnyObject).tag == 8{ // wifi open software session
                data = [0x01, 0x65, 0x01, 0x04, 0x53, 0x6F, 0x66, 0x74, 0x77, 0x61, 0x72, 0x65, 0xD8, 0x0A]
            }
            else if (sender as AnyObject).tag == 9{ // wifi close software session
                data =  [0x01, 0x65, 0x02, 0x04, 0x53, 0x6F, 0x66, 0x74, 0x77, 0x61, 0x72, 0x65, 0xD8, 0x0A]
            }
            
            self.textView.text = ""
            let client = TCPClient(address: "10.51.11.21", port: 502)
            switch client.connect(timeout: 10) {
            case .success:
                switch client.send(data: data) {
                case .success:
                    guard let data = client.read(6, timeout: 10) else { return }
                    self.textView.text = " \(data)"
                    //if let response = String(bytes: data, encoding: .utf8) {
                      //  print("response \(response)   e data \(data)")
                        //self.textView.text = "\(data)"
                    //}
                    IJProgressView.shared.hideProgressView()
                    client.close()
                case .failure(let error):
                     self.textView.text = "\(error)"
                    IJProgressView.shared.hideProgressView()
                }
            case .failure(let error):
                IJProgressView.shared.hideProgressView()
                self.textView.text = "\(error)"
            }
        }
    }
    
    
    func sendRHR(addr : UInt16, size : UInt16) -> [UInt8] { //-> Bool{
        
        let executeTransaction = self.executeTransaction(function: 0x03, initReg: addr, nroReg: size, value: 0x00)
        
        let b : [UInt8] = mountCommand(advType: 0xFF, modbusPacket: executeTransaction)
        
        return b
    
    }
    
    
    func mountCommand(advType : UInt8, modbusPacket : [UInt8]) -> [UInt8]{
       
        var data = Array<UInt8>()
        
        data.append(UInt8(0))
        
        for j in 0 ... (modbusPacket.count - 1) {
            data.append(UInt8(modbusPacket[j]) & 0x00ff)
        }
        
        var b = Array<UInt8>()
        
        for k in 0 ... (data.count - 1) {
            b.append(data[k])
        }
        
        //calculo crc
        data.append(getCRC1(u8BufferPtr: b)[0])
        
        data.append(getCRC1(u8BufferPtr: b)[1])
        
        return data
        
        
    }
    
    var crc = 0x0000
    var crcHigh :  UInt8!
    var crcLow :  UInt8!

    func getCRC1(u8BufferPtr : [UInt8]) -> [UInt8]{
        
        crc = 0xFFFF  //0x0000;
        
        for b in u8BufferPtr {
            crc = Int(crc >> 8) ^ Int(tableToCRCCalculate[(crc ^ Int(b)) & 0x00ff])
        }
        
        var array = Array<UInt8>()
        array.append(UInt8(crc & 0x00ff)) // low
        array.append(UInt8(crc >> 8) & 0x00ff) // high
        
        return array
    }
    
    
    
    //Comandos Comuns
    func executeTransaction(function : UInt8, initReg : UInt16, nroReg : UInt16, value : Int ) -> [UInt8]{
        var data = Array<UInt8>()
        
        switch(function) {
        case 3, 70:
            data.append(function & 0x00ff)
            
            data.append(UInt8(Int(initReg >> 8) & 0x00ff))
            
            data.append(UInt8(Int(initReg) & 0xff))
            
            data.append(UInt8(Int(nroReg >> 8) & 0x00ff))
            
            data.append(UInt8(Int(nroReg) & 0x00ff))
            
            return data
            
        case 6, 71:
            
            data.append(function & 0x00ff)
            
            data.append(UInt8(Int(initReg >> 8) & 0x00ff))
            
            data.append(UInt8(Int(initReg) & 0x00ff))
            
            data.append(UInt8(Int(value >> 8) & 0x00ff))
            
            data.append(UInt8(Int(value) & 0x00ff))
            
            return data
            
        default:
            return data
        }
    }

    
    //uint?
    let tableToCRCCalculate : [UInt16] = [
        0x0000, 0xC0C1, 0xC181, 0x0140, 0xC301, 0x03C0, 0x0280, 0xC241,
        0xC601, 0x06C0, 0x0780, 0xC741, 0x0500, 0xC5C1, 0xC481, 0x0440,
        0xCC01, 0x0CC0, 0x0D80, 0xCD41, 0x0F00, 0xCFC1, 0xCE81, 0x0E40,
        0x0A00, 0xCAC1, 0xCB81, 0x0B40, 0xC901, 0x09C0, 0x0880, 0xC841,
        0xD801, 0x18C0, 0x1980, 0xD941, 0x1B00, 0xDBC1, 0xDA81, 0x1A40,
        0x1E00, 0xDEC1, 0xDF81, 0x1F40, 0xDD01, 0x1DC0, 0x1C80, 0xDC41,
        0x1400, 0xD4C1, 0xD581, 0x1540, 0xD701, 0x17C0, 0x1680, 0xD641,
        0xD201, 0x12C0, 0x1380, 0xD341, 0x1100, 0xD1C1, 0xD081, 0x1040,
        0xF001, 0x30C0, 0x3180, 0xF141, 0x3300, 0xF3C1, 0xF281, 0x3240,
        0x3600, 0xF6C1, 0xF781, 0x3740, 0xF501, 0x35C0, 0x3480, 0xF441,
        0x3C00, 0xFCC1, 0xFD81, 0x3D40, 0xFF01, 0x3FC0, 0x3E80, 0xFE41,
        0xFA01, 0x3AC0, 0x3B80, 0xFB41, 0x3900, 0xF9C1, 0xF881, 0x3840,
        0x2800, 0xE8C1, 0xE981, 0x2940, 0xEB01, 0x2BC0, 0x2A80, 0xEA41,
        0xEE01, 0x2EC0, 0x2F80, 0xEF41, 0x2D00, 0xEDC1, 0xEC81, 0x2C40,
        0xE401, 0x24C0, 0x2580, 0xE541, 0x2700, 0xE7C1, 0xE681, 0x2640,
        0x2200, 0xE2C1, 0xE381, 0x2340, 0xE101, 0x21C0, 0x2080, 0xE041,
        0xA001, 0x60C0, 0x6180, 0xA141, 0x6300, 0xA3C1, 0xA281, 0x6240,
        0x6600, 0xA6C1, 0xA781, 0x6740, 0xA501, 0x65C0, 0x6480, 0xA441,
        0x6C00, 0xACC1, 0xAD81, 0x6D40, 0xAF01, 0x6FC0, 0x6E80, 0xAE41,
        0xAA01, 0x6AC0, 0x6B80, 0xAB41, 0x6900, 0xA9C1, 0xA881, 0x6840,
        0x7800, 0xB8C1, 0xB981, 0x7940, 0xBB01, 0x7BC0, 0x7A80, 0xBA41,
        0xBE01, 0x7EC0, 0x7F80, 0xBF41, 0x7D00, 0xBDC1, 0xBC81, 0x7C40,
        0xB401, 0x74C0, 0x7580, 0xB541, 0x7700, 0xB7C1, 0xB681, 0x7640,
        0x7200, 0xB2C1, 0xB381, 0x7340, 0xB101, 0x71C0, 0x7080, 0xB041,
        0x5000, 0x90C1, 0x9181, 0x5140, 0x9301, 0x53C0, 0x5280, 0x9241,
        0x9601, 0x56C0, 0x5780, 0x9741, 0x5500, 0x95C1, 0x9481, 0x5440,
        0x9C01, 0x5CC0, 0x5D80, 0x9D41, 0x5F00, 0x9FC1, 0x9E81, 0x5E40,
        0x5A00, 0x9AC1, 0x9B81, 0x5B40, 0x9901, 0x59C0, 0x5880, 0x9841,
        0x8801, 0x48C0, 0x4980, 0x8941, 0x4B00, 0x8BC1, 0x8A81, 0x4A40,
        0x4E00, 0x8EC1, 0x8F81, 0x4F40, 0x8D01, 0x4DC0, 0x4C80, 0x8C41,
        0x4400, 0x84C1, 0x8581, 0x4540, 0x8701, 0x47C0, 0x4680, 0x8641,
        0x8201, 0x42C0, 0x4380, 0x8341, 0x4100, 0x81C1, 0x8081, 0x4040]
    
    
    
}

