/*
lunedì	martedì	mercoledì	giovedì	venerdì	sabato	domenica
*/
package datetimelang.italian;
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
            case 'lunedì':
                return Monday;
            case 'lunedi':
                return Monday;
            case 'martedì':
                return Tuesday;
            case 'martedi':
                return Tuesday;
            case 'mercoledì':
                return Wednesday;
            case 'mercoledi':
                return Wednesday;
            case 'giovedì':
                return Thursday;
            case 'giovedi':
                return Thursday;
            case 'venerdì':
                return Friday;
            case 'venerdi':
                return Friday;
            case 'sabato':
                return Saturday;
            case 'domenica':
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
                return 'lunedì';
            case Tuesday:
                return 'martedì';
            case Wednesday:
                return 'mercoledì';
            case Thursday:
                return 'giovedì';
            case Friday:
                return 'venerdì';
            case Saturday:
                return 'sabato';
            case Sunday:
                return 'domenica';
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
