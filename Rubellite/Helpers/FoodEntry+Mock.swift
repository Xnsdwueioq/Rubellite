//

import Foundation

extension FoodEntry {
  static var mock: FoodEntry {
    FoodEntry(
      name: "Куриная грудка",
      date: .now,
      grams: 150,
      calories: 247,
      protein: 46.5,
      fat: 5.4,
      carbs: 0
    )
  }
  
  static var mockArray: [FoodEntry] {
    let calendar = Calendar.current
    let today = Date()
    
    func daysAgo(_ n: Int) -> Date {
      calendar.date(byAdding: .day, value: -n, to: today) ?? today
    }
    
    return [
      // Сегодня
      FoodEntry(name: "Овсянка", date: daysAgo(0), grams: 200, calories: 136, protein: 4.5, fat: 2.3, carbs: 24.5),
      FoodEntry(name: "Греческий йогурт", date: daysAgo(0), grams: 170, calories: 100, protein: 17.0, fat: 0.7, carbs: 6.0),
      FoodEntry(name: "Банан", date: daysAgo(0), grams: 120, calories: 105, protein: 1.3, fat: 0.4, carbs: 27.0),
      FoodEntry(name: "Куриная грудка", date: daysAgo(0), grams: 200, calories: 220, protein: 46.0, fat: 2.4, carbs: 0.0),
      FoodEntry(name: "Рис варёный", date: daysAgo(0), grams: 250, calories: 325, protein: 6.0, fat: 0.5, carbs: 71.5),
      FoodEntry(name: "Огурец", date: daysAgo(0), grams: 150, calories: 23, protein: 1.1, fat: 0.1, carbs: 3.6),
      
      // Вчера
      FoodEntry(name: "Яичница (2 яйца)", date: daysAgo(1), grams: 130, calories: 185, protein: 12.6, fat: 14.0, carbs: 0.8),
      FoodEntry(name: "Цельнозерновой хлеб", date: daysAgo(1), grams: 60, calories: 138, protein: 5.4, fat: 1.6, carbs: 25.2),
      FoodEntry(name: "Авокадо", date: daysAgo(1), grams: 100, calories: 160, protein: 2.0, fat: 14.7, carbs: 8.5),
      FoodEntry(name: "Лосось запечённый", date: daysAgo(1), grams: 180, calories: 373, protein: 35.0, fat: 24.0, carbs: 0.0),
      FoodEntry(name: "Брокколи", date: daysAgo(1), grams: 200, calories: 68, protein: 5.6, fat: 0.6, carbs: 11.0),
      FoodEntry(name: "Оливковое масло", date: daysAgo(1), grams: 10, calories: 90, protein: 0.0, fat: 10.0, carbs: 0.0),
      
      // 2 дня назад
      FoodEntry(name: "Творог 5%", date: daysAgo(2), grams: 200, calories: 164, protein: 22.0, fat: 5.0, carbs: 6.8),
      FoodEntry(name: "Мёд", date: daysAgo(2), grams: 20, calories: 62, protein: 0.1, fat: 0.0, carbs: 16.8),
      FoodEntry(name: "Грецкие орехи", date: daysAgo(2), grams: 30, calories: 196, protein: 4.6, fat: 19.6, carbs: 4.1),
      FoodEntry(name: "Гречка варёная", date: daysAgo(2), grams: 250, calories: 330, protein: 8.0, fat: 1.7, carbs: 65.5),
      FoodEntry(name: "Говядина тушёная", date: daysAgo(2), grams: 150, calories: 248, protein: 28.5, fat: 14.7, carbs: 0.0),
      FoodEntry(name: "Помидор", date: daysAgo(2), grams: 120, calories: 22, protein: 1.1, fat: 0.2, carbs: 4.2),
      
      // 3 дня назад
      FoodEntry(name: "Смузи с ягодами", date: daysAgo(3), grams: 300, calories: 150, protein: 4.0, fat: 1.5, carbs: 30.0),
      FoodEntry(name: "Протеиновый батончик", date: daysAgo(3), grams: 60, calories: 210, protein: 20.0, fat: 7.0, carbs: 18.0),
      FoodEntry(name: "Паста с томатным соусом", date: daysAgo(3), grams: 300, calories: 390, protein: 13.0, fat: 6.0, carbs: 72.0),
      FoodEntry(name: "Пармезан", date: daysAgo(3), grams: 20, calories: 83, protein: 7.3, fat: 5.8, carbs: 0.3),
      FoodEntry(name: "Яблоко", date: daysAgo(3), grams: 180, calories: 94, protein: 0.4, fat: 0.3, carbs: 24.3),
      
      // 4 дня назад
      FoodEntry(name: "Блины (3 шт)", date: daysAgo(4), grams: 180, calories: 342, protein: 9.0, fat: 12.6, carbs: 48.6),
      FoodEntry(name: "Сметана 15%", date: daysAgo(4), grams: 40, calories: 62, protein: 0.9, fat: 6.0, carbs: 1.4),
      FoodEntry(name: "Тунец в собственном соку", date: daysAgo(4), grams: 185, calories: 148, protein: 34.0, fat: 0.5, carbs: 0.0),
      FoodEntry(name: "Хумус", date: daysAgo(4), grams: 80, calories: 192, protein: 5.2, fat: 12.8, carbs: 14.4),
      FoodEntry(name: "Морковь сырая", date: daysAgo(4), grams: 100, calories: 41, protein: 0.9, fat: 0.2, carbs: 9.6),
      
      // 5 дней назад
      FoodEntry(name: "Мюсли с молоком", date: daysAgo(5), grams: 250, calories: 340, protein: 9.5, fat: 7.0, carbs: 58.0),
      FoodEntry(name: "Апельсин", date: daysAgo(5), grams: 150, calories: 71, protein: 1.4, fat: 0.2, carbs: 16.5),
      FoodEntry(name: "Индейка запечённая", date: daysAgo(5), grams: 200, calories: 218, protein: 42.0, fat: 4.8, carbs: 0.0),
      FoodEntry(name: "Картофель варёный", date: daysAgo(5), grams: 200, calories: 166, protein: 4.0, fat: 0.2, carbs: 36.6),
      FoodEntry(name: "Зелёный горошек", date: daysAgo(5), grams: 100, calories: 73, protein: 5.1, fat: 0.2, carbs: 13.8),
      
      // 6 дней назад
      FoodEntry(name: "Протеиновый коктейль", date: daysAgo(6), grams: 350, calories: 175, protein: 30.0, fat: 2.5, carbs: 8.0),
      FoodEntry(name: "Арахисовая паста", date: daysAgo(6), grams: 30, calories: 188, protein: 7.1, fat: 16.1, carbs: 5.6),
      FoodEntry(name: "Цельнозерновые хлебцы", date: daysAgo(6), grams: 40, calories: 136, protein: 3.6, fat: 0.8, carbs: 28.0),
      FoodEntry(name: "Суп куриный", date: daysAgo(6), grams: 400, calories: 160, protein: 14.0, fat: 5.6, carbs: 12.0),
      FoodEntry(name: "Кефир 1%", date: daysAgo(6), grams: 250, calories: 75, protein: 7.5, fat: 2.5, carbs: 8.8),
    ]
  }
}
