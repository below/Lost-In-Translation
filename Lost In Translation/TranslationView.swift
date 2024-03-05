//
//  TranslationView.swift
//  Lost In Translation
//
//  Created by Alexander von Below on 04.03.24.
//  Copyright © 2024 Alexander von Below. All rights reserved.
//

import SwiftUI

struct TranslationView: View {
    var body: some View {
        VStack {
            Text("You've lost your LA privileges")
                .padding()
            Text("Preferred Localization: \(Bundle.main.preferredLocalizations.first!)")
            Text(Locale.current.identifier)
        }
    }
}

#Preview("English") {
    TranslationView()
        .environment(\.locale, .init(identifier: "en"))
}

#Preview("German") {
    TranslationView()
        .environment(\.locale, .init(identifier: "de"))
}

#Preview("Kölsch") {
    TranslationView()
        .environment(\.locale, .init(identifier: "ksh"))
}

#Preview("tlhIngan Hol") {
    TranslationView()
        .environment(\.locale, .init(identifier: "tlh"))
}
