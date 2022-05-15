//
//  ContentView.swift
//  Memorize
//
//  Created by Кирилл on 14.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    let emojis = ["✈️", "🚀", "🚁", "🛶", "🚟", "🚇", "⛵️","⛴", "🚕", "🚎", "🚛" ,"🚜", "🛴" ,"🛵" ,"🏍", "🚍", "🚠", "🚞", "🚅", "🛸", "🎠", "🚒", "🏎", "🛻"]
    
    @State var emojiCount = 24
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                remove
                Spacer()
                shuffle
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding()
        }
        .padding(.horizontal)
    }
    var shuffle: some View {
        Button {
           
        } label: {
            Text("Shuffle")
        }
    }
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    var add: some View {
        Button{
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
}

struct CardView: View {
    var content: String
    
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
