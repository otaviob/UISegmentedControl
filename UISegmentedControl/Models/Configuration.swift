//
//  Configuration.swift
//  UISegmentedControl
//
//  Created by Otavio Brito on 20/03/21.
//

import Foundation


enum UserDefaultsKeys: String {
    case timeInterval = "timeInterval"
    case colorScheme = "colorScheme"
    case autorefresh = "autorefresh"
}

// controlador dos ajustes de configuração 
class Configuration {
    
    // acesso para armazenar as preferencias do usuario
    let defaults = UserDefaults.standard
    
    // em qualqur lugar do app para acesso as config
    static var shared: Configuration = Configuration()
    
     // devolver as config que o usuario salvou
    var timeInterval: Double {
        get {
            
            // recuperando uma info
            return defaults.double(forKey: UserDefaultsKeys.timeInterval.rawValue)
        }
        set {
            
            // salvar o valor passado
            return defaults.set(newValue, forKey: UserDefaultsKeys.timeInterval.rawValue)
        }
    }
    
    var colorScheme: Int {
        get {
            return defaults.integer(forKey: UserDefaultsKeys.colorScheme.rawValue)
        }
        set {
            return defaults.set(newValue, forKey: UserDefaultsKeys.colorScheme.rawValue)
        }
    }
    
    var autorefresh: Bool {
        get {
            return defaults.bool(forKey: UserDefaultsKeys.autorefresh.rawValue)
        }
        set {
            return defaults.set(newValue, forKey: UserDefaultsKeys.autorefresh.rawValue)
        }
    }
    
    // armazenamento de config padrao do userDefault
    private init() {
        if defaults.double(forKey: UserDefaultsKeys.timeInterval.rawValue) == 0 {
            defaults.set(8.0, forKey: UserDefaultsKeys.timeInterval.rawValue)
        }
    }
}
