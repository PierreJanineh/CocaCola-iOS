//
//  HomeViewModel.swift
//  CocaCola
//
//  Created by Pierre Janineh on 23/11/2024.
//

import SwiftUI

extension HomeView {
    class ViewModel: ObservableObject {
        @Published var items: [SingleAd] = [
            .init(title: "לורם איפסום דולור סיט אמט, קונסקטורר אדיפיסינג אלית קולורס מונפרד אדנדום סילקוף, מרגשי ומרגשח. עמחליף לורם איפסום דולור סיט אמט, קונסקטורר אדיפיסינג אלית. סת אלמנקום ניסי נון ניבאה. דס איאקוליס וולופטה דיאם. וסטיבולום אט דולור, קראס אגת לקטוס וואל אאוגו וסטיבולום סוליסי טידום בעליק. ושבעגט ליבם סולגק. בראיט ולחת צורק מונחף, בגורמי מגמש. תרבנך וסתעד לכנו סתשם השמה - לתכי מורגם בורק? לתיג ישבעס.", subtitle: "לורם איפסום דולור סיט אמט, קונסקטורר אדיפיסינג אלית קולורס מונפרד אדנדום סילקוף, מרגשי ומרגשח. עמחליף לורם איפסום דולור סיט אמט, קונסקטורר אדיפיסינג אלית. סת אלמנקום ניסי נון ניבאה. דס איאקוליס וולופטה דיאם. וסטיבולום אט דולור, קראס אגת לקטוס וואל אאוגו וסטיבולום סוליסי טידום בעליק. ושבעגט ליבם סולגק. בראיט ולחת צורק מונחף, בגורמי מגמש. תרבנך וסתעד לכנו סתשם השמה - לתכי מורגם בורק? לתיג ישבעס.", image: URL(string: "https://datilishes.b-cdn.net/wp-content/uploads/2023/09/מוזס-שופ-צילום-גיל-אבירם-5-2048x1365.jpg")),
            .init(title: "כותרת 2", subtitle: "גוף", image: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSq2GjswAa3h3_44Uz-TiKXUERaPcKjq2FGxQ&s")),
            .init(title: "כותרת 3", subtitle: "גוף", image: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTN8Cio9bKOUd-YUTjDdadi3QgxZ7ZgtfpvSg&s"))
        ]
    }
}
