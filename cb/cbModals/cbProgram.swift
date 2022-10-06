//
//  cbProgram.swift
//  cb
//
//  Created by Luuk Meier on 05/10/2022.
//

import Foundation

class CbProgram: Codable, Identifiable {
    var alias: String;
    var url: URL;
    
    init(_ alias: String, _ url: URL) {
        self.alias = alias;
        self.url = url;
    }
    
    static func p(_ alias: String, _ path: String) -> CbProgram {
        return CbProgram.init(alias, URL(fileURLWithPath: path));
    }
}

