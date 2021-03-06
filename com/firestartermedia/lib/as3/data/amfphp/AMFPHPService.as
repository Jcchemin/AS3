/**
 * @author			Ahmed Nuaman (http://www.ahmednuaman.com)
 * @langversion		3
 * 
 * This work is licenced under the Creative Commons Attribution-Share Alike 2.0 UK: England & Wales License. 
 * To view a copy of this licence, visit http://creativecommons.org/licenses/by-sa/2.0/uk/ or send a letter 
 * to Creative Commons, 171 Second Street, Suite 300, San Francisco, California 94105, USA.
*/
package com.firestartermedia.lib.as3.data.amfphp
{
	import com.firestartermedia.lib.as3.data.RemoteConnectionService;
	import com.firestartermedia.lib.as3.events.RemoteConnectionServiceEvent;
	
	import flash.net.ObjectEncoding;

	public class AMFPHPService extends RemoteConnectionService
	{
		protected var ciMethod:String;
		protected var ciPath:String;
				
		public function AMFPHPService( url:String, ciMethod:String=null, ciPath:String=null )
		{
			super( url, RemoteConnectionServiceEvent.LOADED, RemoteConnectionServiceEvent.READY, RemoteConnectionServiceEvent.FAULT, ObjectEncoding.AMF3 );
			
			this.ciMethod	= ciMethod;
			this.ciPath		= ciPath;
		}
		
		public function ciSend(...args):void
		{
			if ( ciMethod && ciPath )
			{
				send.apply( null, [ ciMethod, ciPath ].concat( args ) );
			}
			else
			{
				throw new ArgumentError('You need to specify the ciMethod and ciPath');
			}
		}
	}
}