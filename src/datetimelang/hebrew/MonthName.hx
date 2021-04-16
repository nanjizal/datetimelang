/*
ינואר
פברואר
מרץ
אפריל
מאי
יוני
יולי
אוגוסט
ספטמבר
אוקטובר
נובמבר
דצמבר
*/
package datetimelang.hebrew;
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
            case 'ינואר':
                return January;
            case 'פברואר':
                return February;
            case 'מרץ':
                return March;
            case 'אפריל':
                return April;
            case 'מאי':
                return May;
            case 'יוני':
                return June;
            case 'יולי':
                return July;
            case 'אוגוסט':
                return August;
            case 'ספטמבר':
                return September;
            case 'אוקטובר':
                return October;
            case 'נובמבר':
                return November;
            case 'דצמבר':
                return December;
            case _:
                return null;
        } );
    }        
    @:to
    public inline function toString() {
        var m: DTMonth = cast this;
        return switch( m ){
            case January:
                return 'ינואר';
            case February:
                return 'פברואר';
            case March:
                return 'מרץ';
            case April:
                return 'אפריל';
            case May:
                return 'מאי';
            case June:
                return 'יוני';
            case July:
                return 'יולי';
            case August:
                return 'אוגוסט';
            case September:
                return 'ספטמבר';
            case October:
                return 'אוקטובר';
            case November:
                return 'נובמבר';
            case December:
                return 'דצמבר';
        }
    }  
    public static inline function stringFromDateTime( dt: DateTime ){
        var m: MonthName = cast( dt.getMonth(), DTMonth );
        var s: String = m;
        return s;
    }
}
