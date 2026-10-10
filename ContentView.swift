//
//  ContentView.swift
//  Demineur
//
//  Created by wisecarl69 on 29/06/2026.
//


import SwiftUI

struct grille_carreau{
    
    var valeur_tableau: Bool = false
    var fin: Bool = false
    var comptage: Bool = false
}

struct ContentView: View {
    
    @State var text: String = ""
    @State var score: Int = 0
    @State var colone: Int = 0
    @State var ligne: Int = 0
    @State var alerte_fin: Bool = false
    @State var jouer: Bool = false
 
    @State var carre: [[grille_carreau]] = [[grille_carreau(valeur_tableau: false, fin: false,comptage: false),grille_carreau(valeur_tableau: false, fin: false,comptage: false),grille_carreau(valeur_tableau: false, fin: false,comptage: false),grille_carreau(valeur_tableau: false, fin: false,comptage: false),grille_carreau(valeur_tableau: false, fin: false,comptage: false)],[grille_carreau(valeur_tableau: false, fin: false,comptage: false),grille_carreau(valeur_tableau: false, fin: false,comptage: false),grille_carreau(valeur_tableau: false, fin: false,comptage: false),grille_carreau(valeur_tableau: false, fin: false,comptage: false),grille_carreau(valeur_tableau: false, fin: false,comptage: false)],[grille_carreau(valeur_tableau: false, fin: false,comptage: false),grille_carreau(valeur_tableau: false, fin: false,comptage: false),grille_carreau(valeur_tableau: false, fin: false,comptage: false),grille_carreau(valeur_tableau: false, fin: false,comptage: false),grille_carreau(valeur_tableau: false, fin: false,comptage: false)],[grille_carreau(valeur_tableau: false, fin: false,comptage: false),grille_carreau(valeur_tableau: false, fin: false,comptage: false),grille_carreau(valeur_tableau: false, fin: false,comptage: false),grille_carreau(valeur_tableau: false, fin: false,comptage: false),grille_carreau(valeur_tableau: false, fin: false,comptage: false)],[grille_carreau(valeur_tableau: false, fin: false,comptage: false),grille_carreau(valeur_tableau: false, fin: false,comptage: false),grille_carreau(valeur_tableau: false, fin: false,comptage: false),grille_carreau(valeur_tableau: false, fin: false,comptage: false),grille_carreau(valeur_tableau: false, fin: false,comptage: false)],[grille_carreau(valeur_tableau: false, fin: false,comptage: false),grille_carreau(valeur_tableau: false, fin: false,comptage: false),grille_carreau(valeur_tableau: false, fin: false,comptage: false),grille_carreau(valeur_tableau: false, fin: false,comptage: false),grille_carreau(valeur_tableau: false, fin: false,comptage: false)]]
                         
