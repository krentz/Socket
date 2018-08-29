//
//  StatusParser.swift
//  TCPConnection
//
//  Created by Rafael Krentz Gonçalves on 8/23/18.
//  Copyright © 2018 krentz. All rights reserved.
//

import Foundation

class StatusParser {
    
    static let shared = StatusParser()
    //DOIS METODOS TRY COMENTADOS - passar data para Data e gmt
    func parseStatus1(values: [CShort]){
        WifiDevice.shared.WIFI_HR_SS_SERIAL_NUMBER_HIGH = Int(values[0])
        WifiDevice.shared.WIFI_HR_SS_SERIAL_NUMBER_LOW = Int(values[1])
        WifiDevice.shared.WIFI_serialNumber = ( WifiDevice.shared.WIFI_HR_SS_SERIAL_NUMBER_HIGH << 16) | (WifiDevice.shared.WIFI_HR_SS_SERIAL_NUMBER_LOW & 0xffff)
        WifiDevice.shared.WIFI_HR_SS_PRODUCT_CODE = Int(values[2])
        WifiDevice.shared.WIFI_HR_SS_FIRMWARE_VERSION = Int(values[3])
        
        WifiDevice.shared.WIFI_CR_PS_RESERVED_1 = Int(values[4])
        
        WifiDevice.shared.WIFI_HR_SS_MAC_ADDR_15_4_0_1_WiFi = Int(values[5])
        WifiDevice.shared.WIFI_HR_SS_MAC_ADDR_15_4_2_3_WiFi = Int(values[6])
        WifiDevice.shared.WIFI_HR_SS_MAC_ADDR_15_4_4_5_WiFi = Int(values[7])
        WifiDevice.shared.WIFI_HR_SS_MAC_ADDR_15_4_6_7 = Int(values[8])
        
        WifiDevice.shared.WIFI_CR_PS_RESERVED_2 = Int(values[9])
        
        WifiDevice.shared.WIFI_HR_SS_MAC_ADDR_BLE_0_1 = Int(values[10])
        WifiDevice.shared.WIFI_HR_SS_MAC_ADDR_BLE_2_3 = Int(values[11])
        WifiDevice.shared.WIFI_HR_SS_MAC_ADDR_BLE_4_5 = Int(values[12])
        
        WifiDevice.shared.WIFI_HR_SS_RESERVED_3 = Int(values[13])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_4 = Int(values[14])
        
        WifiDevice.shared.WIFI_HR_SS_POWER_SUPPLY = Int(values[15])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_5 = Int(values[16])
        WifiDevice.shared.WIFI_HR_SS_BLE_STATUS = Int(values[17])
        WifiDevice.shared.WIFI_HR_SS_BLE_LQI_RX_RESERVED = Int(values[18])
        
        WifiDevice.shared.WIFI_HR_SS_BLE_RESERVED_1 = Int(values[19])
        WifiDevice.shared.WIFI_HR_SS_BLE_RESERVED_2 = Int(values[20])
        
        
        WifiDevice.shared.WIFI_HR_SS_USB_STATUS = Int(values[21])
        WifiDevice.shared.WIFI_HR_SS_USB_RESERVED_1 = Int(values[22])
        WifiDevice.shared.WIFI_HR_SS_USB_RESERVED_2 = Int(values[23])
        WifiDevice.shared.WIFI_HR_SS_15_4_STATUS_RESERVED = Int(values[24])
        WifiDevice.shared.WIFI_HR_SS_15_4_SHORT_MAC_RESERVED = Int(values[25])
        WifiDevice.shared.WIFI_HR_SS_15_4_CHANNEL_RESERVED = Int(values[26])
        WifiDevice.shared.WIFI_HR_SS_15_4_LQI_RX_RESERVED = Int(values[27])
        WifiDevice.shared.WIFI_HR_SS_15_4_RESERVED_1 = Int(values[28])
        WifiDevice.shared.WIFI_HR_SS_15_4_RESERVED_2 = Int(values[29])
        
        WifiDevice.shared.WIFI_HR_SS_RESERVED_6 = Int(values[30])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_7 = Int(values[31])
        WifiDevice.shared.WIFI_HR_SS_NUMBER_OF_ACTIVE_CHANNELS = Int(values[32])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_8 = Int(values[33])
        
        WifiDevice.shared.WIFI_HR_SS_RECORDS_STARTED_INTERFACE = Int(values[34])
        WifiDevice.shared.WIFI_HR_SS_RECORDS_STOPPED_INTERFACE = Int(values[35])
        WifiDevice.shared.WIFI_HR_SS_STATUS_OF_RECORDS = Int(values[36])
        
        WifiDevice.shared.WIFI_HR_SS_NUMBER_OF_RECORDS_H = Int(values[37])
        WifiDevice.shared.WIFI_HR_SS_NUMBER_OF_RECORDS_L = Int(values[38])
         WifiDevice.shared.WIFI_recordsNumber = ( WifiDevice.shared.WIFI_HR_SS_NUMBER_OF_RECORDS_H << 16) | (WifiDevice.shared.WIFI_HR_SS_NUMBER_OF_RECORDS_L & 0xffff)
        
        WifiDevice.shared.WIFI_HR_SS_NUMBER_OF_FREE_RECORDS_H = Int(values[39])
        WifiDevice.shared.WIFI_HR_SS_NUMBER_OF_FREE_RECORDS_L = Int(values[40])
        WifiDevice.shared.WIFI_freeRecordsNumber = ( WifiDevice.shared.WIFI_HR_SS_NUMBER_OF_FREE_RECORDS_H << 16) | (WifiDevice.shared.WIFI_HR_SS_NUMBER_OF_FREE_RECORDS_L & 0xffff)
        
        WifiDevice.shared.WIFI_HR_SS_RESERVED_11 = Int(values[41])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_12 = Int(values[42])
        WifiDevice.shared.WIFI_HR_SS_FIRST_YEAR = Int(values[43])
        WifiDevice.shared.WIFI_HR_SS_FIRST_MONTH = Int(values[44])
        WifiDevice.shared.WIFI_HR_SS_FIRST_DAY = Int(values[45])
        WifiDevice.shared.WIFI_HR_SS_FIRST_HOUR = Int(values[46])
        WifiDevice.shared.WIFI_HR_SS_FIRST_MINUTE = Int(values[47])
        WifiDevice.shared.WIFI_HR_SS_FIRST_SECOND = Int(values[48])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_13 = Int(values[49])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_14 = Int(values[50])
        
        WifiDevice.shared.WIFI_HR_SS_CURRENT_YEAR = Int(values[51])
        WifiDevice.shared.WIFI_HR_SS_CURRENT_MONTH = Int(values[52])
        WifiDevice.shared.WIFI_HR_SS_CURRENT_DAY = Int(values[53])
        WifiDevice.shared.WIFI_HR_SS_CURRENT_HOUR = Int(values[54])
        WifiDevice.shared.WIFI_HR_SS_CURRENT_MINUTE = Int(values[55])
        WifiDevice.shared.WIFI_HR_SS_CURRENT_SECOND = Int(values[56])
        WifiDevice.shared.WIFI_HR_SS_RESET_CONTIER = Int(values[57])
        WifiDevice.shared.WIFI_HR_SS_HAS_RESET_OCURRED = Int(values[58])
        // WifiDevice.shared.WIFI_HR_SS_RESET_CONTIER = Int(values[59])
        
        WifiDevice.shared.WIFI_HR_SS_AM_I_IN_BOOTLOADER_MODE = Int(values[60]) != 0 ? false : true
        WifiDevice.shared.WIFI_HR_SS_CHD_LAST_EVENT_YEAR = Int(values[61])
        WifiDevice.shared.WIFI_HR_SS_CHD_LAST_EVENT_MONTH = Int(values[62])
        WifiDevice.shared.WIFI_HR_SS_CHD_LAST_EVENT_DAY = Int(values[63])
        WifiDevice.shared.WIFI_HR_SS_CHD_LAST_EVENT_HOUR = Int(values[64])
        WifiDevice.shared.WIFI_HR_SS_CHD_LAST_EVENT_MINUTE = Int(values[65])
        WifiDevice.shared.WIFI_HR_SS_CHD_LAST_EVENT_SECOND = Int(values[66])
        WifiDevice.shared.WIFI_HR_SS_ALARM_STATUS = Int(values[67])
        WifiDevice.shared.WIFI_HR_SS_BUZZER_STATUS = Int(values[68])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_26 = Int(values[69])
        WifiDevice.shared.WIFI_HR_SS_DIGITAL_OUT_VALUE = (Int(values[70]) != 0) ? false : true
        WifiDevice.shared.WIFI_HR_SS_CHD_LAST_EVENT_EDGE = Int(values[71])
        WifiDevice.shared.WIFI_HR_SS_CHD_ALARM_STATUS = Int(values[72])
        WifiDevice.shared.WIFI_HR_SS_CHD_STATUS = Int(values[73])
        WifiDevice.shared.WIFI_HR_SS_CHD_VALUE = Int(values[74])
        WifiDevice.shared.WIFI_HR_SS_CHD_VALUE_USER_UNIT_float_High = Int(values[75])
        WifiDevice.shared.WIFI_HR_SS_CHD_VALUE_USER_UNIT_float_Low = Int(values[76])
        WifiDevice.shared.WIFI_userUnitValue = Float( (WifiDevice.shared.WIFI_HR_SS_CHD_VALUE_USER_UNIT_float_High << 16) | (WifiDevice.shared.WIFI_HR_SS_CHD_VALUE_USER_UNIT_float_Low & 0xffff) )
        
        WifiDevice.shared.WIFI_HR_SS_CHD_VALUE_MIN = Int(values[77])
        WifiDevice.shared.WIFI_HR_SS_CHD_VALUE_MAX = Int(values[78])
        WifiDevice.shared.WIFI_HR_SS_CHD_ALARM_MIN_STATUS = (Int(values[79]) != 0) ? false : true
        WifiDevice.shared.WIFI_HR_SS_CHD_ALARM_MAX_STATUS = (Int(values[80]) != 0) ? false : true
        
        
        
        WifiDevice.shared.WIFI_HR_SS_CH1_STATUS = Int(values[81])
        WifiDevice.shared.WIFI_HR_SS_CH1_VALUE = Int(values[82])
        WifiDevice.shared.WIFI_HR_SS_CH1_VALUE_MIN = Int(values[83])
        WifiDevice.shared.WIFI_HR_SS_CH1_VALUE_MAX = Int(values[84])
        WifiDevice.shared.WIFI_HR_SS_CH1_ALARM_MIN_STATUS = (Int(values[85]) != 0) ? false : true
        WifiDevice.shared.WIFI_HR_SS_CH1_ALARM_MAX_STATUS = (Int(values[86]) != 0) ? false : true
        WifiDevice.shared.WIFI_HR_SS_CH1_ALARM_STATUS = Int(values[87])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_32 = Int(values[88])
        
        WifiDevice.shared.WIFI_HR_SS_CH2_STATUS = Int(values[89])
        WifiDevice.shared.WIFI_HR_SS_CH2_VALUE = Int(values[90])
        WifiDevice.shared.WIFI_HR_SS_CH2_VALUE_MIN = Int(values[91])
        WifiDevice.shared.WIFI_HR_SS_CH2_VALUE_MAX = Int(values[92])
        WifiDevice.shared.WIFI_HR_SS_CH2_ALARM_MIN_STATUS = (Int(values[93]) != 0) ? false : true
        WifiDevice.shared.WIFI_HR_SS_CH2_ALARM_MAX_STATUS = (Int(values[94]) != 0) ? false : true
        WifiDevice.shared.WIFI_HR_SS_CH2_ALARM_STATUS = Int(values[95])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_34 = Int(values[96])
        
        WifiDevice.shared.WIFI_HR_SS_CH3_STATUS = Int(values[97])
        WifiDevice.shared.WIFI_HR_SS_CH3_VALUE = Int(values[98]) //(Int(CShort(data[199]) & 0x00ff) << 8) | Int(CShort(data[200]) & 0x00ff) //NEGATIVO
        WifiDevice.shared.WIFI_HR_SS_CH3_VALUE_MIN = Int(values[99])
        
    }
    
