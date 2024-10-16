//
//  CMHKValueAddedRecordListModel.swift
//  MyLinkSwift
//
//  Created by Dennis CHENG Kin Hang on 16/10/2019.
//  Copyright © 2019 Dennis CHENG Kin Hang. All rights reserved.
//

import UIKit

class CMHKValueAddedRecordListModel: CMHKBaseModel {
    
    public var tableDataArray: NSMutableArray = NSMutableArray()
    
    // MARK: Init
    override init() {

        super.init()
    }
    
    
    // MARK: Setup
    private func setup() {
        
        setupTableDataArray()
    }
    
    private func setupTableDataArray() {
        
        var aCMHKValueAddedRecordViewModel: CMHKValueAddedRecordViewModel
        var tempArray: NSMutableArray
        let jsonString: String = CMHKFileManager.shared().load(fromBundle: "valueaddedrecord_api.json", isData: false) as! String
        print(jsonString)
        var reuseIdentifier: String = kCMHKValueAddedRecordTableCellReuseIdentifier
        var index: NSInteger = 0
    
        if let aCMHKValueAddedRecordModel: CMHKValueAddedRecordModel = CMHKValueAddedRecordModel.deserialize(from: jsonString) {
            
            for aItemList: ValueAddedRecordItemList in aCMHKValueAddedRecordModel.data.item_list {
                
                tempArray = NSMutableArray()
                tableDataArray.add(tempArray)
                
                aCMHKValueAddedRecordViewModel = self.createCMHKValueAddedRecordViewModel(topic: aItemList.value_added_type_title, description: String(aItemList.value_added_total_amount), reuseIdentifier: kCMHKValueAddedRecordTableCellHeaderReuseIdentifier)
                tempArray.add(aCMHKValueAddedRecordViewModel)
                
                reuseIdentifier = kCMHKValueAddedRecordTableCellReuseIdentifier
                index = 0
                
                for aValueAddedInfoList: ValueAddedRecordValueAddedInfoList in aItemList.value_added_info_list {
                    
                    index += 1
                    reuseIdentifier = (index == aItemList.value_added_info_list.count) ? kCMHKValueAddedRecordTableCellFooterReuseIdentifier : kCMHKValueAddedRecordTableCellReuseIdentifier

                    aCMHKValueAddedRecordViewModel = self.createCMHKValueAddedRecordViewModel(topic: aValueAddedInfoList.value_added_info_title, description: aValueAddedInfoList.value_added_info_value, reuseIdentifier: reuseIdentifier)
                    tempArray.add(aCMHKValueAddedRecordViewModel)
                }
            }
        }
    }
    
    
    // MARK: Helper
    private func createCMHKValueAddedRecordViewModel(topic: String, description: String, reuseIdentifier: String) -> CMHKValueAddedRecordViewModel {
        
        let aCMHKValueAddedRecordViewModel: CMHKValueAddedRecordViewModel = CMHKValueAddedRecordViewModel()
        aCMHKValueAddedRecordViewModel.reuseIdentifier = reuseIdentifier
        aCMHKValueAddedRecordViewModel.topicString = topic
        aCMHKValueAddedRecordViewModel.descriptionString = description
        return aCMHKValueAddedRecordViewModel
    }
    
    // MARK: Public
    public func initModelData() {
        
        setup()
    }
    
    public func getCellViewModel(indexPath: IndexPath) -> CMHKValueAddedRecordViewModel {
        
        let modelArray: NSMutableArray = tableDataArray.object(at: indexPath.section) as! NSMutableArray
        let aCMHKValueAddedRecordViewModel: CMHKValueAddedRecordViewModel = modelArray.object(at: indexPath.row) as! CMHKValueAddedRecordViewModel
        return aCMHKValueAddedRecordViewModel
    }
}
