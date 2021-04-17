
/*
	styczeń	luty	marzec	kwiecień	maj	czerwiec	lipiec	sierpień	wrzesień	październik	listopad	grudzień
*/
package datetimelang.polish;
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
            case 'styczeń':
                return January;
            case 'luty':
                return February;
            case 'marzec':
                return March;
            case 'kwiecień':
                return April;
            case 'maj':
                return May;
            case 'czerwiec':
                return June;
            case 'lipiec':
                return July;
            case 'sierpień':
                return August;
            case 'wrzesień':
                return September;
            case 'październik':
                return October;
            case 'listopad':
                return November;
            case 'grudzień':
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
                return 'Styczeń';
            case February:
                return 'Luty';
            case March:
                return 'Marzec';
            case April:
                return 'Kwiecień';
            case May:
                return 'Maj';
            case June:
                return 'Czerwiec';
            case July:
                return 'Lipiec';
            case August:
                return 'Sierpień';
            case September:
                return 'Wrzesień';
            case October:
                return 'Październik';
            case November:
                return 'Listopad';
            case December:
                return 'Grudzień';
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
