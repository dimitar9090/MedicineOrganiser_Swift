//
//  CreateMedicineEntryView.swift
//  MedicineOrganiserApp
//
//  Created by Dimitar Angelov on 17.11.23.
//

import SwiftUI

struct CreateMedicineEntryView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State var name: String = ""
    @State var quantity: String = ""
    @State var date: Date = Date()
    
    var body: some View {
        
        NavigationStack {
            Form{
                TextField("Name", text: $name)
                TextField("Quantity", text: $quantity)
                DatePicker("Expire Date", selection: $date, displayedComponents: .date)
            }.background(CustomBackgroundView())
                .scrollContentBackground(.hidden)
            .navigationTitle("New Medicine Entry")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel"){
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        let newMedicineEntry = MedicineEntry(name: name, quantity: quantity, date: date)
                        modelContext.insert(newMedicineEntry)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    CreateMedicineEntryView()
}
