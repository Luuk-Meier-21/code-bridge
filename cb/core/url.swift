//
//  url.swift
//  cb
//
//  Created by Luuk Meier on 30/09/2022.
//

import Foundation

enum Identifier: String, Hashable, CaseIterable, Codable {
    case vsCode = "vs-code",
         xcode = "xcode",
         arduino = "arduino"
}

extension URL {
    var isDeeplink: Bool {
        return scheme == "cb" // matches my-url-scheme://<rest-of-the-url>
    }
}

enum LaunchType {
    case url, settings
}
