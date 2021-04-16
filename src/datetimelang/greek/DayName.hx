/*
Δευτέρα
Τρίτη
Τετάρτη
Πέμπτη
Παρασκευή
Σάββατο
Κυριακή
*/
package datetimelang.greek;
import datetime.utils.DateTimeUtils;
import datetime.DateTime;
import datetime.DateTimeInterval;

abstract DayName( DTWeekDay ) to DTWeekDay from DTWeekDay {
    public inline
    function new( d: DTWeekDay ){
        this = d;
    }
    @:from
    static inline public function fromString( s: String ): Null<DayName> {
        return new DayName( switch( s ){
            case 'Δευτέρα':
                return Monday;
            case 'Τρίτη':
                return Tuesday;
            case 'Τετάρτη':
                return Wednesday;
            case 'Πέμπτη':
                return Thursday;
            case 'Παρασκευή':
                return Friday;
            case 'Σάββατο':
                return Saturday;
            case 'Κυριακή':
                return Sunday;
            case _:
                return null;
        } );
    }
    public inline function name( len: Int = -1 ){
        var str: String = toString();
        return if( len == -1 ){
            str;
        } else {
            str.substr( 0, len );
        }
    }
    @:to
    public inline function toString() {
        var d: DTWeekDay = cast this;
        return switch( d ){
            case Monday:
                return 'Δευτέρα';
            case Tuesday:
                return 'Τρίτη';
            case Wednesday:
                return 'Τετάρτη';
            case Thursday:
                return 'Πέμπτη';
            case Friday:
                return 'Παρασκευή';
            case Saturday:
                return 'Σάββατο';
            case Sunday:
                return 'Κυριακή';
        }
    }     
    public static inline function stringShortFromDateTime( dt: DateTime, len: Int = -1, mondayBased:Bool = false ){
        var m: MonthName = cast( dt.getWeekDay(mondayBased), DTWeekDay );
        var s: String = m.name( len );
        return s;
    }        
    public static inline function stringFromDateTime( dt: DateTime, mondayBased:Bool = false ): String {
        var m: WeekDayLongName = cast( dt.getWeekDay(mondayBased), DTWeekDay );
        var s: String = m;
        return s;
    }
}
