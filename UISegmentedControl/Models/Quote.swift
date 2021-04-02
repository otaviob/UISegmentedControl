//
//  Quote.swift
//  UISegmentedControl
//
//  Created by Otavio Brito on 20/03/21.
//

import Foundation


// protocologo codable, permite que a classe seja codificada em um jSON
struct Quote: Codable {
    let quote: String
    let author: String
    let image: String
    
    // entregar quonte ja formatado
    var quoteFormatted: String {
        return " 〝" + quote + "〞 "
    }  
    
    // entregar o nome do autor formatado
    var authorFormatted: String {
        return "- " + author + " -"
    }
    
}
