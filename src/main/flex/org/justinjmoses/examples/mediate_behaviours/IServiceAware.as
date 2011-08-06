package org.justinjmoses.examples.mediate_behaviours
{
	import org.osflash.signals.ISignal;

	public interface IServiceAware
	{
		function serviceReturned():void;
		function get start():ISignal;	
	}
}