//
//  String+Extension.swift
//  Insta
//
//  Created by Анна Сычева on 20.10.2022.
//

/// Расширение для строки предложение с большой буквы
extension String {
    
    var capitalized: String {
        let firstLetter = self.prefix(1).capitalized
        let remaindingLetters = self.dropFirst().lowercased()
        return firstLetter + remaindingLetters
    }
}
