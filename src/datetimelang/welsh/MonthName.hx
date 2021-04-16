/*
Ionawr Chwefror Mawrth Ebrill Mai Mehefin Gorffennaf Awst Medi Hydref Tachwedd Rhagfyr
ionawr chwefror mawrth ebrill mai mehefin gorffennaf awst medi hydref tachwedd rhagfyr
*/
package datetimelang.welsh;
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
            case 'ionawr':
                return January;
            case 'chwefror':
                return February;
            case 'mawrth':
                return March;
            case 'ebrill':
                return April;
            case 'mai':
                return May;
            case 'mehefin':
                return June;
            case 'gorffennaf':
                return July;
            case 'awst':
                return August;
            case 'medi':
                return September;
            case 'hydref':
                return October;
            case 'tachwedd':
                return November;
            case 'rhagfyr':
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
                return 'Ionawr';
            case February:
                return 'Chwefror';
            case March:
                return 'Mawrth';
            case April:
                return 'Ebrill';
            case May:
                return 'Mai';
            case June:
                return 'Mehefin';
            case July:
                return 'Gorffennaf';
            case August:
                return 'Awst';
            case September:
                return 'Medi';
            case October:
                return 'Hydref';
            case November:
                return 'Tachwedd';
            case December:
                return 'Rhagfyr';
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
