//
//  ValidateWriter.swift
//  TCPConnection
//
//  Created by Rafael Goncalves on 03/09/18.
//  Copyright © 2018 krentz. All rights reserved.
//

import Foundation

class ValidateWriter{
    
    static let shared = ValidateWriter()
    
    func validateConfig1() -> [Int]{
        var configValues = [Int]()
        configValues.append(WifiDevice.shared.WIFI_HR_CS_SETTING_ACQUISITION_INTERVAL_LOG_S!) //1001
        configValues.append(WifiDevice.shared.WIFI_HR_CS_ENABLE_REGISTER_LOG != false ? 0 : 1) //1002
        configValues.append(WifiDevice.shared.WIFI_HR_CS_RESERVED_1!) //1003
        configValues.append(WifiDevice.shared.WIFI_HR_CS_SETTING_ACQUISITION_INTERVAL_SCAN_S!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_SETTING_START_MODE!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_SETTING_STOP_MODE!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_SETTING_ERASE_LOG_MEMORY != false ? 0 : 1)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_SETTING_CONFIGURATION_ONGOING != false ? 0 : 1)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_SETTING_YEAR_START_RECORD!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_SETTING_MONTH_START_RECORD!)
//
        configValues.append(WifiDevice.shared.WIFI_HR_CS_SETTING_DAY_START_RECORD!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_SETTING_HOUR_START_RECORD!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_SETTING_MINUTE_START_RECORD!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_SETTING_SECOND_START_RECORD!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_RESERVED_5!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_SETTING_YEAR_STOP_RECORD!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_SETTING_MONTH_STOP_RECORD!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_SETTING_DAY_STOP_RECORD!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_SETTING_HOUR_STOP_RECORD!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_SETTING_MINUTE_STOP_RECORD!)
        
        configValues.append(WifiDevice.shared.WIFI_HR_CS_SETTING_SECOND_STOP_RECORD!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_RESERVED_6!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_DISPLAY_ENABLE_MODE!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_DISPLAY_CONTRAST!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_RESERVED_9!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_BOOTLOADER_CONTROL!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_ALARM_BUZZER_DURATION_S!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_SETTING_DIGITAL_OUT_MODE!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_SETTING_DIGITAL_OUT_DURATION_S!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_MODBUS_ADDRESS!)

        configValues.append(WifiDevice.shared.WIFI_HR_CS_RESERVED_14!)
        
        let titleBytes = ParseUtils.shared.completeArray(bytes: ParseUtils.shared.getBytesFromString(string: WifiDevice.shared.WIFI_title), size: 20)
        var hi : UInt8 = 0
        var lo : UInt8 = 0
        for i in 0 ..< 20 {
            if (i % 2 == 0){
                hi = titleBytes[i]
            }
            else {
                lo = titleBytes[i]
                configValues.append(Int((Int(hi) & 0xFF) << 8) | (Int(lo) & 0xFF))
            }
        }
        
        configValues.append(WifiDevice.shared.WIFI_HR_CS_SETTING_PM != false ? 0 : 1) // 0 24
        configValues.append(WifiDevice.shared.WIFI_HR_CS_SETTING_GMT!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_SETTING_YEAR!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_SETTING_MONTH!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_SETTING_DAY!)
        configValues.append(1)
        configValues.append(1)
        configValues.append(1)
      //  configValues.append(WifiDevice.shared.WIFI_HR_CS_SETTING_HOUR!)
       // configValues.append(WifiDevice.shared.WIFI_HR_CS_SETTING_MINUTE!)
        //configValues.append(WifiDevice.shared.WIFI_HR_CS_SETTING_SECOND!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_RESERVED_16!)
        
        configValues.append(WifiDevice.shared.WIFI_HR_CS_BLE_ENABLED != false ? 0 : 1)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_BLE_ADVERTISE_MODE != false ? 0 : 1)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_BLE_ADVERTISE_TIME_ms!)
        
        let deviceNameBytes = ParseUtils.shared.completeArray(bytes: ParseUtils.shared.getBytesFromString(string: WifiDevice.shared.WIFI_deviceName), size: 8)
        hi = 0
        lo = 0
        for i in 0 ..< 8 {
            if (i % 2 == 0){
                hi = deviceNameBytes[i]
            }
            else {
                lo = deviceNameBytes[i]
                configValues.append(Int((Int(hi) & 0xFF) << 8) | (Int(lo) & 0xFF))
            }
        }
        
        configValues.append(WifiDevice.shared.WIFI_HR_CS_RESERVED_18!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_BLE_RESERVED_1!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_BLE_RESERVED_2!)
        
        configValues.append(WifiDevice.shared.WIFI_HR_CS_BLE_RESERVED_3!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_BLE_FAST_ADVERTISE_DURATION_S!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_RESERVED_18!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_RESERVED_19!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_VBAT_VEXT_MIN_MAX_CLEAR_STATUS!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_RESERVED_21!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_15_4_ENABLED_RESERVED!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_15_4_ADVERTISE_MODE_RESERVED!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_15_4_ADVERTISE_TIME_RESERVED!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_RESERVED_15_4_1!)
        
        configValues.append(WifiDevice.shared.WIFI_HR_CS_RESERVED_15_4_2!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_15_4_PAN_ID_RESERVED!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_15_4_POWER_LEVEL_RESERVED!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_15_4_ENCRYPTION_ENABLED_RESERVED!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_15_4_ENCRYPTION_KEY_0_RESERVED!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_15_4_ENCRYPTION_KEY_1_RESERVED!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_15_4_ENCRYPTION_KEY_2_RESERVED!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_15_4_ENCRYPTION_KEY_3_RESERVED!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_15_4_ENCRYPTION_KEY_4_RESERVED!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_15_4_ENCRYPTION_KEY_5_RESERVED!)
        
        configValues.append(WifiDevice.shared.WIFI_HR_CS_15_4_ENCRYPTION_KEY_6_RESERVED!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_15_4_ENCRYPTION_KEY_7_RESERVED!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CHD_DECIMAL_POINT!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CHD_ALARM_MIN_HYSTERESIS!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CHD_ALARM_MAX_HYSTERESIS!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CHD_ALARM_MIN_MAX_CLEAR_STATUS != false ? 0 : 1)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CHD_ENABLED != false ? 0 : 1)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CHD_COUNTING_MODE!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CHD_SENSOR_TYPE!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CHD_COUNTING_EDGE!)
        
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CHD_DEBOUNCE_TIME_ms!)
        
        let sensor_factor: UInt32 = WifiDevice.shared.WIFI_HR_CS_CHD_SENSOR_FACTOR_float!.bitPattern
        configValues.append(Int(sensor_factor) >> 16)//high
        configValues.append(Int(sensor_factor) & 0xFFFF)//Low
        
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CHD_SENSOR_UNIT!)
        let user_scale_factor: UInt32 = WifiDevice.shared.WIFI_HR_CS_CHD_USER_SCALE_FACTOR_float!.bitPattern
        configValues.append(Int(user_scale_factor) >> 16) // high
        configValues.append(Int(user_scale_factor) & 0xFFFF)// low
        
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CHD_USER_UNIT!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CHD_ENABLE_ALARM_MIN != false ? 0 :  1)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CHD_ENABLE_ALARM_MAX != false ? 0 : 1)
        return configValues
    }
    
    func validateConfig2() -> [Int]{
        var configValues = [Int]()
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CHD_ALARM_MIN!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CHD_ALARM_MAX!)
        
        let chdTagBytes = ParseUtils.shared.completeArray(bytes: ParseUtils.shared.getBytesFromString(string: WifiDevice.shared.WIFI_chd_tag), size: 16)
        var hi : UInt8 = 0
        var lo : UInt8 = 0
        for i in 0 ..< 16 {
            if (i % 2 == 0){
                hi = chdTagBytes[i]
            }
            else {
                lo = chdTagBytes[i]
                configValues.append(Int((Int(hi) & 0xFF) << 8) | (Int(lo) & 0xFF))
            }
        }
        let chdUnitTagBytes = ParseUtils.shared.completeArray(bytes: ParseUtils.shared.getBytesFromString(string: WifiDevice.shared.WIFI_chd_unit_tag), size: 8)
        hi = 0
        lo = 0
        for i in 0 ..< 8 {
            if (i % 2 == 0){
                hi = chdUnitTagBytes[i]
            }
            else {
                lo = chdUnitTagBytes[i]
                configValues.append(Int((Int(hi) & 0xFF) << 8) | (Int(lo) & 0xFF))
            }
        }
       
        configValues.append(WifiDevice.shared.WIFI_HR_CS_FREQUENCY_TO_FILTER!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH1_ENABLE != false ? 0 : 1)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH1_MODE!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH1_SENSOR_TYPE!)
            
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH1_UNIT!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH1_RANGE_MIN!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH1_RANGE_MAX!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH1_ENABLE_ALRM_MIN != false ? 0 : 1)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH1_ENABLE_ALRM_MAX != false ? 0 : 1)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH1_ALARM_MIN!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH1_ALARM_MAX!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH1_DECIMAL_POINT!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH1_GAIN_USER_RESERVED!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH1_OFFSET_USER!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_RESERVED_28!)
        
        let ch1TagBytes = ParseUtils.shared.completeArray(bytes: ParseUtils.shared.getBytesFromString(string: WifiDevice.shared.WIFI_ch1_tag), size: 16)
        hi = 0
        lo = 0
        for i in 0 ..< 16 {
            if (i % 2 == 0){
                hi = ch1TagBytes[i]
            }
            else {
                lo = ch1TagBytes[i]
                configValues.append(Int((Int(hi) & 0xFF) << 8) | (Int(lo) & 0xFF))
            }
        }
        let ch1UnitTagBytes = ParseUtils.shared.completeArray(bytes: ParseUtils.shared.getBytesFromString(string: WifiDevice.shared.WIFI_ch1_unit_tag), size: 8)
        hi = 0
        lo = 0
        for i in 0 ..< 8 {
            if (i % 2 == 0){
                hi = ch1UnitTagBytes[i]
            }
            else {
                lo = ch1UnitTagBytes[i]
                configValues.append(Int((Int(hi) & 0xFF) << 8) | (Int(lo) & 0xFF))
            }
        }
        configValues.append(WifiDevice.shared.WIFI_HR_CS_RESERVED_29!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH1_CUSTOM_CALIB_NUM_OF_POINTS!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH1_CUSTOM_CALIB_LOGBOX_1!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH1_CUSTOM_CALIB_LOGBOX_2!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH1_CUSTOM_CALIB_LOGBOX_3!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH1_CUSTOM_CALIB_LOGBOX_4!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH1_CUSTOM_CALIB_LOGBOX_5!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH1_CUSTOM_CALIB_LOGBOX_6!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH1_CUSTOM_CALIB_LOGBOX_7!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH1_CUSTOM_CALIB_LOGBOX_8!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH1_CUSTOM_CALIB_LOGBOX_9!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH1_CUSTOM_CALIB_LOGBOX_10!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH1_CUSTOM_CALIB_PADRAO_1!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH1_CUSTOM_CALIB_PADRAO_2!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH1_CUSTOM_CALIB_PADRAO_3!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH1_CUSTOM_CALIB_PADRAO_4!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH1_CUSTOM_CALIB_PADRAO_5!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH1_CUSTOM_CALIB_PADRAO_6!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH1_CUSTOM_CALIB_PADRAO_7!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH1_CUSTOM_CALIB_PADRAO_8!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH1_CUSTOM_CALIB_PADRAO_9!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH1_CUSTOM_CALIB_PADRAO_10!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH1_ALARM_MIN_HYSTERESIS!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH1_ALARM_MAX_HYSTERESIS!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH1_ALARM_MIN_MAX_CLEAR_STATUS != false ? 0 : 1)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_RESERVED_33!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_RESERVED_34!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH2_ENABLE != false ? 0 : 1)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH2_MODE!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH2_SENSOR_TYPE!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH2_UNIT!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH2_RANGE_MIN!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH2_RANGE_MAX!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH2_ENABLE_ALRM_MIN != false ? 0 : 1)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH2_ENABLE_ALRM_MAX != false ? 0 : 1)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH2_ALARM_MIN!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH2_ALARM_MAX!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH2_DECIMAL_POINT!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH2_GAIN_USER_RESERVED!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH2_OFFSET_USER!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_RESERVED_36!)
        
        let ch2TagBytes = ParseUtils.shared.completeArray(bytes: ParseUtils.shared.getBytesFromString(string: WifiDevice.shared.WIFI_ch2_tag), size: 16)
        hi = 0
        lo = 0
        for i in 0 ..< 16 {
            if (i % 2 == 0){
                hi = ch2TagBytes[i]
            }
            else {
                lo = ch2TagBytes[i]
                configValues.append(Int((Int(hi) & 0xFF) << 8) | (Int(lo) & 0xFF))
            }
        }
        let ch2UnitTagBytes = ParseUtils.shared.completeArray(bytes: ParseUtils.shared.getBytesFromString(string: WifiDevice.shared.WIFI_ch2_unit_tag), size: 8)
        hi = 0
        lo = 0
        for i in 0 ..< 8 {
            if (i % 2 == 0){
                hi = ch2UnitTagBytes[i]
            }
            else {
                lo = ch2UnitTagBytes[i]
                configValues.append(Int((Int(hi) & 0xFF) << 8) | (Int(lo) & 0xFF))
            }
        }
        configValues.append(WifiDevice.shared.WIFI_HR_CS_RESERVED_37!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH2_CUSTOM_CALIB_NUM_OF_POINTS!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH2_CUSTOM_CALIB_LOGBOX_1!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH2_CUSTOM_CALIB_LOGBOX_2!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH2_CUSTOM_CALIB_LOGBOX_3!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH2_CUSTOM_CALIB_LOGBOX_4!)
        
        return configValues
    }
    
    func validateConfig3() -> [Int]{
        var configValues = [Int]()
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH2_CUSTOM_CALIB_LOGBOX_5!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH2_CUSTOM_CALIB_LOGBOX_6!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH2_CUSTOM_CALIB_LOGBOX_7!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH2_CUSTOM_CALIB_LOGBOX_8!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH2_CUSTOM_CALIB_LOGBOX_9!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH2_CUSTOM_CALIB_LOGBOX_10!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH2_CUSTOM_CALIB_PADRAO_1!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH2_CUSTOM_CALIB_PADRAO_2!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH2_CUSTOM_CALIB_PADRAO_3!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH2_CUSTOM_CALIB_PADRAO_4!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH2_CUSTOM_CALIB_PADRAO_5!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH2_CUSTOM_CALIB_PADRAO_6!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH2_CUSTOM_CALIB_PADRAO_7!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH2_CUSTOM_CALIB_PADRAO_8!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH2_CUSTOM_CALIB_PADRAO_9!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH2_CUSTOM_CALIB_PADRAO_10!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH2_ALARM_MIN_HYSTERESIS!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH2_ALARM_MAX_HYSTERESIS!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH2_ALARM_MIN_MAX_CLEAR_STATUS != false ? 0 : 1)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_RESERVED_41!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_RESERVED_42!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH3_ENABLE != false ? 0 : 1)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH3_MODE!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH3_SENSOR_TYPE!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH3_UNIT!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH3_RANGE_MIN!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH3_RANGE_MAX!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH3_ENABLE_ALRM_MIN != false ? 0 : 1)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH3_ENABLE_ALRM_MAX != false ? 0 : 1)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH3_ALARM_MIN!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH3_ALARM_MAX!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH3_DECIMAL_POINT!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH3_GAIN_USER_RESERVED!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH3_OFFSET_USER!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_RESERVED_44!)
        
        let ch3TagBytes = ParseUtils.shared.completeArray(bytes: ParseUtils.shared.getBytesFromString(string: WifiDevice.shared.WIFI_ch3_tag), size: 16)
        var hi: UInt8 = 0
        var lo: UInt8 = 0
        for i in 0 ..< 16 {
            if (i % 2 == 0){
                hi = ch3TagBytes[i]
            }
            else {
                lo = ch3TagBytes[i]
                configValues.append(Int((Int(hi) & 0xFF) << 8) | (Int(lo) & 0xFF))
            }
        }
        let ch3UnitTagBytes = ParseUtils.shared.completeArray(bytes: ParseUtils.shared.getBytesFromString(string: WifiDevice.shared.WIFI_ch3_unit_tag), size: 8)
        hi = 0
        lo = 0
        for i in 0 ..< 8 {
            if (i % 2 == 0){
                hi = ch3UnitTagBytes[i]
            }
            else {
                lo = ch3UnitTagBytes[i]
                configValues.append(Int((Int(hi) & 0xFF) << 8) | (Int(lo) & 0xFF))
            }
        }
        
        configValues.append(WifiDevice.shared.WIFI_HR_CS_RESERVED_45!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH3_CUSTOM_CALIB_NUM_OF_POINTS!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH3_CUSTOM_CALIB_LOGBOX_1!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH3_CUSTOM_CALIB_LOGBOX_2!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH3_CUSTOM_CALIB_LOGBOX_3!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH3_CUSTOM_CALIB_LOGBOX_4!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH3_CUSTOM_CALIB_LOGBOX_5!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH3_CUSTOM_CALIB_LOGBOX_6!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH3_CUSTOM_CALIB_LOGBOX_7!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH3_CUSTOM_CALIB_LOGBOX_8!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH3_CUSTOM_CALIB_LOGBOX_9!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH3_CUSTOM_CALIB_LOGBOX_10!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH3_CUSTOM_CALIB_PADRAO_1!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH3_CUSTOM_CALIB_PADRAO_2!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH3_CUSTOM_CALIB_PADRAO_3!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH3_CUSTOM_CALIB_PADRAO_4!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH3_CUSTOM_CALIB_PADRAO_5!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH3_CUSTOM_CALIB_PADRAO_6!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH3_CUSTOM_CALIB_PADRAO_7!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH3_CUSTOM_CALIB_PADRAO_8!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH3_CUSTOM_CALIB_PADRAO_9!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH3_CUSTOM_CALIB_PADRAO_10!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH3_ALARM_MIN_HYSTERESIS!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH3_ALARM_MAX_HYSTERESIS!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_CH3_ALARM_MIN_MAX_CLEAR_STATUS != false ? 0 : 1)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_RESERVED_49!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_RESERVED_50!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_RESERVED_51!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_RESERVED_52!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_RESERVED_53!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_RESERVED_54!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_RESERVED_55!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_ENABLE != false ? 0 : 1)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SSID_0_1!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SSID_2_3!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SSID_4_5!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SSID_6_7!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SSID_8_9!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SSID_10_11!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SSID_12_13!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SSID_14_15!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SSID_16_17!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SSID_18_19!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SSID_20_21!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SSID_22_23!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SSID_24_25!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SSID_26_27!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SSID_28_29!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SSID_30_31!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SSID_32_33!)
        let ssidBytes = ParseUtils.shared.completeArray(bytes: ParseUtils.shared.getBytesFromString(string: WifiDevice.shared.WIFI_ssid), size: 34)
        hi = 0
        lo = 0
        for i in 0 ..< 34 {
            if (i % 2 == 0){
                hi = ssidBytes[i]
            }
            else {
                lo = ssidBytes[i]
                configValues.append(Int((Int(hi) & 0xFF) << 8) | (Int(lo) & 0xFF))
            }
        }

        return configValues
    }
    func validateConfig4() -> [Int]{
        var configValues = [Int]()
        
        //20
        let wifiPassBytes = ParseUtils.shared.completeArray(bytes: ParseUtils.shared.getBytesFromString(string: WifiDevice.shared.WIFI_HR_CS_WIFI_PASS), size: 40)
        var hi: UInt8 = 0
        var lo: UInt8 = 0
        for i in 0 ..< 40 {
            if (i % 2 == 0){
                hi = wifiPassBytes[i]
            }
            else {
                lo = wifiPassBytes[i]
                configValues.append(Int((Int(hi) & 0xFF) << 8) | (Int(lo) & 0xFF))
            }
        }
        
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_IP_STATIC_DHCP != false ? 0 : 1)
        
        let ipArray = WifiDevice.shared.WIFI_config_ip_address .components(separatedBy: ".")
        configValues.append((Int(ipArray[0])! << 8) | (Int(ipArray[1])! & 0xffff))
        configValues.append((Int(ipArray[2])! << 8) | (Int(ipArray[3])! & 0xffff))
        let ipMaskArray = WifiDevice.shared.WIFI_config_ip_mask.components(separatedBy: ".")
        configValues.append((Int(ipMaskArray[0])! << 8) | (Int(ipMaskArray[1])! & 0xffff))
        configValues.append((Int(ipMaskArray[2])! << 8) | (Int(ipMaskArray[3])! & 0xffff))
        let ipGatewayArray = WifiDevice.shared.WIFI_config_ip_gateway.components(separatedBy: ".")
        configValues.append((Int(ipGatewayArray[0])! << 8) | (Int(ipGatewayArray[1])! & 0xffff))
        configValues.append((Int(ipGatewayArray[2])! << 8) | (Int(ipGatewayArray[3])! & 0xffff))
        let ipDnsArray = WifiDevice.shared.WIFI_config_ip_dns.components(separatedBy: ".")
        configValues.append((Int(ipDnsArray[0])! << 8) | (Int(ipDnsArray[1])! & 0xffff))
        configValues.append((Int(ipDnsArray[2])! << 8) | (Int(ipDnsArray[3])! & 0xffff))
        
        //20
        let hashBytes = ParseUtils.shared.completeArray(bytes: ParseUtils.shared.getBytesFromString(string: WifiDevice.shared.WIFI_hash), size: 40)
        hi = 0
        lo = 0
        for i in 0 ..< 40 {
            if (i % 2 == 0){
                hi = hashBytes[i]
            }
            else {
                lo = hashBytes[i]
                configValues.append(Int((Int(hi) & 0xFF) << 8) | (Int(lo) & 0xFF))
            }
        }
        
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_MQTT_ENABLE != false ? 0 : 1)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_MQTT_SERVICE_PORT!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_MQTT_QOS!)
        
        //30
        let mqttBroakerUrlBytes = ParseUtils.shared.completeArray(bytes: ParseUtils.shared.getBytesFromString(string: WifiDevice.shared.WIFI_mqtt_broker_url), size: 60)
        hi = 0
        lo = 0
        for i in 0 ..< 60 {
            if (i % 2 == 0){
                hi = mqttBroakerUrlBytes[i]
            }
            else {
                lo = mqttBroakerUrlBytes[i]
                configValues.append(Int((Int(hi) & 0xFF) << 8) | (Int(lo) & 0xFF))
            }
        }
        
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_MQTT_BROKER_USER_00_01!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_MQTT_BROKER_USER_02_03!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_MQTT_BROKER_USER_04_05!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_MQTT_BROKER_USER_06_07!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_MQTT_BROKER_USER_08_09!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_MQTT_BROKER_USER_10_11!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_MQTT_BROKER_USER_12_13!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_MQTT_BROKER_USER_14_15!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_MQTT_BROKER_USER_16_17!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_MQTT_BROKER_USER_18_19!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_MQTT_BROKER_USER_20_21!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_MQTT_BROKER_USER_22_23!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_MQTT_BROKER_USER_24_25!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_MQTT_BROKER_USER_26_27!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_MQTT_BROKER_USER_28_29!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_MQTT_BROKER_USER_30_31!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_MQTT_BROKER_USER_32_33!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_MQTT_BROKER_USER_34_35!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_MQTT_BROKER_USER_36_37!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_MQTT_BROKER_USER_38_39!)
        
        //20
        let mqttBroakerUserBytes = ParseUtils.shared.completeArray(bytes: ParseUtils.shared.getBytesFromString(string: WifiDevice.shared.WIFI_mqtt_broker_user), size: 40)
        hi = 0
        lo = 0
        for i in 0 ..< 40 {
            if (i % 2 == 0){
                hi = mqttBroakerUserBytes[i]
            }
            else {
                lo = mqttBroakerUserBytes[i]
                configValues.append(Int((Int(hi) & 0xFF) << 8) | (Int(lo) & 0xFF))
            }
        }
        
        return configValues
    }
    
    func validateConfig5() -> [Int]{
        var configValues = [Int]()
    
        //20
        let mqttBrokerPassBytes = ParseUtils.shared.completeArray(bytes: ParseUtils.shared.getBytesFromString(string: WifiDevice.shared.WIFI_mqtt_broker_pass), size: 40)
        var hi: UInt8 = 0
        var lo: UInt8 = 0
        for i in 0 ..< 40 {
            if (i % 2 == 0){
                hi = mqttBrokerPassBytes[i]
            }
            else {
                lo = mqttBrokerPassBytes[i]
                configValues.append(Int((Int(hi) & 0xFF) << 8) | (Int(lo) & 0xFF))
            }
        }
       
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_MQTT_JSON_TIMESTAMP != false ? 0 : 1)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_MQTT_JSON_STRUCTURE_STATIC!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_MQTT_JSON_BOOL_FORMAT != false ? 0 : 1)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_MQTT_CLEAN_MODE != false ? 0 : 1)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_MQTT_TLS_TYPE!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_MQTT_PERMISSION!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_MQTT_RESERVED_02!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_MQTT_RESERVED_03!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_MQTT_RESERVED_04!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_MQTT_RESERVED_05!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_MQTT_RESERVED_06!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_MQTT_RESERVED_07!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_MQTT_RESERVED_08!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_MQTT_RESERVED_09!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_MQTT_RESERVED_10!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_MQTT_RESERVED_11!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_MQTT_RESERVED_12!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_MODBUS_TCP_ENABLED != false ? 0 : 1)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_MODBUS_TCP_PORT!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_MODBUS_TCP_PERMISSION!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_MODBUS_TCP_RESERVED_1!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_MODBUS_TCP_RESERVED_2!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_MODBUS_TCP_RESERVED_3!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_MODBUS_TCP_RESERVED_4!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_MODBUS_TCP_RESERVED_5!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_MODBUS_TCP_RESERVED_6!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_MODBUS_TCP_RESERVED_7!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_MODBUS_TCP_RESERVED_8!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_ENABLED != false ? 0 : 1)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_PORT!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_SERVER_TYPE!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_ARRAY_CONTACTS_ENABLED!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_RESERVED_01!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_RESERVED_02!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_RESERVED_03!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_RESERVED_04!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_RESERVED_05!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_RESERVED_06!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_RESERVED_07!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_RESERVED_08!)
        
        
        //30
        let smtpUrlBytes = ParseUtils.shared.completeArray(bytes: ParseUtils.shared.getBytesFromString(string: WifiDevice.shared.WIFI_smtp_url), size: 60)
        hi = 0
        lo = 0
        for i in 0 ..< 60 {
            if (i % 2 == 0){
                hi = smtpUrlBytes[i]
            }
            else {
                lo = smtpUrlBytes[i]
                configValues.append(Int((Int(hi) & 0xFF) << 8) | (Int(lo) & 0xFF))
            }
        }
        
        return configValues
    }
    
    func validateConfig6() -> [Int]{
        var configValues = [Int]()
        
        //25
        let smtpUserBytes = ParseUtils.shared.completeArray(bytes: ParseUtils.shared.getBytesFromString(string: WifiDevice.shared.WIFI_smtp_user), size: 50)
        var hi: UInt8 = 0
        var lo: UInt8 = 0
        for i in 0 ..< 50 {
            if (i % 2 == 0){
                hi = smtpUserBytes[i]
            }
            else {
                lo = smtpUserBytes[i]
                configValues.append(Int((Int(hi) & 0xFF) << 8) | (Int(lo) & 0xFF))
            }
        }
        //20
        let smtpPasswordBytes = ParseUtils.shared.completeArray(bytes: ParseUtils.shared.getBytesFromString(string: WifiDevice.shared.WIFI_smtp_password), size: 40)
        hi = 0
        lo = 0
        for i in 0 ..< 40 {
            if (i % 2 == 0){
                hi = smtpPasswordBytes[i]
            }
            else {
                lo = smtpPasswordBytes[i]
                configValues.append(Int((Int(hi) & 0xFF) << 8) | (Int(lo) & 0xFF))
            }
        }
        //25
        let smtpSenderBytes = ParseUtils.shared.completeArray(bytes: ParseUtils.shared.getBytesFromString(string: WifiDevice.shared.WIFI_smtp_sender), size: 50)
        hi = 0
        lo = 0
        for i in 0 ..< 50 {
            if (i % 2 == 0){
                hi = smtpSenderBytes[i]
            }
            else {
                lo = smtpSenderBytes[i]
                configValues.append(Int((Int(hi) & 0xFF) << 8) | (Int(lo) & 0xFF))
            }
        }
        //20
        let smtpSubjectBytes = ParseUtils.shared.completeArray(bytes: ParseUtils.shared.getBytesFromString(string: WifiDevice.shared.WIFI_smtp_subject), size: 40)
        hi = 0
        lo = 0
        for i in 0 ..< 40 {
            if (i % 2 == 0){
                hi = smtpSubjectBytes[i]
            }
            else {
                lo = smtpSubjectBytes[i]
                configValues.append(Int((Int(hi) & 0xFF) << 8) | (Int(lo) & 0xFF))
            }
        }
        
       
        return configValues
    }
    
    func validateConfig7() -> [Int]{
        var configValues = [Int]()
  
        //30
        let smtpEmailBytes = ParseUtils.shared.completeArray(bytes: ParseUtils.shared.getBytesFromString(string: WifiDevice.shared.WIFI_smtp_email_frame), size: 60)
        var hi: UInt8 = 0
        var lo: UInt8 = 0
        for i in 0 ..< 60 {
            if (i % 2 == 0){
                hi = smtpEmailBytes[i]
            }
            else {
                lo = smtpEmailBytes[i]
                configValues.append(Int((Int(hi) & 0xFF) << 8) | (Int(lo) & 0xFF))
            }
        }
        //25
        let smtpContactABytes = ParseUtils.shared.completeArray(bytes: ParseUtils.shared.getBytesFromString(string: WifiDevice.shared.WIFI_smpt_receiver_contact_a), size: 50)
        hi = 0
        lo = 0
        for i in 0 ..< 50 {
            if (i % 2 == 0){
                hi = smtpContactABytes[i]
            }
            else {
                lo = smtpContactABytes[i]
                configValues.append(Int((Int(hi) & 0xFF) << 8) | (Int(lo) & 0xFF))
            }
        }
        //25
        let smtpContactBBytes = ParseUtils.shared.completeArray(bytes: ParseUtils.shared.getBytesFromString(string: WifiDevice.shared.WIFI_smpt_receiver_contact_b), size: 50)
        hi = 0
        lo = 0
        for i in 0 ..< 50 {
            if (i % 2 == 0){
                hi = smtpContactBBytes[i]
            }
            else {
                lo = smtpContactBBytes[i]
                configValues.append(Int((Int(hi) & 0xFF) << 8) | (Int(lo) & 0xFF))
            }
        }
        //25
        let smtpContactCBytes = ParseUtils.shared.completeArray(bytes: ParseUtils.shared.getBytesFromString(string: WifiDevice.shared.WIFI_smpt_receiver_contact_c), size: 50)
        hi = 0
        lo = 0
        for i in 0 ..< 50 {
            if (i % 2 == 0){
                hi = smtpContactCBytes[i]
            }
            else {
                lo = smtpContactCBytes[i]
                configValues.append(Int((Int(hi) & 0xFF) << 8) | (Int(lo) & 0xFF))
            }
        }
        
       
        return configValues
    }
    
    func validateConfig8() -> [Int]{
        var configValues = [Int]()
        //25
        let smtpContactDBytes = ParseUtils.shared.completeArray(bytes: ParseUtils.shared.getBytesFromString(string: WifiDevice.shared.WIFI_smpt_receiver_contact_d), size: 50)
        var hi: UInt8 = 0
        var lo: UInt8 = 0
        for i in 0 ..< 50 {
            if (i % 2 == 0){
                hi = smtpContactDBytes[i]
            }
            else {
                lo = smtpContactDBytes[i]
                configValues.append(Int((Int(hi) & 0xFF) << 8) | (Int(lo) & 0xFF))
            }
        }
        //25
        let smtpContactEBytes = ParseUtils.shared.completeArray(bytes: ParseUtils.shared.getBytesFromString(string: WifiDevice.shared.WIFI_smpt_receiver_contact_e), size: 50)
        hi = 0
        lo = 0
        for i in 0 ..< 50 {
            if (i % 2 == 0){
                hi = smtpContactEBytes[i]
            }
            else {
                lo = smtpContactEBytes[i]
                configValues.append(Int((Int(hi) & 0xFF) << 8) | (Int(lo) & 0xFF))
            }
        }
        //25
        let smtpContactFBytes = ParseUtils.shared.completeArray(bytes: ParseUtils.shared.getBytesFromString(string: WifiDevice.shared.WIFI_smpt_receiver_contact_f), size: 50)
        hi = 0
        lo = 0
        for i in 0 ..< 50 {
            if (i % 2 == 0){
                hi = smtpContactFBytes[i]
            }
            else {
                lo = smtpContactFBytes[i]
                configValues.append(Int((Int(hi) & 0xFF) << 8) | (Int(lo) & 0xFF))
            }
        }
       
        //25
        let smtpContactGBytes = ParseUtils.shared.completeArray(bytes: ParseUtils.shared.getBytesFromString(string: WifiDevice.shared.WIFI_smpt_receiver_contact_g), size: 50)
        hi = 0
        lo = 0
        for i in 0 ..< 50 {
            if (i % 2 == 0){
                hi = smtpContactGBytes[i]
            }
            else {
                lo = smtpContactGBytes[i]
                configValues.append(Int((Int(hi) & 0xFF) << 8) | (Int(lo) & 0xFF))
            }
        }
        return configValues
    }
    
    func validateConfig9() -> [Int]{
        var configValues = [Int]()
        //25
        let smtpContactHBytes = ParseUtils.shared.completeArray(bytes: ParseUtils.shared.getBytesFromString(string: WifiDevice.shared.WIFI_smpt_receiver_contact_h), size: 50)
        var hi: UInt8 = 0
        var lo: UInt8 = 0
        for i in 0 ..< 50 {
            if (i % 2 == 0){
                hi = smtpContactHBytes[i]
            }
            else {
                lo = smtpContactHBytes[i]
                configValues.append(Int((Int(hi) & 0xFF) << 8) | (Int(lo) & 0xFF))
            }
        }
        //25
        let smtpContactIBytes = ParseUtils.shared.completeArray(bytes: ParseUtils.shared.getBytesFromString(string: WifiDevice.shared.WIFI_smpt_receiver_contact_i), size: 50)
        hi = 0
        lo = 0
        for i in 0 ..< 50 {
            if (i % 2 == 0){
                hi = smtpContactIBytes[i]
            }
            else {
                lo = smtpContactIBytes[i]
                configValues.append(Int((Int(hi) & 0xFF) << 8) | (Int(lo) & 0xFF))
            }
        }
        //25
        let smtpContactJBytes = ParseUtils.shared.completeArray(bytes: ParseUtils.shared.getBytesFromString(string: WifiDevice.shared.WIFI_smpt_receiver_contact_j), size: 50)
        hi = 0
        lo = 0
        for i in 0 ..< 50 {
            if (i % 2 == 0){
                hi = smtpContactJBytes[i]
            }
            else {
                lo = smtpContactJBytes[i]
                configValues.append(Int((Int(hi) & 0xFF) << 8) | (Int(lo) & 0xFF))
            }
        }
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_RESERVED_14!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_RESERVED_15!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_RESERVED_16!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_RESERVED_17!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_RESERVED_18!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_RESERVED_19!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_RESERVED_20!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_RESERVED_21!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_RESERVED_22!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_RESERVED_23!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_RESERVED_24!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_RESERVED_25!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_RESERVED_26!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_RESERVED_27!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_RESERVED_28!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_RESERVED_29!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_RESERVED_30!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_RESERVED_31!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_RESERVED_32!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_RESERVED_33!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_RESERVED_34!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_RESERVED_35!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_RESERVED_36!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_RESERVED_37!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_RESERVED_38!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_RESERVED_39!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_RESERVED_40!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_RESERVED_41!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_RESERVED_42!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_RESERVED_43!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_RESERVED_44!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_RESERVED_45!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_RESERVED_46!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_RESERVED_47!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_RESERVED_48!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_RESERVED_49!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_RESERVED_50!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_RESERVED_51!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_RESERVED_52!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_RESERVED_53!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_SMTP_RESERVED_54!)
        return configValues
    }
    func validateConfig10() -> [Int]{
        var configValues = [Int]()
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_WEBPAGE_ENABLED != false ? 0 : 1)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_WEBPAGE_PORT!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_WEBPAGE_REFRESH_TIME!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_WEBPAGE_RESERVED_01!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_WEBPAGE_RESERVED_02!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_WEBPAGE_RESERVED_03!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_WEBPAGE_RESERVED_04!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_WEBPAGE_RESERVED_05!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_WEBPAGE_RESERVED_06!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_WEBPAGE_RESERVED_07!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_WEBPAGE_RESERVED_08!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_WEBPAGE_RESERVED_09!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_WEBPAGE_RESERVED_10!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_FTP_ENABLED != false ? 0 : 1)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_FTP_PORT!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_FTP_SEND_FREQUENCY!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_FTP_FILE_FORMAT!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_FTP_RESERVED_01!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_FTP_RESERVED_02!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_FTP_RESERVED_03!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_FTP_RESERVED_04!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_FTP_RESERVED_05!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_FTP_RESERVED_06!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_FTP_RESERVED_07!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_FTP_RESERVED_08!)
        
        //30
        let ftpUrlBytes = ParseUtils.shared.completeArray(bytes: ParseUtils.shared.getBytesFromString(string: WifiDevice.shared.WIFI_ftp_url), size: 60)
        var hi: UInt8 = 0
        var lo: UInt8 = 0
        for i in 0 ..< 60 {
            if (i % 2 == 0){
                hi = ftpUrlBytes[i]
            }
            else {
                lo = ftpUrlBytes[i]
                configValues.append(Int((Int(hi) & 0xFF) << 8) | (Int(lo) & 0xFF))
            }
        }
        //25
        let ftpUserBytes = ParseUtils.shared.completeArray(bytes: ParseUtils.shared.getBytesFromString(string: WifiDevice.shared.WIFI_ftp_user), size: 50)
        hi = 0
        lo = 0
        for i in 0 ..< 50 {
            if (i % 2 == 0){
                hi = ftpUserBytes[i]
            }
            else {
                lo = ftpUserBytes[i]
                configValues.append(Int((Int(hi) & 0xFF) << 8) | (Int(lo) & 0xFF))
            }
        }
     
        //20
        let ftpPassBytes = ParseUtils.shared.completeArray(bytes: ParseUtils.shared.getBytesFromString(string: WifiDevice.shared.WIFI_ftp_password), size: 40)
        hi = 0
        lo = 0
        for i in 0 ..< 40 {
            if (i % 2 == 0){
                hi = ftpPassBytes[i]
            }
            else {
                lo = ftpPassBytes[i]
                configValues.append(Int((Int(hi) & 0xFF) << 8) | (Int(lo) & 0xFF))
            }
        }
        
        return configValues
    }
    func validateConfig11() -> [Int]{
        var configValues = [Int]()
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_FTP_RESERVED2_08!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_FTP_RESERVED_09!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_FTP_RESERVED_10!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_FTP_RESERVED_11!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_FTP_RESERVED_12!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_FTP_RESERVED_13!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_FTP_RESERVED_14!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_FTP_RESERVED_15!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_FTP_RESERVED_16!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_FTP_RESERVED_17!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_FTP_RESERVED_18!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_FTP_RESERVED_19!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_FTP_RESERVED_20!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_FTP_RESERVED_21!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_FTP_RESERVED_22!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_FTP_RESERVED_23!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_FTP_RESERVED_24!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_FTP_RESERVED_25!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_FTP_RESERVED_26!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_FTP_RESERVED_27!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_CLOUD_ENABLED != false ? 0 : 1)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_CLOUD_CHANNELS_TO_SEND!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_CLOUD_FREQUENCY!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_CLOUD_UPDATE_CLOCK != false ? 0 : 1)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_CLOUD_RESERVED_01!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_CLOUD_RESERVED_02!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_CLOUD_RESERVED_03!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_CLOUD_RESERVED_04!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_CLOUD_RESERVED_05!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_CLOUD_RESERVED_06!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_CLOUD_RESERVED_07!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_CLOUD_RESERVED_08!)
        
        //30
        let cloudUrlBytes = ParseUtils.shared.completeArray(bytes: ParseUtils.shared.getBytesFromString(string: WifiDevice.shared.WIFI_cloud_url), size: 60)
        var hi: UInt8 = 0
        var lo: UInt8 = 0
        for i in 0 ..< 60 {
            if (i % 2 == 0){
                hi = cloudUrlBytes[i]
            }
            else {
                lo = cloudUrlBytes[i]
                configValues.append(Int((Int(hi) & 0xFF) << 8) | (Int(lo) & 0xFF))
            }
        }
        
        //20
        let cloudCikBytes = ParseUtils.shared.completeArray(bytes: ParseUtils.shared.getBytesFromString(string: WifiDevice.shared.WIFI_cloud_cik), size: 40)
        hi = 0
        lo = 0
        for i in 0 ..< 40 {
            if (i % 2 == 0){
                hi = cloudCikBytes[i]
            }
            else {
                lo = cloudCikBytes[i]
                configValues.append(Int((Int(hi) & 0xFF) << 8) | (Int(lo) & 0xFF))
            }
        }
       
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_CLOUD_RESERVED_09!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_CLOUD_RESERVED_10!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_CLOUD_RESERVED_11!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_CLOUD_RESERVED_12!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_CLOUD_RESERVED_13!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_CLOUD_RESERVED_14!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_CLOUD_RESERVED_15!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_CLOUD_RESERVED_16!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_CLOUD_RESERVED_17!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_CLOUD_RESERVED_18!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_CLOUD_RESERVED_19!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_CLOUD_RESERVED_20!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_CLOUD_RESERVED_21!)
        configValues.append(WifiDevice.shared.WIFI_HR_CS_WIFI_CLOUD_RESERVED_22!)
        return configValues
    }
}
