using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.Timer;

class TestView extends Ui.View {

    function initialize() {
        View.initialize();        
        me.mHeartRateActivity = new HeartBeatIntervalsTracking();
        var timer = new Timer.Timer();
        timer.start(method(:onShouldUpdate), 1000, true);
    }
    
    function onShouldUpdate() {
    	Ui.requestUpdate();    	
    }
    
    var mHeartRateActivity;

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.MainLayout(dc));
        me.mOutputLabel =  new Ui.Text({
        	:text => "--",
        	:font => Gfx.FONT_MEDIUM,
        	:color => Gfx.COLOR_WHITE,
        	:justification => Gfx.TEXT_JUSTIFY_CENTER,
        	:locX => dc.getWidth() / 2,
        	:locY => dc.getHeight() / 2
    	});
    }
    
    private var mOutputLabel;

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {
        // Call the parent onUpdate function to redraw the layout   
        View.onUpdate(dc);
        if (me.mHeartRateActivity.heartBeatInterval != null) {
        	mOutputLabel.setText(me.mHeartRateActivity.heartBeatInterval.toString());
        }
        else {
        	mOutputLabel.setText("--");
        }
    	mOutputLabel.draw(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

}
