package datetimelang.util;
import datetime.DateTime;
enum abstract Countries( String ) from String to String {
    var arabic;
    var english;
    var french;
    var german;
    var greek;
    var hebrew;
    var hindi;
    var italian;
    var norwegian;
    var polish;
    var portuguese;
    var romanian;
    var russian;
    var somali;
    var spanish;
    var swedish;
    var turkish;
    var welsh;
}

abstract Lang( Countries ) from Countries to Countries {
    public inline
    function new( c: Countries ){
        this = c;
    }
    public static inline
    function all(): Array<Countries>{
        return [ arabic, english, french, german, greek
               , hebrew, hindi, italian, norwegian, polish
               , portuguese, romanian, russian, somali, spanish
               , swedish, turkish, welsh ];
    }
    public inline
    function getWeekDayName( dt: DateTime, mondayBased:Bool = false ): String {
        var c: Lang = cast this;
        return switch( c ){
            case arabic:
                datetimelang.arabic.DayName.stringFromDateTime( dt, mondayBased );
            case english:
                datetimelang.english.DayName.stringFromDateTime( dt, mondayBased );
            case french:
                datetimelang.french.DayName.stringFromDateTime( dt, mondayBased );
            case german:
                datetimelang.german.DayName.stringFromDateTime( dt, mondayBased );
            case greek:
                datetimelang.greek.DayName.stringFromDateTime( dt, mondayBased );
            case hebrew:
                datetimelang.hebrew.DayName.stringFromDateTime( dt, mondayBased );
            case hindi:
                datetimelang.hindi.DayName.stringFromDateTime( dt, mondayBased );
            case italian:
                datetimelang.italian.DayName.stringFromDateTime( dt, mondayBased );
            case norwegian:
                datetimelang.norwegian.DayName.stringFromDateTime( dt, mondayBased );
            case polish:
                datetimelang.polish.DayName.stringFromDateTime( dt, mondayBased );
            case portuguese:
                datetimelang.portuguese.DayName.stringFromDateTime( dt, mondayBased );
            case romanian:
                datetimelang.romanian.DayName.stringFromDateTime( dt, mondayBased );
            case russian:
                datetimelang.russian.DayName.stringFromDateTime( dt, mondayBased );
            case somali:
                datetimelang.somali.DayName.stringFromDateTime( dt, mondayBased );
            case spanish:
                datetimelang.spanish.DayName.stringFromDateTime( dt, mondayBased );
            case swedish:
                datetimelang.swedish.DayName.stringFromDateTime( dt, mondayBased );
            case turkish:
                datetimelang.turkish.DayName.stringFromDateTime( dt, mondayBased );
            case welsh:
                datetimelang.welsh.DayName.stringFromDateTime( dt, mondayBased );
            case _:
                return null;
        }
    }
    public inline
    function getMonthName( dt: DateTime, mondayBased:Bool = false ): String {
        var c: Lang = cast this;
        return switch( c ){
            case arabic:
                datetimelang.arabic.MonthName.stringFromDateTime( dt );
            case english:
                datetimelang.english.MonthName.stringFromDateTime( dt );
            case french:
                datetimelang.french.MonthName.stringFromDateTime( dt );
            case german:
                datetimelang.german.MonthName.stringFromDateTime( dt );
            case greek:
                datetimelang.greek.MonthName.stringFromDateTime( dt );
            case hebrew:
                datetimelang.hebrew.MonthName.stringFromDateTime( dt );
            case hindi:
                datetimelang.hindi.MonthName.stringFromDateTime( dt );
            case italian:
                datetimelang.italian.MonthName.stringFromDateTime( dt );
            case norwegian:
                datetimelang.norwegian.MonthName.stringFromDateTime( dt );
            case polish:
                datetimelang.polish.MonthName.stringFromDateTime( dt );
            case portuguese:
                datetimelang.portuguese.MonthName.stringFromDateTime( dt );
            case romanian:
                datetimelang.romanian.MonthName.stringFromDateTime( dt );
            case russian:
                datetimelang.russian.MonthName.stringFromDateTime( dt );
            case somali:
                datetimelang.somali.MonthName.stringFromDateTime( dt );
            case spanish:
                datetimelang.spanish.MonthName.stringFromDateTime( dt );
            case swedish:
                datetimelang.swedish.MonthName.stringFromDateTime( dt );
            case turkish:
                datetimelang.turkish.MonthName.stringFromDateTime( dt );
            case welsh:
                datetimelang.welsh.MonthName.stringFromDateTime( dt );
            case _:
            return null;
        }
    }
}