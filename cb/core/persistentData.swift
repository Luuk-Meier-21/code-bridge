//
//  persistentData.swift
//  cb
//
//  Created by Luuk Meier on 05/10/2022.
//

import Foundation

class PersistentArray<T: Codable>: ObservableObject {
    @Published var data: [T] = [];
    var storageUrl = URL(fileURLWithPath: "/Users/luukmeier/Documents/cb/data.json");
    var store = JSONCodableSerialization<[T]>();
    
    init(_ array: [T]) {
        self.load();
    }
    
    func append(_ item: T) -> [T] {
        data.append(item);
        save();
        return data;
    }
    
    func save() {
        do {
            try store.save(jsonObject: data, to: storageUrl);
        } catch let error {
            print(error)
        }
    }
    
    func load() {
        data = try! store.loadJSON(from: storageUrl);
    }
}
