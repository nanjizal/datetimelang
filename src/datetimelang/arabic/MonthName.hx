
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
package datetimelang.arabic;
import datetime.utils.DateTimeUtils;
import datetime.DateTime;
import datetime.DateTimeInterval;
// assumes Arabic - Egypt, Sudan, Yeman for now.
abstract MonthName( DTMonth ) to DTMonth from DTMonth {
    public inline function new( m: DTMonth ){
        this = m;
    }
    @:from
    static inline public function fromString( s: String ): Null<MonthName> {
        return new MonthName( switch( s.toLowerCase() ){
            case 'يناير':
                return January;
            case 'فبراير':
                return February;
            case 'مارس':
                return March;
            case 'أبريل':
                return April;
            case 'مايو':
                return May;
            case 'يونيو':
                return June;
            case 'يوليه':
                return July;
            case 'أغسطس':
                return August;
            case 'سبتمبر':
                return September;
            case 'أكتوبر':
                return October;
            case 'نوفمبر':
                return November;
            case 'ديسمبر':
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
                return 'يناير';
            case February:
                return 'فبراير';
            case March:
                return 'مارس';
            case April:
                return 'أبريل';
            case May:
                return 'مايو';
            case June:
                return 'يونيو';
            case July:
                return 'يوليه';
            case August:
                return 'أغسطس';
            case September:
                return 'سبتمبر';
            case October:
                return 'أكتوبر';
            case November:
                return 'نوفمبر';
            case December:
                return 'ديسمبر';
        }
    }     
    public static inline function stringFromDateTime( dt: DateTime ){
        var m: MonthName = cast( dt.getMonth(), DTMonth );
        var s: String = m;
        return s;
    }
}
