//
//  FAQView.swift
//  Animations Course
//
//  Created by Shemek on 01/11/2025.
//

import SwiftUI

struct FAQItem: Identifiable {
    let id = UUID()
    
    let question: String
    let answer: String
}

struct FAQView: View {
    let colors: [Color] = [.blue, .red, .yellow, .green, .purple]
    let faqItems: [FAQItem] = [
        FAQItem(question: "How can I reset my password?", answer: "To reset your password, go to the login page and click the 'Forgot Password' link. Follow the instructions sent to your email."),
        FAQItem(question: "How do I edit my account information?", answer: "Log in to your account and navigate to 'My Profile' or 'Account Settings' to update your personal information."),
        FAQItem(question: "How do I cancel my subscription?", answer: "You can cancel your subscription by logging into your account, going to 'Subscription Management,' and clicking the 'Cancel' button. Please note any cancellation policies or fees.")
    ]
    var body: some View {
        VStack {
            Text("FAQ")
                .font(.largeTitle)
                .bold()
            ScrollView {
                VStack {
                    ForEach(faqItems) { item in
                        SlidingDisclosureGroupView(title: item.question, detailedText: item.answer, fillColor: colors.randomElement() ?? .secondary)
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    FAQView()
}
