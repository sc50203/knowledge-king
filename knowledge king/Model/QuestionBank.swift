//
//  QuestionBank.swift
//  knowledge king
//
//  Created by leeal on 2018/1/7.
//  Copyright © 2018年 Aptan. All rights reserved.
//

import Foundation

class QuestionBank{
    var list = [Question]()
    
    init() {
        let item = Question(text: "今天天氣好嗎", correctAnswer: true)
        list.append(item)
        list.append(Question(text: "你今天帥嗎", correctAnswer:false))
        list.append(Question(text: "你今天美嗎", correctAnswer:true))
    }
}
