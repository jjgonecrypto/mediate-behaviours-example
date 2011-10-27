package org.justinjmoses.examples.mediate_behaviours.mediators
{
	import org.justinjmoses.examples.mediate_behaviours.behaviours.IServiceAware;
	import org.justinjmoses.examples.mediate_behaviours.models.ServiceProcessingModel;
	import org.justinjmoses.examples.mediate_behaviours.services.IAsyncService;
	import org.robotlegs.mvcs.Mediator;
	
	public class ServiceAwareMediator extends Mediator
	{
		[Inject]
		public var view:IServiceAware;
		
		[Inject]
		public var model:ServiceProcessingModel;
		
		private var startedHandler:Function;
		private var completedHandler:Function;
		
		override public function onRegister():void
		{
			model.started.add(startedHandler = 
				function():void { view.actionUnderway = true; });
			model.completed.add(completedHandler = 
				function():void { view.actionUnderway = false; });
		}
		
		override public function onRemove():void
		{
			model.started.remove(startedHandler);
			model.started.remove(completedHandler);
		}
	}
}