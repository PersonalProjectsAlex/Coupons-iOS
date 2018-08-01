//
//  UserSIngleton.swift
//  MyShot
//
//  Created by Administrador on 8/06/18.
//  Copyright © 2018 avalogics. All rights reserved.
//

import Foundation

struct GlobalSettings{
    let defaults = UserDefaults.standard
}

class UserSingleton {
    static let shared = UserSingleton()
    private init() {}
    // MARK: - Let-Var
    
    // MARK: - SetUps / Funcs
    
    
}

