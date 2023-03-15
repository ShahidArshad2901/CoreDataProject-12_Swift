//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Dev on 13/03/2023.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "name BEGINSWITH %@", "S")) var ships: FetchedResults<Ship>
    var body: some View {
        VStack{
            List(ships, id: \.self) { ship in
                Text(ship.name ?? "Unknown name")
            }
            
            Button("Add Example") {
                let ship1 = Ship(context: moc)
                ship1.name = "Shahid's toy"
                ship1.universe = "Galaxy 2O"
                
                let ship2 = Ship(context: moc)
                ship2.name = "Usama's Ship"
                ship2.universe = "Granada"
                
                let ship3 = Ship(context: moc)
                ship3.name = "Rafay's ship"
                ship3.universe = "Galaxy de Rafay"
                
                let ship4 = Ship(context: moc)
                ship4.name = "Saim Warship"
                ship4.universe = "Titans"
                
                
                try? moc.save()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
