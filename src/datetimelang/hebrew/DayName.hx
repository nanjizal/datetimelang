
/*
יום שני
יום שלישי
יום רביעי
יום חמישי
יום שישי
יום שבת
יום ראשון
*/
package datetimelang.hebrew;
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
        return new DayName( switch( s.toLowerCase() ){
            case 'יום שני':
                return Monday;
            case 'יום שלישי':
                return Tuesday;
            case 'יום רביעי':
                return Wednesday;
            case 'יום חמישי':
                return Thursday;
            case 'יום שישי':
                return Friday;
            case 'יום שבת':
                return Saturday;
            case 'יום ראשון':
                return Sunday;
            case _:
                return null;
        } );
    }
    @:to
    public inline function toString() {
        var d: DTWeekDay = cast this;
        return switch( d ){
            case Monday:
                return 'יום שני';
            case Tuesday:
                return 'יום שלישי';
            case Wednesday:
                return 'יום רביעי';
            case Thursday:
                return 'יום חמישי';
            case Friday:
                return 'יום שישי';
            case Saturday:
                return 'יום שבת';
            case Sunday:
                return 'יום ראשון';
        }
    }      
    public static inline function stringFromDateTime( dt: DateTime, mondayBased:Bool = false ): String {
        var d: DayName = cast( dt.getWeekDay(mondayBased), DTWeekDay );
        var s: String = d;
        return s;
    }
}
