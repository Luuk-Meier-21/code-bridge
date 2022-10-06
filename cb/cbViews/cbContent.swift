//
//  content.swift
//  cb
//
//  Created by Luuk Meier on 05/10/2022.
//

import Foundation;
import SwiftUI;
import CoreData;

struct CBView: View {
    @State var launchType: LaunchType = .settings;
    @StateObject var programStore = PersistentArray<CbProgram>([
        .p("vs-code", "/Applications/Visual Studio Code - Insiders.app"),
        .p("xcode", "/Applications/Xcode.app"),
        .p("arduino", "/Applications/Arduino.app")
    ]);
    
    var body: some View {
        VStack(alignment: .leading) {
            if launchType == .settings {
                // On application open
                CbSettings(programStore: programStore);
            }
            else {
                // On url open
                Label("Opening file...", systemImage: "folder")
            }
        }
        .frame(minWidth: 300, minHeight: 300)
        .onOpenURL { url in
            if !url.isDeeplink { return }
            launchType = .url;
            
            guard let host = url.host else { return }
            guard let program = programStore.data.first(where: {$0.alias == host}) else { return };
            let url = URL(fileURLWithPath: url.path);
    
            FileSystem.openUrl(url, with: program.url) {
                exit(0);
            }
        }
    }
}
