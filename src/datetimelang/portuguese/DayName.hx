/*
segunda-feira
terça-feira
quarta-feira
quinta-feira
sexta-feira
sábado
domingo
*/
package datetimelang.portuguese;
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
            case 'segunda-feira':
                return Monday;
            case 'terça-feira':
                return Tuesday;
            case 'terca-feira':
                return Tuesday;
            case 'quarta-feira':
                return Wednesday;
            case 'quinta-feira':
                return Thursday;
            case 'sexta-feira':
                return Friday;
            case 'sábado':
                return Saturday;
            case 'sabado':
                return Saturday;
            case 'domingo':
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
                return 'Segunda';
            case Tuesday:
                return 'Terça';
            case Wednesday:
                return 'Quarta';
            case Thursday:
                return 'Quinta';
            case Friday:
                return 'Sexta';
            case Saturday:
                return 'Sábado';
            case Sunday:
                return 'Domingo';
        }
    }
    public inline function toStringDay() {
        var d: DTWeekDay = cast this;
        return switch( d ){
            case Monday:
                return 'feira-Segunda';
            case Tuesday:
                return 'feira-Terça';
            case Wednesday:
                return 'feira-Quarta';
            case Thursday:
                return 'feira-Quinta';
            case Friday:
                return 'feira-Sexta';
            case Saturday:
                return 'Sábado';
            case Sunday:
                return 'Domingo';
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
