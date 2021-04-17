/*
सोमवार
मंगलवार
बुधवार
गुरुवार
शुक्रवार
शनिवार
रविवार
*/
package datetimelang.hindi;
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
        return new DayName( switch( s ){
            case 'सोमवार':
                return Monday;
            case 'मंगलवार':
                return Tuesday;
            case 'बुधवार':
                return Wednesday;
            case 'गुरुवार':
                return Thursday;
            case 'शुक्रवार':
                return Friday;
            case 'शनिवार':
                return Saturday;
            case 'रविवार':
                return Sunday;
            case _:
                return null;
        } );
    }
    @:to
    public inline function toString() {
        var d: DTWeekDay = cast this;
        return switch( d ){
            case Monday:
                return 'सोमवार';
            case Tuesday:
                return 'मंगलवार';
            case Wednesday:
                return 'बुधवार';
            case Thursday:
                return 'गुरुवार';
            case Friday:
                return 'शुक्रवार';
            case Saturday:
                return 'शनिवार';
            case Sunday:
                return 'रविवार';
        }
    }
    public static inline function stringFromDateTime( dt: DateTime, mondayBased:Bool = false ): String {
        var d: DayName = cast( dt.getWeekDay(mondayBased), DTWeekDay );
        var s: String = d;
        return s;
    }
}
