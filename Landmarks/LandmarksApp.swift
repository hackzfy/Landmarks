//
//  Landmarks2App.swift
//  Landmarks2
//
//  Created by yang on 2022/5/30.
//

import SwiftUI

@main
struct Landmarks2App: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
        #if !os(watchOS)
        .commands{
            LandmarkCommands()
        }
        #endif
        
        #if os(macOS)
        Settings {
            LandmarkSettings()
        }
        #endif
    }
}
