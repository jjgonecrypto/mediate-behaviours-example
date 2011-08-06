package org.justinjmoses.examples.mediate_behaviours
{
	import org.justinjmoses.examples.mediate_behaviours.services.IAsyncService;
	import org.osflash.signals.ISignal;
	import org.robotlegs.mvcs.Mediator;

	public class ServiceAwareMediator extends Mediator
	{
		[Inject]
		public var view:IServiceAware;
		
		[Inject]
		public var service:IAsyncService;
		
		private var serviceSignal:ISignal;
		
		override public function onRegister():void
		{
			//handle control events responding
			view.start.add(function():void 
			{
				serviceSignal = service.doSomething();
				
				serviceSignal.add(function():void
					{
						//when the service returns, notify the view
						view.serviceReturned();
					});
			});
		}
		
		override public function onRemove():void
		{
			serviceSignal.removeAll();
			view.start.removeAll(); //clean up any listeners
		}
	}
}