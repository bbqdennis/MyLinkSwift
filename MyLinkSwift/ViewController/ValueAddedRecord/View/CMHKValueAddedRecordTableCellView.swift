//
//  CMHKValueAddedRecordTableCellView.swift
//  MyLinkSwift
//
//  Created by Dennis CHENG Kin Hang on 16/10/2019.
//  Copyright © 2019 Dennis CHENG Kin Hang. All rights reserved.
//

import UIKit

// MARK: Constants
private let kCommonLabelHeight: CGFloat = 20.0
private let kCommonLabelVerticalPadding: CGFloat = 14.0
private let kWhiteBackgroundViewCornerRadius: CGFloat = 16.0
private let kWhiteBackgroundViewHorizontalPadding: CGFloat = 16.0
private let kTopicLabelHeight: CGFloat = 20.0

private let kTopicLabelHorizontalPadding: CGFloat = 20.0
private let kDescriptionabelHorizontalPadding: CGFloat = 8.0

class CMHKValueAddedRecordTableCellView: CMHKBaseView {

    // MARK: Declare
    public var isHeaderCell: Bool = false
    public var isFooterCell: Bool = false
    
    private let whiteBackgroundView = CMHKBaseView()
    private let topicLabel = CMHKBaseLabel()
    private let descriptionLabel = CMHKBaseLabel()
    
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
        setupWhiteBackgroundView()
        setupTopicLabel()
        setupDescriptionLabel()
    }
    
    private func setupSelf() {
        
        self.backgroundColor = UIColor.clear
        self.clipsToBounds = true
    }
    
    private func setupWhiteBackgroundView() {
        
        whiteBackgroundView.backgroundColor = CMHKColorManager.white()
        
        if isHeaderCell || isFooterCell {
            
            whiteBackgroundView.layer.cornerRadius = kWhiteBackgroundViewCornerRadius
        }
    }
    
    private func setupTopicLabel() {
        
        self.renewTopicLabelStatus(bold: isHeaderCell)
    }
    
    private func setupDescriptionLabel() {
        
        self.renewDescriptionLabelStatus(bold: isHeaderCell)
        descriptionLabel.textAlignment = NSTextAlignment.right
    }
    
    // MARK: Setup Layer
    private func setupLayer() {
        
        self.addSubview(whiteBackgroundView)
        whiteBackgroundView.addSubview(topicLabel)
        whiteBackgroundView.addSubview(descriptionLabel)
    }
    
    // MARK: Setup Constraints
    private func setupConstraints() {
        
        setupWhiteBackgroundViewConstraints()
        setupTopicLabelConstraints()
        setupDescriptionLabelConstraints()
    }
    
    private func setupWhiteBackgroundViewConstraints() {
        
        whiteBackgroundView.minX = kWhiteBackgroundViewHorizontalPadding
        whiteBackgroundView.minRWidth = kWhiteBackgroundViewHorizontalPadding
        whiteBackgroundView.height = self.height
        
        if isHeaderCell || isFooterCell {
            
            whiteBackgroundView.height += whiteBackgroundView.layer.cornerRadius
            
            if isFooterCell {
                
                whiteBackgroundView.minRY = 0.0
            }
        }
    }
    
    private func setupTopicLabelConstraints() {
        
        topicLabel.height = kCommonLabelHeight
        topicLabel.minX = kTopicLabelHorizontalPadding
        topicLabel.maxWidth = whiteBackgroundView.width / 2
        
        if isFooterCell {
            
            topicLabel.minRY = kCommonLabelVerticalPadding
            
        } else {
            
            topicLabel.minY = kCommonLabelVerticalPadding
        }
        //topicLabel.backgroundColor = UIColor.yellow
    }
    
    private func setupDescriptionLabelConstraints() {
        
        descriptionLabel.height = kCommonLabelHeight
        descriptionLabel.minX = topicLabel.maxX
        descriptionLabel.width = topicLabel.width
        descriptionLabel.midY = topicLabel.midY
        
        //print("BUG CHECK \(self.height) \(whiteBackgroundView.height)")
        //descriptionLabel.backgroundColor = UIColor.green
    }
    
    // MARK: Helper
    
    // MARK: Common
    private func renewTopicLabelStatus(bold: Bool) {
        
        if bold {
            
            topicLabel.textColor = CMHKColorManager.mainTextColor()
            topicLabel.font = CMHKFontManager.middleMainTextFont()
            
        } else {
            
            topicLabel.textColor = CMHKColorManager.mainTextColor()
            topicLabel.font = CMHKFontManager.normalMainTextFont()
        }
    }
    
    private func renewDescriptionLabelStatus(bold: Bool) {
        
        if bold {
            
            descriptionLabel.textColor = CMHKColorManager.lightPurpleColor()
            descriptionLabel.font = CMHKFontManager.middleMainTextFont()
            
        } else {
            
            descriptionLabel.textColor = CMHKColorManager.subTextColor()
            descriptionLabel.font = CMHKFontManager.normalMainTextFont()
        }
    }
    
    // MARK: Action
    
    // MARK: Public
    public func renewTopicLabel(text: String) {
        
        topicLabel.text = text
    }
    
    public func renewDescriptionLabel(text: String) {
        
        descriptionLabel.text = text
    }
    
    public func renewContent(topic: String, description: String) {
        
        self.renewTopicLabel(text: topic)
        self.renewDescriptionLabel(text: description)
    }
}


