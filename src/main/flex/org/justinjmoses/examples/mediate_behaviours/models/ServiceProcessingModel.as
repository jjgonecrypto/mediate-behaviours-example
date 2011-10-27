package org.justinjmoses.examples.mediate_behaviours.models
{
	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;

	public class ServiceProcessingModel
	{
		protected var _started:ISignal;
		
		public function get started():ISignal
		{
			return _started ||= new Signal();
		}
		
		protected var _completed:ISignal;
		
		public function get completed():ISignal
		{
			return _completed ||= new Signal();
		}
		
		public function set underway(value:Boolean):void
		{
			if (value) started.dispatch();
			else completed.dispatch();
		}
	}
}