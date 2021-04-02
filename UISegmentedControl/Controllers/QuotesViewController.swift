//
//  QuotesViewController.swift
//  UISegmentedControl
//
//  Created by Otavio Brito on 20/03/21.
//

import UIKit

class QuotesViewController: UIViewController {

    @IBOutlet weak var ivPhotoBackground: UIImageView!
    @IBOutlet weak var ivPhoto: UIImageView!
    @IBOutlet weak var lbQuote: UILabel!
    @IBOutlet weak var lbAuthor: UILabel!
    @IBOutlet weak var lcTop: NSLayoutConstraint! 
    
    let config = Configuration.shared
    
    let quotesManager = QuotesManager()
    
    // exetur algo em determinado tempo
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "Refresh"), object: nil, queue: nil) { (notification) in
            self.formatView()
        }
    }
    
    // visualiza um quote aleatorio
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        formatView()
    }
    
    // sempre quando alguem tocar na tela chama o metodo prepareQuote()
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        prepareQuote()
    }
    
    func formatView() {
        view.backgroundColor = config.colorScheme == 0 ? .white :  UIColor(red: 156.0/255.0, green: 68.0/255.0, blue: 15.0/255.0, alpha: 1.0)
        lbQuote.textColor = config.colorScheme == 0 ? .black : .white
        lbAuthor.textColor = config.colorScheme == 0 ? UIColor(red: 192.0/255.0, green: 96.0/255.0, blue: 49.0/255.0, alpha: 1.0) : .yellow
        prepareQuote()
    }
    
    // prepara o ambiente para mostrar uma radom quote
    func prepareQuote() {
        timer?.invalidate()
        if config.autorefresh {
            
            // esse metodo pede o tempo que vai levar para executar a ação
            timer = Timer.scheduledTimer(withTimeInterval: config.timeInterval, repeats: true) { (timer) in
                self.showRandomQuote()
            }
        }
        showRandomQuote()
    }
    
    // pedir para o quotes manager pegar uma quote e mostrar na tela
    func  showRandomQuote() {
        let quote = quotesManager.getRandomQuote()
        lbQuote.text = quote.quote
        lbAuthor.text = quote.author
        ivPhoto.image = UIImage(named: quote.image)
        ivPhotoBackground.image = ivPhoto.image
        
        lbQuote.alpha = 0.0
        lbAuthor.alpha = 0.0
        ivPhoto.alpha = 0.0
        ivPhotoBackground.alpha = 0.0
        lcTop.constant = 50
        
        // reposiciona os elementos
        view.layoutIfNeeded()
        
        UIView.animate(withDuration: 2.5) {
            self.lbQuote.alpha = 1.0
            self.lbAuthor.alpha = 1.0
            self.ivPhoto.alpha = 1.0
            self.ivPhotoBackground.alpha = 0.25
            self.lcTop.constant = 10
            
            
            self.view.layoutIfNeeded()
        }
    }
    
    
}