    var body: some View {
        
        ZStack {

            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing : 20) {
                Text("Diamond / Boom")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                HStack {
                    Text("Score : ")
                        .font(.largeTitle)
                        .foregroundColor(.gray)
                    Text(String(Int(score)))
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
                
                    VStack {
                        ForEach(0..<6){ colone in
                            
                            HStack(spacing:15)
                                {
                                    ForEach(0..<5){ ligne in
                                        Button(action: {
                                            
                                            if jouer{
                                                if !carre[colone][ligne].comptage{
                                                    carre[colone][ligne].valeur_tableau = true
                                                    score = score + 10
                                                    carre[colone][ligne].comptage = true
                                                }
                                                else{
                                                    
                                                }
                                                
                                                if carre[colone][ligne].valeur_tableau && carre[colone][ligne].fin{
                                                    alerte_fin = true
                                                    score = score - 10
                                                }
                                                else{
                                                    
                                                }
                                            }
                                            else{
                                                
                                            }
                                            if(score == 290){
                                                text = "Gagné !"
                                            }
                                            else{
                                                text = "Perdu !"
                                            }
                                        }, label: {
                                            ZStack {
                                                Rectangle()
                                                    .foregroundColor(Color.white.opacity(0.2))
                                                .frame(width: 60,height: 60)
                                                if carre[colone][ligne].valeur_tableau && !carre[colone][ligne].fin{
                                                    Circle().foregroundColor(.green).frame(width: 50,height: 50)
                                                }
                                                else{
                                                    
                                                }
                                                if carre[colone][ligne].valeur_tableau && carre[colone][ligne].fin{
                                                    Circle().foregroundColor(.red).frame(width: 50,height: 50)
                                                }
                                                else{
                                                    
                                                }
                                                
                                            }
                                        })
                                    
                                    }
                                }
                        }
                    }
                
                Button(action: {
                    
                    jouer = true
                    let col = Int.random(in: 0..<6)
                    let row = Int.random(in: 0..<5)
                    carre[col][row].fin = true

                }, label: {
                    ZStack{
                              Circle().stroke(Color.white.opacity(0.9),style: StrokeStyle(lineWidth: 3,lineCap: .round)).frame(width: 130,height: 130)
                                  Circle().foregroundColor(Color.white.opacity(0.9)).frame(width: 120,height: 120)
                                     Text("JOUER").font(.title)
                    }
                }).padding(.top,30)
               
            }.alert(isPresented: $alerte_fin) {
                 Alert(
                    title: Text(text),
                    message: Text("Tu as eu la bombe ! Ton score: \(score)"),
                    dismissButton: .default(Text("Rejouer")) {
                        rejouer()
                    }
                )
        }
        }
    }
    func rejouer(){
        carre = [[grille_carreau(valeur_tableau: false, fin: false,comptage: false),grille_carreau(valeur_tableau: false, fin: false,comptage: false),grille_carreau(valeur_tableau: false, fin: false,comptage: false),grille_carreau(valeur_tableau: false, fin: false,comptage: false),grille_carreau(valeur_tableau: false, fin: false,comptage: false)],[grille_carreau(valeur_tableau: false, fin: false,comptage: false),grille_carreau(valeur_tableau: false, fin: false,comptage: false),grille_carreau(valeur_tableau: false, fin: false,comptage: false),grille_carreau(valeur_tableau: false, fin: false,comptage: false),grille_carreau(valeur_tableau: false, fin: false,comptage: false)],[grille_carreau(valeur_tableau: false, fin: false,comptage: false),grille_carreau(valeur_tableau: false, fin: false,comptage: false),grille_carreau(valeur_tableau: false, fin: false,comptage: false),grille_carreau(valeur_tableau: false, fin: false,comptage: false),grille_carreau(valeur_tableau: false, fin: false,comptage: false)],[grille_carreau(valeur_tableau: false, fin: false,comptage: false),grille_carreau(valeur_tableau: false, fin: false,comptage: false),grille_carreau(valeur_tableau: false, fin: false,comptage: false),grille_carreau(valeur_tableau: false, fin: false,comptage: false),grille_carreau(valeur_tableau: false, fin: false,comptage: false)],[grille_carreau(valeur_tableau: false, fin: false,comptage: false),grille_carreau(valeur_tableau: false, fin: false,comptage: false),grille_carreau(valeur_tableau: false, fin: false,comptage: false),grille_carreau(valeur_tableau: false, fin: false,comptage: false),grille_carreau(valeur_tableau: false, fin: false,comptage: false)],[grille_carreau(valeur_tableau: false, fin: false,comptage: false),grille_carreau(valeur_tableau: false, fin: false,comptage: false),grille_carreau(valeur_tableau: false, fin: false,comptage: false),grille_carreau(valeur_tableau: false, fin: false,comptage: false),grille_carreau(valeur_tableau: false, fin: false,comptage: false)]]
        jouer = true
        alerte_fin = false
        score = 0
        let col = Int.random(in: 0..<6)
        let row = Int.random(in: 0..<5)
        carre[col][row].fin = true
        
    }
    func lancement() -> [[grille_carreau]] {
        
        var carre = (0..<6).map { _ in (0..<5).map { _ in grille_carreau(valeur_tableau: false, fin: false) } }
        let colone = Int.random(in: 0..<6)
        let ligne = Int.random(in: 0..<5)
        carre[colone][ligne].fin = true
        return carre
    }
}

#Preview {
    ContentView()
}





