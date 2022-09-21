//
//  CustomTabBar.swift
//  MovieBooking
//
//  Created by netease on 2022/9/21.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var currentTab: Tab
    
    var backgroundColors = [Color("purple"), Color("lightBlue"), Color("pink")]
    var grayCircle = [Color("cyan"), Color("cyan").opacity(0.1), Color("cyan")]
    var body: some View {
        VStack {
            HStack(spacing: 0.0) {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Button {
                        withAnimation(.easeInOut) {
                            currentTab = tab
                        }
                    } label: {
                        Image(tab.rawValue)
                            .renderingMode(.template)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .offset(y: currentTab == tab ? -17 : 0)
                    }
        
                }
            }
            .frame(maxWidth: .infinity)
            .background(alignment: .leading) {
                Circle()
                    .fill(.ultraThinMaterial)
                    .frame(width: 80, height: 80)
                    .shadow(color: .black.opacity(0.25), radius: 20, x: 0, y: 20)
                    .overlay {
                        Circle()
                            .trim(from: 0, to: CGFloat(0.5))
                            .stroke(
                                LinearGradient(colors: grayCircle, startPoint: .top, endPoint: .bottom)
                            )
                    }
            }
        }
        .frame(height: 24)
        .padding(.top, 30)
        .background(.ultraThinMaterial)
        .background(LinearGradient(colors: backgroundColors, startPoint: .leading, endPoint: .trailing))
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
//        CustomTabBar(currentTab: .constant(.home))
        ContentView()
    }
}
