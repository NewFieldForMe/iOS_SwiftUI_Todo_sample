//
//  FloatingButtonView.swift
//  NGenTodo
//
//  Created by yamada.ryo on 2020/07/06.
//  Copyright © 2020 yamada.ryo. All rights reserved.
//

import SwiftUI

struct FloatingButtonView: View {
    let tapHandler: (() -> Void)?

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    self.tapHandler?()
                }, label: {
                    Text("+")
                        .font(.system(.largeTitle))
                        .frame(width: 77, height: 70)
                        .foregroundColor(Color.white)
                        .padding(.bottom, 7)
                })
                    .background(Color.blue)
                    .cornerRadius(38.5)
                    .padding()
                    .shadow(color: Color.black.opacity(0.3),
                            radius: 3,
                            x: 3,
                            y: 3)
            }
        }
    }
}

struct FloatingButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FloatingButtonView(tapHandler: nil)
    }
}
