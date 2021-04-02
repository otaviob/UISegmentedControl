//
//  QuotesManager.swift
//  UISegmentedControl
//
//  Created by Otavio Brito on 20/03/21.
//

import Foundation

// Gerenciar do quote
class QuotesManager {
    let quotes: [Quote]
    
    init () {
        
        // caminho onde o arquivo se encontra
        let fileURL = Bundle.main.url(forResource: "quotes", withExtension: "json")!
        
        //convertendo arquivo URL
        let jsonData = try! Data(contentsOf: fileURL)
        
        // transformando JSON em array [Quotes]
        let jsonDecoder = JSONDecoder()
        quotes = try! jsonDecoder.decode([Quote].self, from: jsonData)
    }
    
    // função que entrega uma quote aleatorio
    func getRandomQuote() -> Quote {
        let index = Int(arc4random_uniform(UInt32(quotes.count)))
        return quotes[index]
    }
}
