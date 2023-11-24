//
//  ContentView.swift
//  MedicineOrganiserApp
//
//  Created by Dimitar Angelov on 14.11.23.
//

import SwiftUI
import SwiftData

struct MedicineEntriesListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query (sort: \MedicineEntry.name)private var medicineEntries: [MedicineEntry]
    
    @State var showCreateView = false
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack{
            ZStack {
                CustomBackgroundView()
                List(searchResults) {
                    listedMedicineEntry in
                    NavigationLink(destination: EditMedicineEntryView(editingMedicineEntry: listedMedicineEntry)){
                        MedicineEntryRowView(rowMedicineEntry: listedMedicineEntry)
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(leading: Text("\(medicineEntries.count)      Medicines").font(.system(size: 40).bold()))
                .toolbar {
                    Button(action: {
                        showCreateView = true
                    }) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
                .sheet(isPresented: $showCreateView){
                    CreateMedicineEntryView()
            }
            }
            .scrollContentBackground(.hidden)
            . searchable(text: $searchText)
        }
    }
    var searchResults: [MedicineEntry] {
        if searchText.isEmpty {
            return medicineEntries
        } else {
            return medicineEntries.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
}



#Preview {
    MedicineEntriesListView()
        .modelContainer(for: MedicineEntry.self, inMemory: true)
}
