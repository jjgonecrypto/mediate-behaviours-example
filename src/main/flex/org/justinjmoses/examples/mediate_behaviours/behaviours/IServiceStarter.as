package org.justinjmoses.examples.mediate_behaviours.behaviours
{
	import org.osflash.signals.ISignal;

	public interface IServiceStarter
	{
		function serviceReturned():void;
		function get start():ISignal;	
	}
}