/*
जनवरी
फ़रवरी
मार्च
अप्रैल
मई
जून
जुलाई
अगस्त
सितंबर
अक्टूबर
नवंबर
दिसंबर
*/
package datetimelang.hindi;
import datetime.utils.DateTimeUtils;
import datetime.DateTime;
import datetime.DateTimeInterval;

abstract MonthName( DTMonth ) to DTMonth from DTMonth {
    public inline function new( m: DTMonth ){
        this = m;
    }
    @:from
    static inline public function fromString( s: String ): Null<MonthName> {
        return new MonthName( switch( s ){
            case 'जनवरी':
                return January;
            case 'फ़रवरी':
                return February;
            case 'मार्च':
                return March;
            case 'अप्रैल':
                return April;
            case 'मई':
                return May;
            case 'जून':
                return June;
            case 'जुलाई':
                return July;
            case 'अगस्त':
                return August;
            case 'सितंबर':
                return September;
            case 'अक्टूबर':
                return October;
            case 'नवंबर':
                return November;
            case 'दिसंबर':
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
                return 'जनवरी';
            case February:
                return 'फ़रवरी';
            case March:
                return 'मार्च';
            case April:
                return 'अप्रैल';
            case May:
                return 'मई';
            case June:
                return 'जून';
            case July:
                return 'जुलाई';
            case August:
                return 'अगस्त';
            case September:
                return 'सितंबर';
            case October:
                return 'अक्टूबर';
            case November:
                return 'नवंबर';
            case December:
                return 'दिसंबर';
        }
    }   
    public static inline function stringFromDateTime( dt: DateTime ){
        var m: MonthName = cast( dt.getMonth(), DTMonth );
        var s: String = m;
        return s;
    }
}
