package datetimelang.somali;
/*
Jannaayo
Febraayo
Maarso
Abriil
Maayo
Juun
Julay
Ogost
Setembar
Oktoobar
Noofeembar
Desembar
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
            case 'jannaayo':
                return January;
            case 'febraayo':
                return February;
            case 'maarso':
                return March;
            case 'abriil':
                return April;
            case 'maayo':
                return May;
            case 'juun':
                return June;
            case 'julay':
                return July;
            case 'ogost':
                return August;
            case 'setembar':
                return September;
            case 'Oktoobar':
                return October;
            case 'november':
                return November;
            case 'december':
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
                return 'Jannaayo';
            case February:
                return 'Febraayo';
            case March:
                return 'Maarso';
            case April:
                return 'Abriil';
            case May:
                return 'Maayo';
            case June:
                return 'Juun';
            case July:
                return 'Julay';
            case August:
                return 'Ogost';
            case September:
                return 'Setembar';
            case October:
                return 'Oktoobar';
            case November:
                return 'Noofeembar';
            case December:
                return 'Desembar';
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
