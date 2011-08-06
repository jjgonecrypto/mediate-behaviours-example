package org.justinjmoses.examples.mediate_behaviours.services
{
	import org.osflash.signals.ISignal;

	public interface IAsyncService
	{
		function doSomething():ISignal;
	}
}