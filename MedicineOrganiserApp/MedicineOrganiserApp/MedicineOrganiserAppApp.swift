//
//  MedicineOrganiserAppApp.swift
//  MedicineOrganiserApp
//
//  Created by Dimitar Angelov on 14.11.23.
//

import SwiftUI
import SwiftData

@main
struct MedicineOrganiserAppApp: App {
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            MedicineEntry.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        do{
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create Modelcontainer: \(error)")
            
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            MedicineEntriesListView()
        }
        .modelContainer(sharedModelContainer)
    }
}
