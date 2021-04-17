package datetimelang.util;
import datetimelang.util.Lang;
import datetime.DateTime;
@:forward
abstract ShiftDateTime( DateTime ) from DateTime to DateTime {
    public inline 
    function new( dateTime: DateTime ){
        this = dateTime;
    }
    public inline
    function getAnotherDay( i: Int ): ShiftDateTime {
        return new ShiftDateTime( this + Day( i ) );
    }
    public inline
    function getFirstWeekDay( ?mondayBased:Bool = true ): Int {
        var startDateForMonth = this.getMonthStart( this.getMonth() );
        return startDateForMonth.getWeekDay( mondayBased );
    }
    public inline
    function daysMonth(): Int {
        return this.daysInThisMonth();
    }
    public function getWeekdayName( countries: Countries ): String {
        return ( new Lang( countries ) ).getWeekDayName( this );
    }
    public function getMonthName( countries: Countries ): String {
        return ( new Lang( countries ) ).getMonthName( this );
    }
}