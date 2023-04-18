//
//  String.swift
//  NotesSwifUI
//
//  Created by Roman Vyjídáček on 13.04.2023.
//

import Foundation

extension String {
    
    static var loremIpsum: String {
        return "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nulla non arcu lacinia neque faucibus fringilla. Mauris metus. Nunc auctor. Phasellus enim erat, vestibulum vel, aliquam a, posuere eu, velit. Pellentesque arcu. Sed vel lectus. Donec odio tempus molestie, porttitor ut, iaculis quis, sem. Phasellus rhoncus. Aliquam erat volutpat. Maecenas lorem. Quisque porta. Phasellus et lorem id felis nonummy placerat. Integer malesuada. Curabitur bibendum justo non orci. In rutrum. Etiam bibendum elit eget erat."
    }

    // SOURCE: https://stackoverflow.com/questions/28079123/how-to-check-validity-of-url-in-swift
    var isValidURL: Bool {
        let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        if let match = detector.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count)) {
            return match.range.length == self.utf16.count
        }
        
        return false
    }
}
