using Toybox.Sensor;
using Toybox.ActivityRecording;

class HeartBeatIntervalsTracking {
	private const SUB_SPORT_YOGA = 43;
	
	function initialize() {
		var session = ActivityRecording.createSession(
		    {
		        :name=>"HeartRateActivity",
		        :sport=>ActivityRecording.SPORT_TRAINING,
		        :subsport => SUB_SPORT_YOGA
		    }
		);
		var options = {
		    :period => 1,               // 1 second sample time
		    :heartBeatIntervals => {
		        :enabled => true
		    }
		};
		// Using the callback setup in Toybox.SensorHistory.SensorData
		Sensor.registerSensorDataListener(method(:onHeartBeatIntervals), options);		
	}
	
	function onHeartBeatIntervals(sensorData) {
		var heartBeatIntervals = sensorData.heartRateData.heartBeatIntervals;
		System.println("BTB: " + heartBeatIntervals);
		if (heartBeatIntervals.size() > 0) {
			System.println("BTB: " + heartBeatIntervals[0] + "; size: " + heartBeatIntervals.size());
		}
	}
}