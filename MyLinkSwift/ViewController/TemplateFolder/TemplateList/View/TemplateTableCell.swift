//
//  TemplateTableCell.swift
//  MyLinkSwift
//
//  Created by Dennis CHENG Kin Hang on 16/10/2019.
//  Copyright © 2019 Dennis CHENG Kin Hang. All rights reserved.
//

import UIKit

// MARK: Constants
private let kDefaultTableCellHeight : CGFloat = 44.0

class TemplateTableCell: UITableViewCell {
    
    // MARK: Declare
    private var haveAlreadySetup : Bool = false
    let cellView = TemplateTableCellView()
    
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
            
            cellView.width = UIScreen.main.bounds.width
            cellView.height = kDefaultTableCellHeight
        
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
        
        return kDefaultTableCellHeight
    }
}
