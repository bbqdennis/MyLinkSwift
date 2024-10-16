//
//  CMHKValueAddedRecordTableCell.swift
//  MyLinkSwift
//
//  Created by Dennis CHENG Kin Hang on 16/10/2019.
//  Copyright © 2019 Dennis CHENG Kin Hang. All rights reserved.
//

import UIKit

// MARK: Constants
private let kDefaultValueAddedRecordTableCellHeight: CGFloat = 48.0
public let kCMHKValueAddedRecordTableCellReuseIdentifier: String = "CMHKValueAddedRecordTableCell"
public let kCMHKValueAddedRecordTableCellHeaderReuseIdentifier: String = "CMHKValueAddedRecordTableCell_Header"
public let kCMHKValueAddedRecordTableCellFooterReuseIdentifier: String = "CMHKValueAddedRecordTableCell_Footer"

class CMHKValueAddedRecordTableCell: UITableViewCell {
    
    // MARK: Declare
    private var haveAlreadySetup : Bool = false
    let cellView = CMHKValueAddedRecordTableCellView()
    
    // MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: Setup
    private func setup() {
        
        selfSetup();
        cellViewSetup();
    }
    
    private func selfSetup() {
        
        self.backgroundColor = UIColor.clear
        self.selectionStyle = UITableViewCell.SelectionStyle.none;
    }
    
    private func cellViewSetup() {
        
        // Do any additional setup after loading the view.
        if !haveAlreadySetup {
               
            haveAlreadySetup = true
            
            if self.reuseIdentifier!.isEqual(kCMHKValueAddedRecordTableCellHeaderReuseIdentifier) {
                
                cellView.isHeaderCell = true
                
            } else if self.reuseIdentifier!.isEqual(kCMHKValueAddedRecordTableCellFooterReuseIdentifier) {
                
                cellView.isFooterCell = true
            }
            cellView.width = UIScreen.main.bounds.width
            cellView.height = kDefaultValueAddedRecordTableCellHeight
        
            // Warning!! must set the cellView frame first before addSubview
            self.contentView.addSubview(cellView)
        }
    }
    
    // MARK: Helper
    
    // MARK: Common
    
    // MARK: Action
    
    // MARK: Override
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    // MARK: Public
    class func height() -> CGFloat {
        
        return kDefaultValueAddedRecordTableCellHeight
    }
}

