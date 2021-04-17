/*
ocak	şubat	mart	nisan	mayis	haziran	temmuz	ağustos	eylül	ekim	kasım	aralık
Ocak	Şubat	Mart	Nisan	Mayis	Haziran	Temmuz	Ağustos	Eylül	Ekim	Kasım	Aralık
*/
package datetimelang.turkish;
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
            case 'ocak':
                return January;
            case 'şubat':
                return February;
            case 'subat':
                return February;
            case 'mart':
                return March;
            case 'nisan':
                return April;
            case 'mayis':
                return May;
            case 'haziran':
                return June;
            case 'temmuz':
                return July;
            case 'ağustos':
                return August;
            case 'agustos':
                return August;
            case 'eylül':
                return September;
            case 'eylul':
                return September;
            case 'ekim':
                return October;
            case 'kasım':
                return November;
            case 'kasim':
                return November;
            case 'aralık':
                return December;
             case 'aralik':
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
                return 'Ocak';
            case February:
                return 'Şubat';
            case March:
                return 'Mart';
            case April:
                return 'Nisan';
            case May:
                return 'Mayis';
            case June:
                return 'Haziran';
            case July:
                return 'Temmuz';
            case August:
                return 'Ağustos';
            case September:
                return 'Eylül';
            case October:
                return 'Ekim';
            case November:
                return 'Kasım';
            case December:
                return 'Aralık';
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
