package datetimelang.spanish;
/*
enero	febrero	marzo	abril	mayo	junio	julio	agosto	septiembre	octubre	noviembre	diciembre
*/
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
            case 'enero': 
                return January;
            case 'febrero':
                return February;
            case 'marzo':
                return March;
            case 'abril':
                return April;
            case 'mayo':
                return May;
            case 'junio':
                return June;
            case 'julio':
                return July;
            case 'agosto':
                return August;
            case 'septiembre':
                return September;
            case 'octubre':
                return October;
            case 'noviembre':
                return November;
            case 'diciembre':
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
                return 'Enero';
            case February:
                return 'Febrero';
            case March:
                return 'Marzo';
            case April:
                return 'Abril';
            case May:
                return 'Mayo';
            case June:
                return 'Junio';
            case July:
                return 'Julio';
            case August:
                return 'Agosto';
            case September:
                return 'Septiembre';
            case October:
                return 'Octubre';
            case November:
                return 'Noviembre';
            case December:
                return 'Diciembre';
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
