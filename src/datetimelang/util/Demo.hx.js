package datetimelang.util;
import datetimelang.util.Lang;
import datetimelang.util.ShiftDateTime;
import htmlHelper.tools.DivertTrace;
import datetime.DateTime;
function main(){
    var divertTrace = new DivertTrace(); 
    new Demo();
}
class Demo{
    public function new(){
        var now : ShiftDateTime = DateTime.now(); 
        var all = Lang.all();
        var lang: Lang;
        for( country in all ){
    
            lang = new Lang( country );
            var s: String = cast lang;
            s = 'language ' + s;
            trace( s );
            var month = lang.getMonthName( now );
            trace( 'current month ' + month );
            trace( 'today is a ' + lang.getWeekDayName( now ) );
            for( i in 1...7 ){
                trace( '... ' + lang.getWeekDayName( now.getAnotherDay( i ) ) );
            }
            trace(' ');
            
        }
    }
}