//
//  listaGeneral.swift
//  Vida submarina
//
//  Created by CEDAM 13 on 24/04/23.
//

import SwiftUI
import MapKit

extension Color{
    init(hex: UInt, alpha: Double = 1){
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha

        )
    }
}

struct Location : Identifiable{
    let id = UUID()
    let name : String
    let coordinate : CLLocationCoordinate2D
}

struct ContentView: View{
    @State private var busquemos = true
    
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 27.36, longitude: -113.39), span: MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5))
    
    var diccionario = Diccionario()
    var estados = ["Baja California", "Guerrero", "Jalisco", "Nayarit", "Oaxaca", "Quintana Roo", "Veracruz"]
    var informacion = ["flora", "fauna", "clima"]
    var playasBajaCalifornia = ["El Chileno", "Acapulquito", "El Corsario", "Palmilla", "Hacienda", "Santa María", "Las Viudas", "El Coromuel", "Martina Cortez"]
    var playasGuerrero = ["El Revolcadero I", "El Revolcadero II", "Icacos I", "Icacos II", "El Palmar I", "El Palmar II"]
    var playasJalisco = ["Amapas", "Camarones", "Conchas Chinas I", "Garza Blanca", "Palmares", "Playa de Oro", "Sheraton"
    ]
    
    var body: some View{
        NavigationStack {
            ZStack{
                Rectangle().fill(Gradient(colors: [.white, .white, Color(hex: 0xffD168FF, alpha: 0.9), Color(hex: 0xff05BFE8)]))
                    .ignoresSafeArea()
                VStack{
                    HStack(spacing: 0) {
                        Text("ocean").font(.custom("ronda-bold", size: 50)).foregroundColor(.blue)
                        Text("master").font(.custom("ronda-bold", size: 50))
                    }
                    HStack{
                        Text("Busquemos").font(.custom("", size: 20))
                            .onTapGesture {
                                busquemos = true
                            }
                            .background((busquemos) ? .blue : .cyan)
                        Text("Sobre nosotros").font(.custom("", size: 20))
                            .onTapGesture {
                                busquemos = false
                            }
                            .background((busquemos) ? .cyan : .blue)
                    }
                    if(busquemos) {
                        ScrollView {
                            VStack {
                                Map(coordinateRegion: $mapRegion).frame(width: 450, height: 350)
                                List{
                                    ForEach(0..<9){playas in
                                        NavigationLink{
                                            DetailInfo(nombre: playasBajaCalifornia[playas], flora: diccionario.dictionary["Baja California"]!["flora"]!, fauna: diccionario.dictionary["Baja California"]!["fauna"]!, clima: diccionario.dictionary["Baja California"]!["clima"]!)
                                            
                                        } label: {
                                            Text(playasBajaCalifornia[playas]).font(.largeTitle)
                                        }.listRowBackground(Color(hex: 0xff00000, alpha: 0))
                                    }
                                }.frame(width: 450, height: 500).scrollContentBackground(.hidden)
                            }
                        }
                    } else {
                        ScrollView{
                            Text("hfbdvucnvisdfdskjfhdsakjfhdskjfbsdifndsiucnsdicvbsdivunsdviubsdnaivcudsbnaciudsnavcoisdabnvcakwejbnckjncvawkeuvbcnwkauvn ewakucnwekaucbwekucb weiuwefiuhi cuwai cbc wiuch wioucnweicu wiuae cniw cunwiicnweiuncwiu nb iun iuw nciowi ncoi ocw iocwniuwcn iu nawiu cwiau c")
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        ContentView()
    }
}