    func parseStatus2(values: [CShort]){
        
        WifiDevice.shared.WIFI_HR_SS_CH3_VALUE_MAX = Int(values[0])
        WifiDevice.shared.WIFI_HR_SS_CH3_ALARM_MAX_STATUS = (Int(values[1]) != 0) ? false : true
        WifiDevice.shared.WIFI_HR_SS_CH3_ALARM_STATUS = Int(values[2])
        
        WifiDevice.shared.WIFI_HR_SS_RESERVED_36 = Int(values[3])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_37 = Int(values[4])
        
        WifiDevice.shared.WIFI_HR_SS_BATTERY_VOLTAGE_VALUE = Int(values[5])
        WifiDevice.shared.WIFI_HR_SS_BATTERY_VOLTAGE_VALUE_MIN = Int(values[6])
        WifiDevice.shared.WIFI_HR_SS_BATTERY_VOLTAGE_VALUE_MAX = Int(values[7])
        WifiDevice.shared.WIFI_HR_SS_BATTERY_PERCENTAGE_OF_LIFE = Int(values[8])

        WifiDevice.shared.WIFI_HR_SS_RESERVED_38 = Int(values[9])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_39 = Int(values[10])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_40 = Int(values[11])

        WifiDevice.shared.WIFI_HR_SS_EXTERNAL_VOLTAGE_VALUE = Int(values[12])
        WifiDevice.shared.WIFI_HR_SS_EXTERNAL_VOLTAGE_VALUE_MIN = Int(values[13])
        WifiDevice.shared.WIFI_HR_SS_EXTERNAL_VOLTAGE_VALUE_MAX = Int(values[14])

        WifiDevice.shared.WIFI_HR_SS_RESERVED_52 = Int(values[15])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_53 = Int(values[16])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_54 = Int(values[17])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_55 = Int(values[18])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_56 = Int(values[19])

        WifiDevice.shared.WIFI_HR_SS_WIFI_LAST_UPDATE_YEAR  = Int(values[20])
        WifiDevice.shared.WIFI_HR_SS_WIFI_LAST_UPDATE_MONTH  = Int(values[21])
        WifiDevice.shared.WIFI_HR_SS_WIFI_LAST_UPDATE_DAY  = Int(values[22])
        WifiDevice.shared.WIFI_HR_SS_WIFI_LAST_UPDATE_HOUR  = Int(values[23])
        WifiDevice.shared.WIFI_HR_SS_WIFI_LAST_UPDATE_MINUTE  = Int(values[24])
        WifiDevice.shared.WIFI_HR_SS_WIFI_LAST_UPDATE_SECOND  = Int(values[25])
        WifiDevice.shared.WIFI_HR_SS_WIFI_FTP_LAST_UPDATE_TIME_H  = Int(values[26])
        WifiDevice.shared.WIFI_HR_SS_WIFI_FTP_LAST_UPDATE_TIME_L  = Int(values[27])
        WifiDevice.shared.WIFI_HR_SS_WIFI_CLOUD_LAST_UPDATE_TIME_H  = Int(values[28])
        WifiDevice.shared.WIFI_HR_SS_WIFI_CLOUD_LAST_UPDATE_TIME_L  = Int(values[29])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_1_BACKUPED  = Int(values[30])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_2_BACKUPED  = Int(values[31])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_3_BACKUPED  = Int(values[32])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_4_BACKUPED  = Int(values[33])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_5_BACKUPED  = Int(values[34])
        WifiDevice.shared.WIFI_HR_SS_WIFI_IRSS  = Int(values[35])
        WifiDevice.shared.WIFI_HR_SS_WIFI_ERROR_COM  = Int(values[36])
        WifiDevice.shared.WIFI_HR_SS_WIFI_ERROR_MQTT  = Int(values[37])
        WifiDevice.shared.WIFI_HR_SS_WIFI_ERROR_MODBUS  = Int(values[38])
        WifiDevice.shared.WIFI_HR_SS_WIFI_IP_ADDR_0_1  = Int(values[39])
        WifiDevice.shared.WIFI_HR_SS_WIFI_IP_ADDR_2_3  = Int(values[40])
        WifiDevice.shared.WIFI_HR_SS_WIFI_MASK_ADDR_0_1  = Int(values[41])
        WifiDevice.shared.WIFI_HR_SS_WIFI_MASK_ADDR_2_3  = Int(values[42])
        WifiDevice.shared.WIFI_HR_SS_WIFI_GATEWAY_ADDR_0_1  = Int(values[43])
        WifiDevice.shared.WIFI_HR_SS_WIFI_GATEWAY_ADDR_2_3  = Int(values[44])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_11  = Int(values[45])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_12  = Int(values[46])
        WifiDevice.shared.WIFI_HR_SS_WIFI_MODULE_FIRMWARE_VER  = Int(values[47])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_14  = Int(values[48])

        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_15  = Int(values[49])
        WifiDevice.shared.WIFI_HR_SS_WIFI_LAST_STATUS_YEAR  = Int(values[50])
        WifiDevice.shared.WIFI_HR_SS_WIFI_LAST_STATUS_MONTH_BROKER  = Int(values[51])
        WifiDevice.shared.WIFI_HR_SS_WIFI_LAST_STATUS_DAY_BROKER  = Int(values[52])
        WifiDevice.shared.WIFI_HR_SS_WIFI_LAST_STATUS_HOUR_BROKER  = Int(values[53])
        WifiDevice.shared.WIFI_HR_SS_WIFI_LAST_STATUS_MINUTE_BROKER  = Int(values[54])
        WifiDevice.shared.WIFI_HR_SS_WIFI_LAST_STATUS_SECOND_BROKER  = Int(values[55])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_22  = Int(values[56])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_23  = Int(values[57])
        WifiDevice.shared.WIFI_HR_SS_WIFI_LAST_STATUS_YEAR_FTP  = Int(values[58])
            
        WifiDevice.shared.WIFI_HR_SS_WIFI_LAST_STATUS_MONTH_FTP  = Int(values[59])
        WifiDevice.shared.WIFI_HR_SS_WIFI_LAST_STATUS_DAY_FTP  = Int(values[60])
        WifiDevice.shared.WIFI_HR_SS_WIFI_LAST_STATUS_HOUR_FTP  = Int(values[61])
        WifiDevice.shared.WIFI_HR_SS_WIFI_LAST_STATUS_MINUTE_FTP  = Int(values[62])
        WifiDevice.shared.WIFI_HR_SS_WIFI_LAST_STATUS_SECOND_FTP  = Int(values[63])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_30  = Int(values[64])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_31      = Int(values[65])
        WifiDevice.shared.WIFI_HR_SS_WIFI_LAST_STATUS_YEAR_CLOUD  = Int(values[66])
        WifiDevice.shared.WIFI_HR_SS_WIFI_LAST_STATUS_MONTH_CLOUD  = Int(values[67])
        WifiDevice.shared.WIFI_HR_SS_WIFI_LAST_STATUS_DAY_CLOUD  = Int(values[68])
        WifiDevice.shared.WIFI_HR_SS_WIFI_LAST_STATUS_HOUR_CLOUD  = Int(values[69])
        WifiDevice.shared.WIFI_HR_SS_WIFI_LAST_STATUS_MINUTE_CLOUD  = Int(values[70])
        WifiDevice.shared.WIFI_HR_SS_WIFI_LAST_STATUS_SECOND_CLOUD  = Int(values[71])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_38  = Int(values[72])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_39  = Int(values[73])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_40  = Int(values[74])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_41  = Int(values[75])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_42  = Int(values[76])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_43  = Int(values[77])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_44  = Int(values[78])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_45  = Int(values[79])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_46  = Int(values[80])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_47  = Int(values[81])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_48  = Int(values[82])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_49  = Int(values[83])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_50  = Int(values[84])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_51  = Int(values[85])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_52  = Int(values[86])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_53  = Int(values[87])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_54  = Int(values[88])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_55  = Int(values[89])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_56  = Int(values[90])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_57  = Int(values[91])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_58  = Int(values[92])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_59  = Int(values[93])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_60  = Int(values[94])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_61  = Int(values[95])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_62  = Int(values[96])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_63  = Int(values[97])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_64  = Int(values[98])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_65  = Int(values[99])
    }
    
  
    
    func parseStatus3(values: [CShort]){
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_65  = Int(values[0])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_66  = Int(values[1])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_67  = Int(values[2])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_68  = Int(values[3])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_69  = Int(values[4])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_70  = Int(values[5])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_71  = Int(values[6])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_72  = Int(values[7])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_73  = Int(values[8])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_74  = Int(values[9])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_75  = Int(values[10])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_76  = Int(values[11])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_77  = Int(values[12])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_78  = Int(values[13])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_79  = Int(values[14])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_80  = Int(values[15])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_81  = Int(values[16])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_82  = Int(values[17])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_83  = Int(values[18])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_84  = Int(values[19])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_85  = Int(values[20])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_86  = Int(values[21])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_87  = Int(values[22])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_88  = Int(values[23])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_89  = Int(values[24])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_90  = Int(values[25])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_91  = Int(values[26])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_92  = Int(values[27])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_93  = Int(values[28])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_94  = Int(values[29])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_95  = Int(values[30])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_96  = Int(values[31])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_97  = Int(values[32])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_98  = Int(values[33])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_99  = Int(values[34])
        WifiDevice.shared.WIFI_HR_SS_RESERVED_WIFI_100  = Int(values[35])
    }
}
