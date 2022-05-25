//
//  SimpleCalculatorApp.swift
//  SimpleCalculator
//
//  Created by Pablo Henriquez on 19-04-22.
//
import Foundation
import SwiftUI

@main
struct SimpleCalculatorApp: App {
    @StateObject var calculator = CalculatorData()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(calculator)
        }
    }
}

struct MemoryValues: Identifiable, Codable {
    let id: UUID
    var value : String
    var storedDate : Date
    
    init(id: UUID = UUID(), value : String, storedDate : Date = Date()) {
        self.id = id
        self.value = value
        self.storedDate = storedDate
    }
}

class CalculatorData: ObservableObject {
    @Published var displayValue: String = ""
    @Published var value: Float = 0
    @Published var prevValue: Float = 0
    @Published var result: Float = 0
    @Published var memory: Float = 0
    @Published var prevActionKey: String = "init"
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(
                for: .documentDirectory,
                in: .userDomainMask,
                appropriateFor: nil,
                create: false
            )
            .appendingPathComponent("momory.values")
    }
    
    static func load(completion: @escaping (Swift.Result<[MemoryValues], Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let fileURL = try fileURL()
                guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                    DispatchQueue.main.async {
                        completion(.success([]))
                    }
                    return
                }
                let memoryFiles = try JSONDecoder().decode([MemoryValues].self, from: file.availableData)
                DispatchQueue.main.async {
                    completion(.success(memoryFiles))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    static func save(memoryValues: [MemoryValues], completion: @escaping (Swift.Result<Int,Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let data = try JSONEncoder().encode(memoryValues)
                let outfile = try fileURL()
                try data.write(to: outfile)
                DispatchQueue.main.async {
                    completion(.success(memoryValues.count))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}
