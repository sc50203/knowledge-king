//
//  Question.swift
//  knowledge king
//
//  Created by leeal on 2018/1/7.
//  Copyright © 2018年 Aptan. All rights reserved.
//

import Foundation

class Question{
    let question : String
    let answer : Bool
    
    init(text:String,correctAnswer:Bool) {
        question = text
        answer = correctAnswer
    }
}
