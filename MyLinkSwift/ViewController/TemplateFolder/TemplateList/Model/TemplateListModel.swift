//
//  TemplateListModel.swift
//  MyLinkSwift
//
//  Created by Dennis CHENG Kin Hang on 16/10/2019.
//  Copyright © 2019 Dennis CHENG Kin Hang. All rights reserved.
//

import UIKit

class TemplateListModel: CMHKBaseModel {

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
        
        tableDataArray = ["Beach", "Clubs", "Chill", "Dance"]
    }
    
    // MARK: Helper
    
    // MARK: Public
    public func initModelData() {
        
        setup()
    }
    
    public func getCellViewModel(indexPath: IndexPath) -> TemplateViewModel {
        
        let aTemplateViewModel: TemplateViewModel = tableDataArray.object(at: indexPath.row) as! TemplateViewModel
        return aTemplateViewModel
    }
}
