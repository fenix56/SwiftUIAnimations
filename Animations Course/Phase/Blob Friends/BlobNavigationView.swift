//
//  BlobNavigationView.swift
//  Animations Course
//
//  Created by Shemek on 04/11/2025.
//

import SwiftUI

struct BlobNavigationView: View {
    @State private var showSplashScreen = true
    
    var body: some View {
        Group {
            if showSplashScreen {
                SplashScreenPhaseAnimatorView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                            withAnimation {
                                showSplashScreen = false
                            }
                        }
                    }
            } else {
                NavigationStack {
                    VStack {
                        Text("Make Friends")
                            .font(.title)
                            .bold()
                            .padding()
                        Text("Explore and connect with new people!")
                            .bold()
                            .foregroundStyle(.secondary)
                            .padding()
                        NavigationLink("Profile Page") {
                            Text("Profile Page")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(.blue)
                                .clipShape(.rect(cornerRadius: 10))
                                .padding()
                                .navigationTitle("Profile")
                        }
                    }
                    
                }.navigationTitle("Make Friends App")
            }
        }
        .transition(.opacity)
    }
        
}

#Preview {
    BlobNavigationView()
}
