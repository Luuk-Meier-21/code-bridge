//
//  cbApp.swift
//  cb
//
//  Created by Luuk Meier on 30/09/2022.
//

import SwiftUI;
import CoreData;

@main
struct cbApp: App {
    var body: some Scene {
        WindowGroup {
            CBView()
        }
        .windowToolbarStyle(.unifiedCompact)
    }
}
