//
//  addProgram.swift
//  cb
//
//  Created by Luuk Meier on 04/10/2022.
//

import Foundation
import SwiftUI

struct CbAddProgramView: View {
    @StateObject var pm: PersistentArray<CbProgram>;
    
    @State var dummyAlias: String = "";
    @State var alias: String = "";
    @State var url: String = "";
    
    var body: some View {
        VStack {
            TextField("Alias", text: $alias);
            HStack {
                TextField("Url", text: $url);
                Button {
                    FileSystem.selectProgram(from: .selectApp) { programUrl in
                        url = programUrl.path;
                    }
                } label: {
                    Image(systemName: "magnifyingglass")
                }
                .buttonStyle(.borderless)
            }
            HStack {
                Spacer();
                
                Button {
                    NSApplication.shared.keyWindow?.close()
                } label: {
                    Text("Cancel")
                    
                }
                Button {
                    _ = pm.append(.p(alias, url));
                    NSApplication.shared.keyWindow?.close()
                } label: {
                    Label("Add", systemImage: "plus")
                }
                .buttonStyle(.borderedProminent)
            }

        }
        .padding()
        .frame(minWidth: 300)
    }
}


extension View {
    
    @discardableResult
    func openInWindow(title: String, sender: Any?) -> NSWindow {
        let controller = NSHostingController(rootView: self)
        let win = NSWindow(contentViewController: controller)
        win.contentViewController = controller
        win.title = title
        win.makeKeyAndOrderFront(sender)
        return win
    }
}
