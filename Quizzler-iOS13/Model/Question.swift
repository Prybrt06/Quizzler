//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Priyabrat  Duarah on 25/05/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question{
    var question : String
    var answer : String
    
    init(q : String , a : String)
    {
        question = q
        answer = a
    }
}
