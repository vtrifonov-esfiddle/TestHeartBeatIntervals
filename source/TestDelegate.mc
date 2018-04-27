using Toybox.WatchUi;

class TestDelegate extends WatchUi.BehaviorDelegate {
    function initialize() {
        BehaviorDelegate.initialize();        
    	var heartRateActivity = new HeartBeatIntervalsTracking();
    }
}
