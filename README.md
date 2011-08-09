#UI mediation sucks. Mediate behaviours, not views.

This example is an overview of using the Robotlegs Variance Utility to provide mediation against interfaces (behaviours), rather than concrete classes.

(Check out the blog post)[http://justinjmoses.wordpress.com/2011/08/07/ui-mediation-sucks-mediate-behaviours-not-views/].


##Third party dependencies
* [Robotlegs v1.4.0](https://github.com/robotlegs/robotlegs-framework/)
* [Robotlegs Variance Utility v1.0](https://github.com/dnalot/robotlegs-utilities-variance)
* [As3-Signals v0.8](https://github.com/robertpenner/as3-signals)

##Usage instructions
In Flashbuilder or IntelliJ, create a new project from the cloned source, and add the 3 SWC dependencies.

##Build instructions
To build on your machine via Maven. Follow these steps:

1. Ensure Maven 3.0.3 + is installed

2. Install local dependencies (add them to your local repository)
	
		cd libs

		mvn install:install-file 
			-Dfile=robotlegs-framework-1.4.0.swc 
			-DgroupId=org.robotlegs 
			-DartifactId=robotlegs-framework 
			-Dversion=1.4.0
			-Dpackaging=swc
		
		mvn install:install-file 
			-Dfile=robotlegs-utilities-variance-1.0.swc 
			-DgroupId=org.robotlegs 
			-DartifactId=robotlegs-utilities-variance 
			-Dversion=1.0 
			-Dpackaging=swc
		
		mvn install:install-file 
			-Dfile=as3-signals-0.8.swc 
			-DgroupId=org.osflash
			-DartifactId=as3-signals 
			-Dversion=0.8 
			-Dpackaging=swc

3. Build

		mvn clean install
	

	

	