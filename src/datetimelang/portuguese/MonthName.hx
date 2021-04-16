/*
janeiro	fevereiro	março	abril	maio	junho	julho	agosto	setembro	outubro	novembro	dezembro
Janeiro	Fevereiro	Março	Abril	Maio	Junho	Julho	Agosto	Setembro	Outubro	Novembro	Dezembro
*/
package datetimelang.portuguese;
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
            case 'janeiro':
                return January;
            case 'fevereiro':
                return February;
            case 'março':
                return March;
            case 'marco':
                return March;
            case 'abril':
                return April;
            case 'maio':
                return May;
            case 'junho':
                return June;
            case 'julho':
                return July;
            case 'agosto':
                return August;
            case 'setembro':
                return September;
            case 'outubro':
                return October;
            case 'novembro':
                return November;
            case 'dezembro':
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
                return 'Janeiro';
            case February:
                return 'Fevereiro';
            case March:
                return 'Março';
            case April:
                return 'Abril';
            case May:
                return 'Maio';
            case June:
                return 'Junho';
            case July:
                return 'Julho';
            case August:
                return 'Agosto';
            case September:
                return 'Setembro';
            case October:
                return 'Outubro';
            case November:
                return 'Novembro';
            case December:
                return 'Dezembro';
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
