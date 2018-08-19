using Toybox.Sensor;
using Toybox.ActivityRecording;
using Toybox.WatchUi as Ui;

class HeartBeatIntervalsTracking {	
	function initialize() {
		var options = {
		    :period => 1,               // 1 second sample time
		    :heartBeatIntervals => {
		        :enabled => true
		    }
		};	
		me.heartBeatInterval = null;
		// Using the callback setup in Toybox.SensorHistory.SensorData
		Sensor.registerSensorDataListener(method(:onHeartBeatIntervals), options);	
	}
			
	function onHeartBeatIntervals(sensorData) {
		var heartBeatIntervals = sensorData.heartRateData.heartBeatIntervals;		
		if (heartBeatIntervals.size() > 0) {			
			me.heartBeatInterval = heartBeatIntervals[0];
		}
	}
	
	var heartBeatInterval;
}