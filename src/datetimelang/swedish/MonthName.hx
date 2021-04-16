/*
januari	februari	mars	april	maj	juni	juli	augusti	september	oktober	november	december
*/
package datetimelang.english;
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
            case 'januari':
                return January;
            case 'februari':
                return February;
            case 'mars':
                return March;
            case 'april':
                return April;
            case 'maj':
                return May;
            case 'juni':
                return June;
            case 'juli':
                return July;
            case 'augusti':
                return August;
            case 'september':
                return September;
            case 'oktober':
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
                return 'Januari';
            case February:
                return 'Februari';
            case March:
                return 'Mars';
            case April:
                return 'April';
            case May:
                return 'Maj';
            case June:
                return 'Juni';
            case July:
                return 'Juli';
            case August:
                return 'Augusti';
            case September:
                return 'September';
            case October:
                return 'Oktober';
            case November:
                return 'November';
            case December:
                return 'December';
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
