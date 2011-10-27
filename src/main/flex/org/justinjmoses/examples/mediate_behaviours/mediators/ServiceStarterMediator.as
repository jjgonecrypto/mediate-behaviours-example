package org.justinjmoses.examples.mediate_behaviours.mediators
{
	import org.justinjmoses.examples.mediate_behaviours.services.IAsyncService;
	import org.osflash.signals.ISignal;
	import org.robotlegs.mvcs.Mediator;
	import org.justinjmoses.examples.mediate_behaviours.behaviours.IServiceStarter;

	public class ServiceStarterMediator extends Mediator
	{
		[Inject]
		public var view:IServiceStarter;
		
		[Inject]
		public var service:IAsyncService;
		
		override public function onRegister():void
		{
			//handle control events responding
			view.start.
				add(function():void 
				{
					service.doSomething().addOnce(function():void
					{
						//when the service returns, notify the view
						view.serviceReturned();
					});
				});
		}
		
		override public function onRemove():void
		{
			view.start.removeAll(); //clean up any listeners
		}
	}
}