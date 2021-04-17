/*
Iανουάριος
Φεβρουάριος
Μάρτιος
Aρίλιος
Μάιος
Iούνιος
Iούλιος
ύγουστος
Σεπτέμβριος
Oκτώβριος
Νοέμβριος
Δεκέμβριος
*/
package datetimelang.greek;
import datetime.utils.DateTimeUtils;
import datetime.DateTime;
import datetime.DateTimeInterval;

abstract MonthName( DTMonth ) to DTMonth from DTMonth {
    public inline function new( m: DTMonth ){
        this = m;
    }
    @:from
    static inline public function fromString( s: String ): Null<MonthName> {
        return new MonthName( switch( s ){
            case 'Iανουάριος':
                return January;
            case 'Φεβρουάριος':
                return February;
            case 'Μάρτιος':
                return March;
            case 'Aρίλιος':
                return April;
            case 'Μάιος':
                return May;
            case 'Iούνιος':
                return June;
            case 'Iούλιος':
                return July;
            case 'ύγουστος':
                return August;
            case 'Σεπτέμβριος':
                return September;
            case 'Oκτώβριος':
                return October;
            case 'Νοέμβριος':
                return November;
            case 'Δεκέμβριος':
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
    @:to
    public inline function toString() {
        var m: DTMonth = cast this;
        return switch( m ){
            case January:
                return 'Iανουάριος';
            case February:
                return 'Φεβρουάριος';
            case March:
                return 'Μάρτιος';
            case April:
                return 'Aρίλιος';
            case May:
                return 'Μάιος';
            case June:
                return 'Iούνιος';
            case July:
                return 'Iούλιος';
            case August:
                return 'ύγουστος';
            case September:
                return 'Σεπτέμβριος';
            case October:
                return 'Oκτώβριος';
            case November:
                return 'Νοέμβριος';
            case December:
                return 'Δεκέμβριος';
        }
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
