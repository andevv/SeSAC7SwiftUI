//
//  SharedUserDefaults.swift
//  SeSAC7SwiftUI
//
//  Created by andev on 10/30/25.
//

import Foundation

extension UserDefaults {
    
    static var groupShared: UserDefaults {
        
        let appID = "group.SeSAC7SwiftUI"
        return UserDefaults(suiteName: appID)!
    }
    
}
