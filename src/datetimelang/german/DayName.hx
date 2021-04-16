package;
import datetime.utils.DateTimeUtils;
import datetime.DateTime;
import datetime.DateTimeInterval;
/*
Montag
Dienstag
Mittwoch
Donnerstag
Freitag
Samstag
Sonntag
*/
/*
// Swiss German
Määntig
Ziischtig
Mittwuch
Dunschtig
Friitig
Samschtig
Sunntig
*/
/*
// Swabian
Mendich
Denschdich
Mittich
Donnerschtich
Fraidich
Samschdich
Sonndich
*/
abstract DayName( DTWeekDay ) to DTWeekDay from DTWeekDay {
    public inline
    function new( d: DTWeekDay ){
        this = d;
    }
    @:from
    static inline public function fromString( s: String ): Null<DayName> {
        return new DayName( switch( s.toLowerCase() ){
            case 'montag': 
                return Monday;
            case 'määntig':
                return Monday;
            case 'mendich':
                return Monday;
            case 'dienstag':
                return Tuesday;
            case 'ziischtig':
                return Tuesday;
            case 'denschdich':
                return Tuesday;
            case 'mittwoch':
                return Wednesday;
            case 'mittwuch':
                return Wednesday;
            case 'mittich':
                return Wednesday;
            case 'donnerstag':
                return Thursday;
            case 'dunschtig':
                return Thursday;
            case 'freitag':
                return Friday;
            case 'friitig':
                return Friday;
            case 'fraidich':
                return Friday;
            case 'samstag':
                return Saturday;
            case 'samschtig':
                return Saturday;
            case 'samschdich':
                return Saturday;
            case 'sonntag':
                return Sunday;
            case 'sunntig':
                return Sunday;
            case 'sonndich':
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
                return 'Montag';
            case Tuesday:
                return 'Dienstag';
            case Wednesday:
                return 'Mittwoch';
            case Thursday:
                return 'Donnerstag';
            case Friday:
                return 'Freitag';
            case Saturday:
                return 'Samtag';
            case Sunday:
                return 'Sonntag';
        }
    }
    public inline function toStringSwiss() {
        var d: DTWeekDay = cast this;
        return switch( d ){
            case Monday:
                return 'Määntig';
            case Tuesday:
                return 'Ziischtig';
            case Wednesday:
                return 'Mittwuch';
            case Thursday:
                return 'Dunschtig';
            case Friday:
                return 'Friitig';
            case Saturday:
                return 'Samschtig';
            case Sunday:
                return ' Sunntig';
        }
    }  
    public inline function toStringSwabian() {
        var d: DTWeekDay = cast this;
        return switch( d ){
            case Monday:
                return 'Mendich';
            case Tuesday:
                return 'Denschdich';
            case Wednesday:
                return 'Mittich';
            case Thursday:
                return 'Donnerschtich';
            case Friday:
                return 'Fraidich';
            case Saturday:
                return 'Samschdich';
            case Sunday:
                return 'Sonndich';
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
