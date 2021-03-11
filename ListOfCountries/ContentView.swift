//
//  ContentView.swift
//  ListOfCountries
//
//  Created by Adam Lea on 2/28/21.
//

import SwiftUI

struct country:Identifiable {
    let id = UUID()
    let name: String
    let flag: String
}

struct ContentView: View {
    @State private var countries = [
        country(name: "Australia", flag: "Australia"),
        country(name: "Belgium", flag: "Belgium"),
        country(name: "Canada", flag: "Canada"),
        country(name: "Denmark", flag: "Denmark"),
        country(name: "Finland", flag: "Finland"),
        country(name: "Germany", flag: "Germany"),
        country(name: "Japan", flag: "Japan"),
        country(name: "United States of America", flag: "United-States")
        
    ]
    var body: some View {
        NavigationView {
            List {
                ForEach(countries) {country in
                    NavigationLink(destination:
                                    VStack{
                                        Text(country.name).bold()
                                        Image(country.flag)
                                    }
                    ){
                        HStack {
                            Image(country.flag)
                            Text(country.name).bold()
                        }
                    }
                }
                .onDelete(perform: delete)
                .onMove(perform: move)
            }
            .navigationTitle("List of Countries")
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: addCountry,
                    label: {Text("Add")}
                    )
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
        }
    }
    
    func delete(at offsets: IndexSet) {
        countries.remove(atOffsets: offsets)
    }
    
    func move(from source: IndexSet, to destination: Int) {
        countries.move(fromOffsets: source, toOffset: destination)
    }
    
    func addCountry() {
        countries.append(
            country(name: "Norway", flag: "Norway")
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
