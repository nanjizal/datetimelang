/*
gennaio	febbraio	marzo	aprile	maggio	giugno	luglio	agosto	settembre	ottobre	novembre	dicembre
*/
package datetimelang.italian;
import datetime.utils.DateTimeUtils;
import datetime.DateTime;
import datetime.DateTimeInterval;

abstract MonthName( DTMonth ) to DTMonth from DTMonth {
    public inline function new( m: DTMonth ){
        this = m;
    }
    @:from
    static inline public function fromString( s: String ): Null<MonthName> {
        return new MonthName( switch( s.toLowerCase() ){
            case 'gennaio':
                return January;
            case 'febbraio':
                return February;
            case 'marzo':
                return March;
            case 'aprile':
                return April;
            case 'maggio':
                return May;
            case 'giugno':
                return June;
            case 'luglio':
                return July;
            case 'agosto':
                return August;
            case 'settembre':
                return September;
            case 'ottobre':
                return October;
            case 'novembre':
                return November;
            case 'dicembre':
                return December;
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
        var m: DTMonth = cast this;
        return switch( m ){
            case January:
                return 'Gennaio';
            case February:
                return 'Febbraio';
            case March:
                return 'Marzo';
            case April:
                return 'Aprile';
            case May:
                return 'Maggio';
            case June:
                return 'Giugno';
            case July:
                return 'Luglio';
            case August:
                return 'Agosto';
            case September:
                return 'Settembre';
            case October:
                return 'Ottobre';
            case November:
                return 'Novembre';
            case December:
                return 'Dicembre';
        }
    }
    public static inline function stringAllUpFromDateTime( dt: DateTime, len: Int = -1 ){
        var m: MonthName = cast( dt.getMonth(), DTMonth );
        var s: String = m.upperCase( len );
        return s;
    }           
    public static inline function stringLowerFromDateTime( dt: DateTime, len: Int = -1 ){
        var m: MonthName = cast( dt.getMonth(), DTMonth );
        var s: String = m.lowerCase( len );
        return s;
    }        
    public static inline function stringShortFromDateTime( dt: DateTime, len: Int = -1 ){
        var m: MonthName = cast( dt.getMonth(), DTMonth );
        var s: String = m.name( len );
        return s;
    }        
    public static inline function stringFromDateTime( dt: DateTime ){
        var m: MonthName = cast( dt.getMonth(), DTMonth );
        var s: String = m;
        return s;
    }
}
