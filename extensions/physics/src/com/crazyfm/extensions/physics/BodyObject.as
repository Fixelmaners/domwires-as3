/**
 * Created by Anton Nefjodov on 11.03.2016.
 */
package com.crazyfm.extensions.physics
{
	import com.crazyfm.core.common.Disposable;
	import com.crazyfm.extensions.physics.vo.BodyDataVo;
	import com.crazyfm.extensions.physics.vo.ShapeDataVo;

	import nape.phys.Body;
	import nape.phys.BodyType;
	import nape.phys.Material;

	use namespace ns_ext_physics;

	public class BodyObject extends Disposable implements IBodyObject
	{
		private var _body:Body;

		private var _data:BodyDataVo;

		private var _shapeObjectList:Vector.<IShapeObject>;

		public function BodyObject()
		{
		}

		public function get shapeObjectList():Vector.<IShapeObject>
		{
			return _shapeObjectList;
		}

		public function shapeObjectById(id:String):IShapeObject
		{
			for each (var shapeObject:IShapeObject in _shapeObjectList)
			{
				if (shapeObject.data.id == id)
				{
					return shapeObject;
				}
			}

			return null;
		}

		ns_ext_physics function setData(value:BodyDataVo):IBodyObject
		{
			_data = value;

			_shapeObjectList = new <IShapeObject>[];

			for each (var shapeData:ShapeDataVo in _data.shapeDataList)
			{
				var shapeObject:ShapeObject = new ShapeObject();
				shapeObject.setData(shapeData);
				_shapeObjectList.push(shapeObject);
			}

			var bodyType:BodyType;
			switch(_data.type)
			{
				case BodyDataVo.TYPE_STATIC:
					bodyType = BodyType.STATIC;
					break;
				case BodyDataVo.TYPE_KINEMATIC:
					bodyType = BodyType.KINEMATIC;
					break;
				default:
					bodyType = BodyType.DYNAMIC;
					break;
			}

			_body = new Body(bodyType);
			_body.position.setxy(_data.x, _data.y);
			_body.rotation = _data.angle;

			for (var i:int = 0; i < _shapeObjectList.length; i++)
			{
				for (var i2:int = 0; i2 < _shapeObjectList[i].shapes.length; i2++)
				{
					_body.shapes.add(_shapeObjectList[i].shapes[i2]);
				}
			}

			if (_data.material)
			{
				_body.setShapeMaterials(new Material(_data.material.elasticity, _data.material.dynamicFriction,
						_data.material.staticFriction, _data.material.density, _data.material.rollingFriction));
			}

			//_body.align();

			_body.allowRotation = _data.allowRotation;

			return this;
		}

		public function get data():BodyDataVo
		{
			return _data;
		}

		public function get body():Body
		{
			return _body;
		}

		override public function dispose():void
		{
			for each (var shapeObject:IShapeObject in _shapeObjectList)
			{
				shapeObject.dispose();
			}

			_body.shapes.clear();

			_shapeObjectList = null;
			_body = null;
			_data = null;

			super.dispose();
		}

		public function clone():IBodyObject
		{
			var c:BodyObject = new BodyObject();
			c.setData(_data);
			return c;
		}
	}
}
