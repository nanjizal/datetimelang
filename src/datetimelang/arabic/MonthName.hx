
/*
Levant and Mesopotamia
كَانُون ٱلثَّانِي
شُبَاط
آذَار
نَيْسَان
أَيَّار
حَزِيرَان
تَمُّوز
آب
أَيْلُول
تِشْرِين ٱلْأَوَّل
تِشْرِين ٱلثَّانِي
كَانُون ٱلْأَوَّل
/*
Arabic - Egypt, Sudan, Yeman
يناير
فبراير
مارس
أبريل
مايو
يونيو
يوليه
أغسطس
سبتمبر
أكتوبر
نوفمبر
ديسمبر
*/
/*
Algeria and Tunisia
جانفي
فيفري
مارس
أفريل
ماي
جوان
جويلية
أوت
سبتمبر
أكتوبر
نوفمبر
ديسمبر
*/
/*
Morocco
يَنايِر
فِبرايِر
مارس
أبريل
ماي
يونيّو
يوليّوز
غُشت
شُتَنبِر
أُكتوبِر
نُوَنبِر
دُجَنبِر
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
            case 'january':
                return January;
            case 'february':
                return February;
            case 'march':
                return March;
            case 'april':
                return April;
            case 'may':
                return May;
            case 'june':
                return June;
            case 'july':
                return July;
            case 'august':
                return August;
            case 'september':
                return September;
            case 'october':
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
                return 'January';
            case February:
                return 'February';
            case March:
                return 'March';
            case April:
                return 'April';
            case May:
                return 'May';
            case June:
                return 'June';
            case July:
                return 'July';
            case August:
                return 'August';
            case September:
                return 'September';
            case October:
                return 'October';
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
