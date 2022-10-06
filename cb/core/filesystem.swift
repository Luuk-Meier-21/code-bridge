//
//  folderPicker.swift
//  command buttons
//
//  Created by Luuk Meier on 18/11/2021.
//

import Foundation
import SwiftUI

extension NSOpenPanel {
    /// Extention of `NSOpenPanel` with static presets for getting different types of urls from the filesystem.
    
    static var selectApp: NSOpenPanel {
        let panel = NSOpenPanel();
        panel.title = "Pick a program";
        panel.showsResizeIndicator = true;
        panel.showsHiddenFiles = false;
        panel.allowsMultipleSelection = false;
        panel.allowedContentTypes = [.application]
        return panel
    }
}

class FileSystem {
    /// The Folder class and its static method `selectFolder()` give the option to open a panel and pass the result on the `onResult` closure.
    
    static func selectProgram(from panel: NSOpenPanel, onResult: ( _ result: URL) -> Void) {
        if (panel.runModal() == NSApplication.ModalResponse.OK) {
            let result = panel.url

            if (result != nil) {
                onResult(result!);
            }
        } else {
            // User clicked on "Cancel"
            return
        }
    }
    
    static func openUrl(
        _ url: URL,
        with programUrl: URL,
        configuration: NSWorkspace.OpenConfiguration = NSWorkspace.OpenConfiguration(),
        onSucces: @escaping () -> Void
    ) {
        configuration.activates = true;
        
        NSWorkspace.shared.open([url], withApplicationAt: programUrl, configuration: configuration) {_,_ in
            onSucces();
        }
    }
    
    enum FolderError: Error {
        case noMatchFound(text: String);
    }
}
