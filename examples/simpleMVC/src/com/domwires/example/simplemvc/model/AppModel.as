/**
 * Created by CrazyFlasher on 1.12.2016.
 */
package com.domwires.example.simplemvc.model
{
	import com.domwires.core.mvc.model.AbstractModel;

	public class AppModel extends AbstractModel implements IAppModel
	{
		private var _firstName:String;
		private var _lastName:String;
		private var _birthPlace:String;
		private var _age:int;

		public function setFirstName(value:String):IAppModel
		{
			_firstName = value;

			dispatchMessage(AppModelMessage.FIRST_NAME_CHANGED, null, true);

			return this;
		}
		
		public function setBirthPlace(value:String):IAppModel
		{
			_birthPlace = value;

			dispatchMessage(AppModelMessage.BIRTH_PLACE_CHANGED, null, true);

			return this;
		}

		public function setLastName(value:String):IAppModel
		{
			_lastName = value;

			dispatchMessage(AppModelMessage.LAST_NAME_CHANGED, null, true);

			return this;
		}

		public function setAge(value:int):IAppModel
		{
			_age = value;

			dispatchMessage(AppModelMessage.AGE_CHANGED, null, true);

			return this;
		}

		public function get firstName():String
		{
			return _firstName;
		}
		
		public function get birthPlace():String
		{
			return _birthPlace;
		}

		public function get lastName():String
		{
			return _lastName;
		}

		public function get age():int
		{
			return _age;
		}
	}
}
