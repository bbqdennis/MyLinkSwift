//
//  CMHKValueAddedRecordListView.swift
//  MyLinkSwift
//
//  Created by Dennis CHENG Kin Hang on 16/10/2019.
//  Copyright © 2019 Dennis CHENG Kin Hang. All rights reserved.
//

import UIKit

// MARK: Constants
private let kTopHeaderViewHeight: CGFloat = 48.0
private let kTopDescriptionLabelHeight: CGFloat = 20.0
private let kTopDescriptionLabelHorizontalPadding: CGFloat = 20.0

class CMHKValueAddedRecordListView: CMHKVCBaseView {

    // MARK: Declare
    public let topHeaderView = CMHKBaseView()
    private let topDescriptionLabel = CMHKBaseLabel()
    
    // MARK: Init
    override init (frame : CGRect) {
        super.init(frame : frame)
        // Do what you want.
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        setupAll()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: Setup
    private func setupAll() {
        
        setup();
        setupLayer();
        setupConstraints();
    }
    
    private func setup() {
        
        setupSelf();
        setupTopHeaderView()
        setupTopDescriptionLabel()
    }
    
    private func setupSelf() {
        
        self.backgroundColor = UIColor.clear
    }
    
    private func setupTopHeaderView() {
        
        topHeaderView.backgroundColor = UIColor.clear
    }
    
    private func setupTopDescriptionLabel() {
        
        topDescriptionLabel.text = CMHKLocalizeHelper.getCMHKLocalizedString("valueaddedrecord_30day_value_added_record")
        topDescriptionLabel.numberOfLines = 0
        topDescriptionLabel.textColor = CMHKColorManager.subTextColor()
        topDescriptionLabel.font = CMHKFontManager.normalSubTextFont()
    }
    
    
    // MARK: Setup Layer
    private func setupLayer() {
        
        topHeaderView.addSubview(topDescriptionLabel)
    }
    
    // MARK: Setup Constraints
    private func setupConstraints() {
        
        setupTopHeaderViewConstraints()
        setupTopDescriptionLabelConstraints()
    }
    
    private func setupTopHeaderViewConstraints() {
        
        topHeaderView.width = self.width
        topHeaderView.height = kTopHeaderViewHeight
    }
    
    private func setupTopDescriptionLabelConstraints() {
        
        topDescriptionLabel.minX = kTopDescriptionLabelHorizontalPadding
        topDescriptionLabel.minRWidth = kTopDescriptionLabelHorizontalPadding
        topDescriptionLabel.height = kTopDescriptionLabelHeight
        topDescriptionLabel.midY = topHeaderView.height / 2
    }
    
    // MARK: Helper
    
    // MARK: Common
    
    // MARK: Action
    
    // MARK: Public
}
