
/*
pazartesi	salı	çarşamba	perşembe	cuma	cumartesi	pazar
Pazartesi	Salı	Çarşamba	Perşembe	Cuma	Cumartesi	Pazar
*/

package datetimelang.turkish;
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
          						
            case 'pazartesi':
                return Monday;
            case 'salı':
                return Tuesday;
            case 'sali':
                return Tuesday;
            case 'çarşamba':
                return Wednesday;
            case 'carsamba':
                return Wednesday;
            case 'perşembe':
                return Thursday;
            case 'persembe':
                return Thursday;
            case 'cuma':
                return Friday;
            case 'cumartesi':
                return Saturday;
            case 'pazar':
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
                return 'Pazartesi';
            case Tuesday:
                return 'Salı';
            case Wednesday:
                return 'Çarşamba';
            case Thursday:
                return 'Perşembe';
            case Friday:
                return 'Cuma';
            case Saturday:
                return 'Cumartesi';
            case Sunday:
                return 'Pazar';
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
