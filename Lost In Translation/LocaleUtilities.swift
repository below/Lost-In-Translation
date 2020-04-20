//
//  LocaleUtilities.swift
//  Dage
//
//  Created by Alexander v. Below on 02.10.15.
//  Copyright © 2015 Alexander von Below. All rights reserved.
//

import Foundation

public class LocaleUtitlies  {
    public var calendar : Calendar
    public var locale : Locale
    let dayFormatter : DateFormatter
    let monthFormatter : DateFormatter
    init (locale : Locale) {
        self.locale = locale;
        self.calendar = locale.calendar
        dayFormatter = DateFormatter()
        dayFormatter.locale = locale
        dayFormatter.dateFormat = "EEEE"
        monthFormatter = DateFormatter()
        monthFormatter.locale = locale
        monthFormatter.dateFormat = "MMMM"
    }
    
    convenience init() {
        self.init(locale: Locale.current)
    }
    
    convenience init (localeIdentifier : String) {
        self.init(locale: Locale(identifier: localeIdentifier))
    }
    
    public func weekdayNameForIndex(index : Int) -> String {
        let dateComp = NSDateComponents()
        dateComp.weekday = index;
        dateComp.day = index;
        if let date = self.calendar.date(from: dateComp as DateComponents) {
            return dayFormatter.string(from: date)
        }
        return ""
    }

    public func monthNameForIndex(index : Int) -> String {
        let dateComp = NSDateComponents()
        dateComp.month = index;
        if let date = self.calendar.date(from: dateComp as DateComponents) {
            return monthFormatter.string(from: date)
        }
        return ""
    }
}
