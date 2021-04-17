/*
dydd Llun
dydd Mawrth
dydd Mercher
dydd Iau
dydd Gwener
dydd Sadwrn
dydd Sul
*/
package datetimelang.welsh;
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
            case 'dydd llun':
                return Monday;
            case 'dydd mawrth':
                return Tuesday;
            case 'dydd mercher':
                return Wednesday;
            case 'dydd iau':
                return Thursday;
            case 'dydd gwener':
                return Friday;
            case 'dydd sadwrn':
                return Saturday;
            case 'dydd sul':
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
    public inline function toLowerCase( len: Int = -1 ){
        return name( len ).toLowerCase();
    }
    public inline function alltoUpperCase( len: Int = -1 ){
        return name( len ).toUpperCase();
    }
    @:to
    public inline function toString() {
        var d: DTWeekDay = cast this;
        return switch( d ){
            case Monday:
                return 'Llun';
            case Tuesday:
                return 'Mawrth';
            case Wednesday:
                return 'Mercher';
            case Thursday:
                return 'Iau';
            case Friday:
                return 'Gwener';
            case Saturday:
                return 'Sadwrn';
            case Sunday:
                return 'Sul';
        }
    }
    public inline function toStringDydd() {
        var d: DTWeekDay = cast this;
        return switch( d ){
            case Monday:
                return 'dydd Llun';
            case Tuesday:
                return 'dydd Mawrth';
            case Wednesday:
                return 'dydd Mercher';
            case Thursday:
                return 'dydd Iau';
            case Friday:
                return 'dydd Gwener';
            case Saturday:
                return 'dydd Sadwrn';
            case Sunday:
                return 'dydd Sul';
        }
    } 
    public static inline function stringAllUpFromDateTime( dt: DateTime, len: Int = -1, mondayBased:Bool = false ){
        var d: DayName = cast( dt.getWeekDay(mondayBased), DTWeekDay );
        var s: String = d.name( len ).toUpperCase();
        return s;
    }
    public static inline function stringLowerFromDateTime( dt: DateTime, len: Int = -1, mondayBased:Bool = false ){
        var d: DayName = cast( dt.getWeekDay(mondayBased), DTWeekDay );
        var s: String = d.name( len ).toLowerCase();
        return s;
    }
    public static inline function stringShortFromDateTime( dt: DateTime, len: Int = -1, mondayBased:Bool = false ){
        var d: DayName = cast( dt.getWeekDay(mondayBased), DTWeekDay );
        var s: String = d.name( len );
        return s;
    }
    public static inline function stringFromDateTime( dt: DateTime, mondayBased:Bool = false ): String {
        var d: DayName = cast( dt.getWeekDay(mondayBased), DTWeekDay );
        var s: String = d;
        return s;
    }   
}
