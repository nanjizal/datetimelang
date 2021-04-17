/*
luni	marţi	miercuri	joi	vineri	sîmbătă	duminică
Luni	Marţi	Miercuri	Joi	Vineri	Sîmbătă	Duminică
*/
package datetimelang.romanian;
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
          					
            case 'luni':
                return Monday;
            case 'marţi':
                return Tuesday;
            case 'marti':
                return Tuesday;
            case 'miercuri':
                return Wednesday;
            case 'joi':
                return Thursday;
            case 'vineri':
                return Friday;
            case 'sîmbătă':
                return Saturday;
            case 'simbata':
                return Saturday;
            case 'duminică':
                return Sunday;
            case 'duminica':
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
                return 'Luni';
            case Tuesday:
                return 'Marţi';
            case Wednesday:
                return 'Miercuri';
            case Thursday:
                return 'Joi';
            case Friday:
                return 'Vineri';
            case Saturday:
                return 'Sîmbătă';
            case Sunday:
                return 'Duminică';
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
