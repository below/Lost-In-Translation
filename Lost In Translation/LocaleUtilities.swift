//
//  LocaleUtilities.swift
//  Dage
//
//  Created by Alexander v. Below on 02.10.15.
//  Copyright © 2015 Alexander von Below. All rights reserved.
//

import Foundation

public class LocaleUtitlies  {
    public var calendar : NSCalendar
    public var locale : NSLocale
    let dayFormatter : NSDateFormatter
    let monthFormatter : NSDateFormatter
    init (locale : NSLocale) {
        self.locale = locale;
        self.calendar = locale.objectForKey(NSLocaleCalendar) as! NSCalendar
        dayFormatter = NSDateFormatter()
        dayFormatter.locale = locale
        dayFormatter.dateFormat = "EEEE"
        monthFormatter = NSDateFormatter()
        monthFormatter.locale = locale
        monthFormatter.dateFormat = "MMMM"
    }
    
    convenience init() {
        self.init(locale: NSLocale.currentLocale())
    }
    
    convenience init (localeIdentifier : String) {
        self.init(locale: NSLocale(localeIdentifier: localeIdentifier))
    }
    
    public func weekdayNameForIndex(index : Int) -> String {
        let dateComp = NSDateComponents()
        dateComp.weekday = index;
        dateComp.day = index;
        if let date = self.calendar.dateFromComponents(dateComp) {
            return dayFormatter.stringFromDate(date)
        }
        return ""
    }

    public func monthNameForIndex(index : Int) -> String {
        let dateComp = NSDateComponents()
        dateComp.month = index;
        if let date = self.calendar.dateFromComponents(dateComp) {
            return monthFormatter.stringFromDate(date)
        }
        return ""
    }
}