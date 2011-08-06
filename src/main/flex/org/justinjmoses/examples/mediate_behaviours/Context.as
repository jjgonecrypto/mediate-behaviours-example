package org.justinjmoses.examples.mediate_behaviours
{
	import flash.display.DisplayObjectContainer;
	
	import org.justinjmoses.examples.mediate_behaviours.services.AsyncService;
	import org.justinjmoses.examples.mediate_behaviours.services.IAsyncService;
	import org.robotlegs.core.IMediatorMap;
	import org.robotlegs.mvcs.Context;
	import org.robotlegs.utilities.variance.base.IVariantMediatorMap;
	import org.robotlegs.utilities.variance.base.RLVariantMediatorMap;
	
	public class Context extends org.robotlegs.mvcs.Context
	{
		public function Context(contextView:DisplayObjectContainer = null, autoStartup:Boolean = true)
		{
			super(contextView, autoStartup);
		}
		
		override protected function get mediatorMap():IMediatorMap
		{
			return _mediatorMap ||= new RLVariantMediatorMap(contextView, createChildInjector(), reflector);
		}
		
		public function get variantMap():IVariantMediatorMap
		{
			return mediatorMap as IVariantMediatorMap;
		}
		
		override public function startup():void
		{
			injector.mapSingletonOf(IAsyncService, AsyncService);
			
			variantMap.mapMediator(IServiceAware, ServiceAwareMediator);
		}

	}
}