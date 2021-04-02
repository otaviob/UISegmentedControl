//
//  SettingsViewController.swift
//  UISegmentedControl
//
//  Created by Otavio Brito on 20/03/21.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var swAutoRefresh: UISwitch!
    @IBOutlet weak var lbTimeInterval: UILabel!
    @IBOutlet weak var slTimeInterval: UISlider!
    @IBOutlet weak var scColorScheme: UISegmentedControl!
    
    // criando arquivo de config
    let config = Configuration.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "Refresh"), object: nil, queue: nil) { (notification) in
            self.formatView()
        }

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // toda vez que aparecer a view ela sera formatada
        formatView()
    }
    
    func formatView() {
        
        // definir o estado on ou off switch
        swAutoRefresh.setOn(config.autorefresh, animated: false)
        
        // config
        slTimeInterval.setValue(Float(config.timeInterval), animated: false)
        
        // conf colorScheme
        scColorScheme.selectedSegmentIndex = config.colorScheme
        
        // esse motodo passa o valor para a label
        changeTimeInvervalLabel(with: config.timeInterval)
    }
    
    func changeTimeInvervalLabel(with value: Double) {
        lbTimeInterval.text = "Mudar após \(Int(value)) segundos"
    }
    
    // action switch //
    @IBAction func changeAutoRefresh(_ sender: UISwitch) {
        config.autorefresh = sender.isOn
    }
    
    // action slider //
    @IBAction func changeTimeInterval(_ sender: UISlider) {
        let value = Double(round(sender.value))
        changeTimeInvervalLabel(with: value)
        config.timeInterval = value
    }
    
    // action segmentedControl //
    @IBAction func changeColorSkin(_ sender: UISegmentedControl) {
        config.colorScheme = sender.selectedSegmentIndex
    }
    
    
}
