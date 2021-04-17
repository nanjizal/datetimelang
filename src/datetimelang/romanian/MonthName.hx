/*
ianuarie	februarie	martie	aprilie	mai	iunie	iulie	august	septembrie	octombrie	noiembrie	decembrie
Ianuarie	Februarie	Martie	Aprilie	Mai	Iunie	Iulie	August	Septembrie	Octombrie	Noiembrie	Decembrie
*/
package datetimelang.romanian;
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
            case 'ianuarie':
                return January;
            case 'februarie':
                return February;
            case 'martie':
                return March;
            case 'aprilie':
                return April;
            case 'mai':
                return May;
            case 'iunie':
                return June;
            case 'iulie':
                return July;
            case 'august':
                return August;
            case 'septembrie':
                return September;
            case 'octombrie':
                return October;
            case 'noiembrie':
                return November;
            case 'decembrie':
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
    public inline function toLowerCase( len: Int = -1 ){
        return name( len ).toLowerCase();
    }
    public inline function alltoUpperCase( len: Int = -1 ){
        return name( len ).toUpperCase();
    }         
    @:to
    public inline function toString() {
        var m: DTMonth = cast this;
        return switch( m ){ 											
            case January:
                return 'Ianuarie';
            case February:
                return 'Februarie';
            case March:
                return 'Martie';
            case April:
                return 'Aprilie';
            case May:
                return 'Mai';
            case June:
                return 'Iunie';
            case July:
                return 'Iulie';
            case August:
                return 'August';
            case September:
                return 'Septembrie';
            case October:
                return 'Octombrie';
            case November:
                return 'Noiembrie';
            case December:
                return 'Decembrie';
        }
    }
    public static inline function stringAllUpFromDateTime( dt: DateTime, len: Int = -1 ){
        var m: MonthName = cast( dt.getMonth(), DTMonth );
        var s: String = m.name( len ).toUpperCase();
        return s;
    }           
    public static inline function stringLowerFromDateTime( dt: DateTime, len: Int = -1 ){
        var m: MonthName = cast( dt.getMonth(), DTMonth );
        var s: String = m.name( len ).toLowerCase();
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
