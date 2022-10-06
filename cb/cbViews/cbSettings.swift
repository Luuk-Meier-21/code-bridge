//
//  cbSettings.swift
//  cb
//
//  Created by Luuk Meier on 05/10/2022.
//

import Foundation
import SwiftUI

struct CbSettings: View {
    @ObservedObject var programStore: PersistentArray<CbProgram>;
    
    var body: some View {
        VStack {
            HStack {
                Text("Available programs")
                    .font(.headline)
                Spacer();
                Button {
                    programStore.load();
                } label: {
                    Image(systemName: "arrow.counterclockwise")
                }.buttonStyle(.borderless)

            }
            Table(programStore.data) {
                TableColumn("Alias", value: \.alias);
                TableColumn("Url", value: \.url.path);
            }
            HStack {
                Spacer();
                Button {
                    FileSystem.openUrl(
                        programStore.storageUrl,
                        with: programStore.data.first(where: {$0.alias == "vs-code"})!.url) {
                        
                    }
                } label: {
                    Label("Edit Source", systemImage: "chevron.left.forwardslash.chevron.right");
                }
                Button {
                    CbAddProgramView(pm: programStore)
                        .openInWindow(title: "Add Program", sender: self);
                } label: {
                    Label("Add Program", systemImage: "plus");
                }
            }
        }
        .padding()
    }
}
