//
//  SampleModel.swift
//  MyLinkSwift
//
//  Created by Dennis CHENG Kin Hang on 8/10/2019.
//  Copyright © 2019 Dennis CHENG Kin Hang. All rights reserved.
//

import Foundation
import HandyJSON
import JSONModel

class SampleModel: HandyJSON {

    var phone_number: Int?
    var address: String?  = ""
    
    required init() {}
}
