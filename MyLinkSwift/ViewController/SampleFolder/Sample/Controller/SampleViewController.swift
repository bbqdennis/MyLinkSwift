//
//  SampleViewController.swift
//  MyLinkSwift
//
//  Created by Dennis CHENG Kin Hang on 15/10/2019.
//  Copyright © 2019 Dennis CHENG Kin Hang. All rights reserved.
//

import UIKit

class SampleViewController: UIViewController {
    
    // MARK: - Payment
    struct Payment: Codable {
        let phoneNumber: Int
        let address: String

        enum CodingKeys: String, CodingKey {
            case phoneNumber = "phone_number"
            case address
        }
        
        /// The function responsible of encoding data
        func encode(to encoder: Encoder) throws {
          var container = encoder.container(keyedBy: CodingKeys.self)
          try container.encode(phoneNumber, forKey: .phoneNumber)
          try container.encode(address, forKey: .address)
        }
        
        /// The initialiser that decodes data into a Person instance
        init(from decoder: Decoder) throws {
          let values = try decoder.container(keyedBy: CodingKeys.self)
            
            // 这样处理，不怕服务器返回数据没有字段
            phoneNumber = (try? values.decode(Int.self, forKey: .phoneNumber)) ?? -1
            address = (try? values.decode(String.self, forKey: .address)) ?? ""
        }
    }
    
    func parseJSON() {
        
        let jsonData = """
        {
          "phone_number": 46709394.3,
          "address": "Hong Kong"
        }
        """.data(using: .utf8)!
        
        // Next, we create a decoder.
        // This is what is actually doing the conversion between the JSON and our Swift structure.
        let decoder = JSONDecoder()

        // person will be of type Person, with values populated from the JSON
        
        do {
            let payment = try decoder.decode(Payment.self, from: jsonData)
            print(payment)
            
        } catch  {
            print("BUG CHECK FAIL TO PARSE")
        }
    }
    /*
    func parseHandyJSON() {
        
        let jsonString = """
        {
        "phone_number": 46709394.7,
          "address": "Hong Kong"
        }
        """
        
        if let object = SampleModel.deserialize(from: jsonString) {
            print(object.phone_number!)
            print(object.address!)
        }
    }
*/

    func parseJSONModel() {
        
        let jsonData = """
        {
        "phone_number": 46709394.7,
          "address": "Hong Kong"
        }
        """.data(using: .utf8)
        
        do {

            let object = try SampleJModel.init(data:jsonData)
            print(object.phone_number)
            print(object.address)
            
        } catch  {
            
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let layerView = SampleView()
        layerView.frame = view.bounds
        view.addSubview(layerView)
        
        //parseJSON()
        //parseHandyJSON()
        parseJSONModel()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
