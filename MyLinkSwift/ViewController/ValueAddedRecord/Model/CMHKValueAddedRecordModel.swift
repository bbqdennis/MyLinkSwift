// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let cMHKValueAddedRecordModel = try? newJSONDecoder().decode(CMHKValueAddedRecordModel.self, from: jsonData)

import Foundation
import HandyJSON

// MARK: - CMHKValueAddedRecordModel
class CMHKValueAddedRecordModel: CMHKBaseModel, HandyJSON {
    var result: ValueAddedRecordResult! = ValueAddedRecordResult()
    var data: ValueAddedRecordDataClass! = ValueAddedRecordDataClass()
    required override init() {}
}

// MARK: - DataClass
class ValueAddedRecordDataClass: HandyJSON {
    var last_value_added_id: Int = 0
    var item_list: [ValueAddedRecordItemList]! = []
    required init() {}
}

// MARK: - ItemList
class ValueAddedRecordItemList: HandyJSON {
    var value_added_id: Int = 0
    var value_added_type_title: String = ""
    var value_added_total_amount: Double = 0.0
    var value_added_info_list: [ValueAddedRecordValueAddedInfoList]! = []
    required init() {}
}

// MARK: - ValueAddedInfoList
class ValueAddedRecordValueAddedInfoList: HandyJSON {
    var value_added_info_title: String = ""
    var value_added_info_value: String = ""
    required init() {}
}

// MARK: - Result
class ValueAddedRecordResult: HandyJSON {
    var returnCode: Int = 0
    var returnDesc: String = ""
    required init() {}
}
