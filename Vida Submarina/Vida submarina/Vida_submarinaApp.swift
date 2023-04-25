//
//  Vida_submarinaApp.swift
//  Vida submarina
//
//  Created by CEDAM 13 on 24/04/23.
//

import SwiftUI

@main
struct Vida_submarinaApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            SplashView()
        }
    }
}
