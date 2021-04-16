package datetimelang.russian;
import datetime.utils.DateTimeUtils;
import datetime.DateTime;
import datetime.DateTimeInterval;
/* январь
(janvar')	февраль
(fevral’)	март
(mart)	апрель
(aprel')	май
(maj)	июнь
(ijun')	июль
(ijul')	август
(avgust)	сентябрь
(sentjabr')	октябрь
(oktjabr')	ноябрь
(nojabr')	декабрь
(dekabr') */
январь	февраль	март	апрель	май	июнь	июль	август	сентябрь октябрь 	ноябрь декабрь

abstract MonthName( DTMonth ) to DTMonth from DTMonth {
    public inline function new( m: DTMonth ){
        this = m;
    }
    @:from
    static inline public function fromString( s: String ): Null<MonthName> {
        return new MonthName( switch( s.toLowerCase() ){
            case 'январь':
                return January;
            case 'февраль':
                return February;
            case 'март':
                return March;
            case 'апрель':
                return April;
            case 'май':
                return May;
            case 'июнь':
                return June;
            case 'июль':
                return July;
            case 'август':
                return August;
            case 'сентябрь':
                return September;
            case 'октябрь':
                return October;
            case 'ноябрь':
                return November;
            case 'декабрь':
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
                return 'январь';
            case February:
                return 'февраль';
            case March:
                return 'март';
            case April:
                return 'апрель';
            case May:
                return 'май';
            case June:
                return 'июнь';
            case July:
                return 'июль';
            case August:
                return 'август';
            case September:
                return 'сентябрь';
            case October:
                return 'октябрь';
            case November:
                return 'ноябрь';
            case December:
                return 'декабрь';
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
