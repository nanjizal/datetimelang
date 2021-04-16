/*
(Bokmål)
mandag	tirsdag	onsdag	torsdag	fredag	lørdag	søndag

(Nynorsk)
måndag	tysdag	onsdag	torsdag	fredag	laurdag	sundag
*/

package datetimelang.english;
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
            case 'mandag':
                return Monday;
            case 'tirsdag':
                return Tuesday;
            case 'onsdag':
                return Wednesday;
            case 'torsdag':
                return Thursday;
            case 'fredag':
                return Friday;
            case 'lørdag':
                return Saturday;
            case 'lordag':
                return Saturday;
            case 'søndag':
                return Sunday;
            case 'sondag':
                return Sunday;
            case 'måndag':
                return Monday;
            case 'tysdag':
                return Tuesday;
            case 'onsdag':
                return Wednesday;
            case 'torsdag':
                return Thursday;
            case 'fredag':
                return Friday;
            case 'laurdag':
                return Saturday;
            case 'sundag':
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
                return 'Mandag';
            case Tuesday:
                return 'Tirsdag';
            case Wednesday:
                return 'Onsdag';
            case Thursday:
                return 'Torsdag';
            case Friday:
                return 'Fredag';
            case Saturday:
                return 'Lørdag';
            case Sunday:
                return 'Søndag';
        }
    }
    public inline function toStringNynorsk() {				
        var d: DTWeekDay = cast this;
        return switch( d ){		
            case Monday:
                return 'Måndag';
            case Tuesday:
                return 'Tysdag';
            case Wednesday:
                return 'Onsdag';
            case Thursday:
                return 'Torsdag';
            case Friday:
                return 'Fredag';
            case Saturday:
                return 'Laurdag';
            case Sunday:
                return 'Sundag';
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
