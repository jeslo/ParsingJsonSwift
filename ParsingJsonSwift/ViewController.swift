//
//  ViewController.swift
//  ParsingJsonSwift
//
//  Created by Joe on 01/06/20.
//  Copyright © 2020 jess. All rights reserved.
//

import UIKit
struct  WebsiteDescription: Decodable {
    let name: String
    let description: String
    let courses: [Course]
}
struct Course: Decodable {
    let id: Int
    let name: String
    let link: String
    let imageUrl: String
    
//    init(json: [String: Any]) {
//        id = json["id"] as! Int ?? -1
//        name = json["name"] as! String ?? ""
//        link = json["link"] as! String ?? ""
//        imageUrl = json["imageUrl"] as! String ?? ""
   // }
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/website_description"
        guard let url = URL(string: jsonUrlString) else
        {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else {return}
//            let dataAsString = String(data: data, encoding: .utf8)
//            print(dataAsString)
            do {
                                print(">>>")
                let websitedecription = try JSONDecoder().decode(WebsiteDescription.self, from: data)
                print(">>>after")
                print (websitedecription.name, websitedecription.description, websitedecription.courses)
//                let courses = try
//                JSONDecoder().decode([Course].self, from: data)
//                print(courses)
//                print(courses.count)
                //swift 2/3/objectC
//                guard let json = try JSONSerialization.jsonObject(with: data, options:                            .mutableContainerss) as? [String: Any] else {return}
//                let course = Course(json: json as! [String : Any])
//                print(course.name)
            } catch _{
                 print(">>>>>monoonchi>>>")
            }
        }.resume()
    }
}

