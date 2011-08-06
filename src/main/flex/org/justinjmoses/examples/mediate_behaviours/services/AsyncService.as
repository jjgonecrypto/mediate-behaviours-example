package org.justinjmoses.examples.mediate_behaviours.services
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;
	
	public class AsyncService implements IAsyncService
	{
		private var handler:Function;
			
		public function doSomething():ISignal
		{
			const signal:ISignal = new Signal();
			const timer:Timer = new Timer(2000, 1);
			
			var handler:Function = function(evt:TimerEvent):void
			{
				signal.dispatch();
				
				//remove listener to prevent memory leaks
				timer.removeEventListener(TimerEvent.TIMER_COMPLETE, handler);
			};
			
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, handler);
			
			//start timer which will trigger the signal when complete.
			timer.start();
			
			return signal;
		}
		
		
	}
}