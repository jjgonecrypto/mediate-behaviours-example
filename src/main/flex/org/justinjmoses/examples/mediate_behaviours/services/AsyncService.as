package org.justinjmoses.examples.mediate_behaviours.services
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.messaging.AbstractConsumer;
	
	import org.justinjmoses.examples.mediate_behaviours.models.ServiceProcessingModel;
	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;
	import org.osflash.signals.natives.NativeSignal;
	
	public class AsyncService implements IAsyncService
	{
		[Inject]
		public var model:ServiceProcessingModel;
		
		public function doSomething():ISignal
		{
			const signal:ISignal = new Signal();
	
			const timer:Timer = new Timer(2000, 1);
			
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, function(evt:TimerEvent):void
			{
				signal.dispatch();
				
				model.underway = false;
				
				//remove listener to prevent memory leaks
				timer.removeEventListener(TimerEvent.TIMER_COMPLETE, arguments.callee);
			});
			
			//start timer which will trigger the signal when complete.
			timer.start();
			
			model.underway = true;
			
			return signal;
		}
		
		
	}
}