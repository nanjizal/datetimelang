package datetimelang.german;
import datetime.utils.DateTimeUtils;
import datetime.DateTime;
import datetime.DateTimeInterval;
// Januar	Februar	März	April	Mai	Juni	Juli	August	September	Oktober	November	Dezember
abstract MonthName( DTMonth ) to DTMonth from DTMonth {
    public inline function new( m: DTMonth ){
        this = m;
    }
    @:from
    static inline public function fromString( s: String ): Null<MonthName> {
        return new MonthName( switch( s.toLowerCase() ){
            case 'januar':
                return January;
            case 'februar':
                return February;
            case 'märz':
                return March;
            case 'marz':
                return March;
            case 'april':
                return April;
            case 'mai':
                return May;
            case 'juni':
                return June;
            case 'juli':
                return July;
            case 'august':
                return August;
            case 'september':
                return September;
            case 'ocktober':
                return October;
            case 'november':
                return November;
            case 'dezember':
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
                return 'Januar';
            case February:
                return 'Februar';
            case March:
                return 'März';
            case April:
                return 'April';
            case May:
                return 'Mai';
            case June:
                return 'Juni';
            case July:
                return 'Juli';
            case August:
                return 'August';
            case September:
                return 'September';
            case October:
                return 'Oktober';
            case November:
                return 'November';
            case December:
                return 'Dezember';
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
