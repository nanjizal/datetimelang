/*
понедельник (ponedel'nik)	
вторник (vtornik)
среда (sreda)
четверг (chetverk)
пятница (pyatnitsa)
суббота (subbota)
воскресенье (voskresen'ye)
*/
package;
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
            case 'понедельник':
                return Monday;
            case 'вторник':
                return Tuesday;
            case 'среда':
                return Wednesday;
            case 'четверг':
                return Thursday;
            case 'пятница':
                return Friday;
            case 'суббота':
                return Saturday;
            case 'воскресенье':
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
    public inline function lowerCase( len: Int = -1 ){
        return name( len ).toLowerCase();
    }
    public inline function allUpperCase( len: Int = -1 ){
        return name( len ).toUpperCase();
    }
    @:to
    public inline function toString() {
        var d: DTWeekDay = cast this;
        return switch( d ){
            case Monday:
                return 'понедельник';
            case Tuesday:
                return 'вторник';
            case Wednesday:
                return 'среда';
            case Thursday:
                return 'четверг';
            case Friday:
                return 'пятница';
            case Saturday:
                return 'суббота';
            case Sunday:
                return 'воскресенье';
        }
    }
    public static inline function stringAllUpFromDateTime( dt: DateTime, len: Int = -1, mondayBased:Bool = false ){
        var m: MonthName = cast( dt.getWeekDay(mondayBased), DTWeekDay );
        var s: String = m.upperCase( len );
        return s;
    }           
    public static inline function stringLowerFromDateTime( dt: DateTime, len: Int = -1, mondayBased:Bool = false ){
        var m: MonthName = cast( dt.getWeekDay(mondayBased), DTWeekDay );
        var s: String = m.lowerCase( len );
        return s;
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