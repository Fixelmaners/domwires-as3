/**
 * Created by Anton Nefjodov on 11.03.2016.
 */
package com.crazyfm.extensions.physics.vo
{
	public class BodyDataVo
	{
		public static const TYPE_STATIC:String = "static";
		public static const TYPE_DYNAMIC:String = "dynamic";
		public static const TYPE_KINEMATIC:String = "kinematic";

		private var _id:String;
		private var _type:String = "dynamic";
		private var _x:Number = 0;
		private var _y:Number = 0;
		private var _angle:Number = 0;

		private var _shapeDataList:Vector.<ShapeDataVo>;

		public function BodyDataVo()
		{
		}

		public function set shapeDataList(value:Vector.<ShapeDataVo>):void
		{
			_shapeDataList = value;
		}

		public function get shapeDataList():Vector.<ShapeDataVo>
		{
			return _shapeDataList;
		}

		public function get id():String
		{
			return _id;
		}

		public function set id(value:String):void
		{
			_id = value;
		}

		public function get type():String
		{
			return _type;
		}

		public function set type(value:String):void
		{
			_type = value;
		}

		public function get x():Number
		{
			return _x;
		}

		public function set x(value:Number):void
		{
			_x = value;
		}

		public function get y():Number
		{
			return _y;
		}

		public function set y(value:Number):void
		{
			_y = value;
		}

		public function get angle():Number
		{
			return _angle;
		}

		public function set angle(value:Number):void
		{
			_angle = value;
		}
	}
}