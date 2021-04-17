package datetimelang.arabic;
/*
يوم الإثنين
يوم الثلاثاء
يوم الأربعاء
يوم الخميس
يوم الجمعة
يوم السبت
يوم الأحد
*/
/*
Egyptian
الاتنين
التلات
الاربع
الخميس
الجمعة
السبت
الحد
*/
import datetime.utils.DateTimeUtils;
import datetime.DateTime;
import datetime.DateTimeInterval;

abstract DayName( DTWeekDay ) to DTWeekDay from DTWeekDay {
    public inline
    function new( d: DTWeekDay ){
        this = d;
    }
    @:from
    static inline public function fromString( s: String ): Null<DayName> {
        return new DayName( switch( s.toLowerCase() ){
            case 'يوم الإثنين':
                return Monday;
            case 'الاتنين':
                return Monday;
            case 'يوم الثلاثاء':
                return Tuesday;
            case 'التلات':
                return Tuesday;  
            case 'يوم الأربعاء':
                return Wednesday;
            case 'الاربع':
                return Wednesday;
            case 'يوم الخميس':
                return Thursday;
            case 'الخميس':
                return Thursday;
            case 'يوم الجمعة':
                return Friday;
            case 'الجمعة':
                return Friday;
            case 'يوم السبت':
                return Saturday;
            case 'السبت':
                return Saturday;
            case 'يوم الأحد':
                return Sunday;
            case 'الحد':
                return Sunday;
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
        var d: DTWeekDay = cast this;
        return switch( d ){
            case Monday:
                return 'يوم الإثنين';
            case Tuesday:
                return 'يوم الثلاثاء';
            case Wednesday:
                return 'يوم الأربعاء';
            case Thursday:
                return 'يوم الخميس';
            case Friday:
                return 'يوم الجمعة';
            case Saturday:
                return 'يوم السبت';
            case Sunday:
                return 'يوم الأحد';
        }
    }
    public inline function toStringEygpt() {
        var d: DTWeekDay = cast this;
        return switch( d ){
            case Monday:
                return 'الإثنين';
            case Tuesday:
                return 'الثلاثاء';
            case Wednesday:
                return 'الأربعاء';
            case Thursday:
                return 'الخميس';
            case Friday:
                return 'الجمعة';
            case Saturday:
                return 'السبت';
            case Sunday:
                return 'الأحد';
        }
    }
    public static inline function stringFromDateTime( dt: DateTime, mondayBased:Bool = false ): String {
        var d: DayName = cast( dt.getWeekDay(mondayBased), DTWeekDay );
        var s: String = d;
        return s;
    }
}
