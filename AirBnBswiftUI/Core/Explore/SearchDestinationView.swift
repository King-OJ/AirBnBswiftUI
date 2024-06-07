//
//  SearchDestinationView.swift
//  AirBnBswiftUI
//
//  Created by King OJ on 05/06/2024.
//

import SwiftUI

enum searchFieldOptions {
    case location
    case date
    case guest
}

struct SearchDestinationView: View {
    
    @Binding var showView: Bool
    
    @State private var destination = ""
    @State private var selectedSearchField: searchFieldOptions = .location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var numOfGuests = 0
    
    var body: some View {
        VStack(spacing: 30) {
            
            //close and clear button
            HStack {
                Button(action: {
                    withAnimation(.snappy) {
                        showView.toggle()
                    }
                    
                }, label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                })
                
                Spacer()
                
                if !destination.isEmpty {
                    Button("Clear") {
                        destination = ""
                    }
                    .foregroundStyle(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
                
            }
            
            VStack(alignment:.leading) {
                
                if selectedSearchField == .location {
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                        
                        TextField("Search destination", text: $destination)
                            .font(.subheadline)
                            
                    }
                    .frame(height: 44)
                    .padding(.horizontal)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 0.5)
                            .foregroundStyle(Color(.systemGray4))
                    }
                }
                else {
                    CollapsedPickerView(title: "Where", action: "Add destination")
                }
                
                
            }
            .modifier(CollapsiblePickerModifier())
            .frame(height: selectedSearchField == .location ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy) {
                    selectedSearchField = .location
                }
                
            }
            
            //date selection
            VStack(alignment:.leading , content: {
                if selectedSearchField == .date {
                    
                    Text("When's your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    VStack{
                        DatePicker("From", selection: $startDate, displayedComponents: .date)
                        
                        Divider()
                        
                        DatePicker("To", selection: $endDate, displayedComponents: .date)
                    }
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
                else {
                    CollapsedPickerView(title: "When", action: "Add dates")
                       
                }
            })
            .modifier(CollapsiblePickerModifier())
            .frame(height: selectedSearchField == .date ? 180 : 64)
            .onTapGesture {
                withAnimation(.snappy) {
                    selectedSearchField = .date
                }
            }
            
            
            //no. of guests selection
            VStack(alignment: .leading ,content: {
                if selectedSearchField == .guest {
                    Text("Who's coming?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Stepper{
                        Text("\(numOfGuests) Adults")
                            .fontWeight(.semibold)
                    }
                    onIncrement: { numOfGuests += 1 }
                    onDecrement: {
                        guard numOfGuests > 0 else {
                            return;
                        }
                        numOfGuests -= 1;
                    }
                    
                }
                else {
                    CollapsedPickerView(title: "Who", action: "Add guests")
                }
            })
            .modifier(CollapsiblePickerModifier())
            .frame(height: selectedSearchField == .guest ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy) {
                    selectedSearchField = .guest
                }
            }
            
            Spacer()
            
        }
        .padding()
    }
}

#Preview {
    SearchDestinationView(showView: .constant(false))
}

struct CollapsiblePickerModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: 10)
    }
}

struct CollapsedPickerView: View {
    
    let title: String
    let action: String
    
    var body: some View {
        VStack {
            HStack(content: {
                Text(title)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text(action)
                    .font(.subheadline)
                    .fontWeight(.semibold)
            })
        }
        
    }
}
