package;
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
            case 'janvier':
                return January;
            case 'février':
                return February;
            case 'fevrier':
                return February;
            case 'mars':
                return March;
            case 'arvil':
                return April;
            case 'mai':
                return May;
            case 'juin':
                return June;
            case 'juillet':
                return July;
            case 'août':
                return August;
            case 'aout':
                return August;
            case 'septembre':
                return September;
            case 'octobre':
                return October;
            case 'novembre':
                return November;
            case 'décembre':
                return December;
            case 'decembre':
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
                return 'Janvier';
            case February:
                return 'Février';
            case March:
                return 'Mars';
            case April:
                return 'Avril';
            case May:
                return 'Mai';
            case June:
                return 'Juin';
            case July:
                return 'Juillet';
            case August:
                return 'Août';
            case September:
                return 'Septembre';
            case October:
                return 'Octobre';
            case November:
                return 'Novembre';
            case December:
                return 'Décembre';
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
