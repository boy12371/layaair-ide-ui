package laya.editorUI {
	import laya.display.Sprite;
	import laya.events.Event;
	import laya.maths.Rectangle;
	import laya.ui.IComponent;
	import laya.ui.Component;
	
	/**
	 * 对象的大小经过重新调整时进行调度。
	 * @eventType Event.RESIZE
	 */	
	[Event(name = "resize",type="laya.events.Event")]
	
	/**
	 * <code>Component</code> 是ui控件类的基类。
	 * 
	 * 
	 * <p>生命周期：preinitialize > createChildren > initialize > 组件构造函数</p>
	 */	
	public class Component extends laya.ui.Component implements IComponent{
		///**
		 //* @private
		 //* 对象的布局样式 
		 //*/		
		//protected var _layout:LayoutStyle = LayoutStyle.EMPTY;
		///**
		 //* @private 
		 //* 控件的元数据。
		 //*/		
		//protected var _dataSource:*;
		///**
		 //* @private
		 //* 鼠标悬停提示
		 //*/		
		//protected var _toolTip:*;
		///**
		 //* @private
		 //* 标签
		 //*/		
		//protected var _tag:*;
		///**
		 //* @private
		 //* 禁用
		 //*/	
		//protected var _disabled:Boolean;
		//
		///**
		 //* <p>创建一个新的 <code>Component</code> 实例。</p>
		 //*/
		//public function Component() {
			//preinitialize();
			//createChildren();
			//initialize();
		//}
		//
		private var _mMBounds:Rectangle;
		override public function _getBoundPointsM(ifRotate:Boolean = false):Array 
		{
			if (this._width > 0 && this._height > 0)
			{
				if (!_mMBounds)
				{
					_mMBounds = new Rectangle();
				}
				_mMBounds.setTo(0, 0, width, height);
				return _mMBounds._getBoundPoints();
			}
			return super._getBoundPointsM(ifRotate);
		}
		
		public var disableLayout:Boolean=false;
		override protected function resetLayoutX():void 
		{
			if (disableLayout) return;
			super.resetLayoutX();
		}
		override protected function resetLayoutY():void 
		{
			if (disableLayout) return;
			super.resetLayoutY();
		}
		
		override public function set width(value:Number):void {
			if (_width != value) {
				_width = value;
				model && model.size(_width, _height);
				//callLater(changeSize);
				if (_layout.enable && (!isNaN(_layout.centerX) || !isNaN(_layout.right) || !isNaN(_layout.anchorX))) resetLayoutX();
				changeSize();
			}
		}
		
		override public function set height(value:Number):void {
			if (_height != value) {
				_height = value;
				model && model.size(_width, _height);
				//callLater(changeSize);
				if (_layout.enable && (!isNaN(_layout.centerY) || !isNaN(_layout.bottom) || !isNaN(_layout.anchorY))) resetLayoutY();
				changeSize();
			}
		}
		
		/**@inheritDoc */
		override public function set scaleX(value:Number):void {
			if (super.scaleX != value) {
				super.scaleX = value;
				//callLater(changeSize);
				_layout.enable && resetLayoutX();
				changeSize();
			}
		}
		override protected function changeSize():void 
		{
			super.changeSize();
			resetLayoutX();
			resetLayoutY();
		}
		/**@inheritDoc */
		override public function set scaleY(value:Number):void {
			if (super.scaleY != value) {
				super.scaleY = value;
				//callLater(changeSize);
				_layout.enable && resetLayoutY();
				changeSize();
			}
		}
		///**@inheritDoc */
		//override public function destroy(destroyChild:Boolean = true):void {
			//super.destroy(destroyChild);
			//_dataSource = _layout = null;
			//_tag = null;
			//_toolTip = null;
		//}
		//
		///**
		 //* <p>预初始化。</p>
		 //* @internal 子类可在此函数内设置、修改属性默认值
		 //*/		
		//protected function preinitialize():void {
		//}
		//
		///**
		 //* <p>创建并添加控件子节点。</p>
		 //* @internal 子类可在此函数内创建并添加子节点。
		 //*/		
		//protected function createChildren():void {
		//}
		//
		///**
		 //* <p>控件初始化。</p>
		 //* @internal 在此子对象已被创建，可以对子对象进行修改。
		 //*/		
		//protected function initialize():void {
		//}
		//
		///**
		 //* <p>延迟运行指定的函数。</p>
		 //* <p>在控件被显示在屏幕之前调用，一般用于延迟计算数据。</p>
		 //* @param method 要执行的函数的名称。例如，functionName。
		 //* @param args 传递给 <code>method</code> 函数的可选参数列表。
		 //* 
		 //* @see #runCallLater()
		 //*/		
		//public function callLater(method:Function, args:Array = null):void {
			//Laya.timer.callLater(this, method, args);
		//}
		//
		///**
		 //* <p>如果有需要延迟调用的函数（通过 <code>callLater</code> 函数设置），则立即执行延迟调用函数。</p>
		 //* @param method 要执行的函数名称。例如，functionName。
		 //* @see #callLater()
		 //*/		
		//public function runCallLater(method:Function):void {
			//Laya.timer.runCallLater(this, method);
		//}
		//
		///**
		 //* <p>表示显示对象的宽度，以像素为单位。</p>
		 //* <p><b>注：</b>当值为0时，宽度为自适应大小。</p>
		 //*/		
		//override public function get width():Number {
			//if (_width) return _width;
			//return measureWidth;
		//}
		//
		//override public function set width(value:Number):void {
			//if (_width != value) {
				//_width = value;
				//callLater(changeSize);
				//if (_layout.enable && (!isNaN(_layout.centerX) || !isNaN(_layout.right))) resetLayoutX();
			//}
		//}
		//
		///**
		 //* <p>对象的显示宽度（以像素为单位）。</p>
		 //* @return 
		 //* @internal #TM
		 //*/		
		//public function get displayWidth():Number {
			//return width * scaleX;
		//}
		//
		///**
		 //* <p>显示对象的实际显示区域宽度（以像素为单位）。</p> 
		 //* @return 
		 //*/		
		//protected function get measureWidth():Number {
			//return getSelfBounds().width;
			//var max:Number = 0;
			//commitMeasure();
			//for (var i:int = numChildren - 1; i > -1; i--) {
				//var comp:Sprite = getChildAt(i) as Sprite;
				//if (comp.visible) {
					//max = Math.max(comp.x + comp.width * comp.scaleX, max);
				//}
			//}
			//
			//return max;
		//}
		//
		///**
		 //* <p>立即执行影响宽高度量的延迟调用函数。</p> 
		 //* @internal <p>使用 <code>runCallLater</code> 函数，立即执行影响宽高度量的延迟运行函数(使用 <code>callLater</code> 设置延迟执行函数)。</p>
		 //* @see #callLater()
		 //* @see #runCallLater()
		 //*/
		//protected function commitMeasure():void {
		//}
		//
		///**
		 //* <p>表示显示对象的高度，以像素为单位。</p>
		 //* <p><b>注：</b>当值为0时，高度为自适应大小。</p>
		 //* @return 
		 //*/		
		//override public function get height():Number {
			//if (_height) return _height;
			//return measureHeight;
		//}
		//
		//override public function set height(value:Number):void {
			//if (_height != value) {
				//_height = value;
				//callLater(changeSize);
				//if (_layout.enable && (!isNaN(_layout.centerY) || !isNaN(_layout.bottom))) resetLayoutY();
			//}
		//}
		//
		///**
		 //* <p>对象的显示高度（以像素为单位）。</p>
		 //* @return 
		 //* @internal #TM 
		 //*/		
		//public function get displayHeight():Number {
			//return height * scaleY;
		//}
		//
		///**
		 //* <p>显示对象的实际显示区域高度（以像素为单位）。</p>
		 //* @return 
		 //*/		
		//protected function get measureHeight():Number {
			//return getSelfBounds().height;
			//var max:Number = 0;
			//commitMeasure();
			//for (var i:int = numChildren - 1; i > -1; i--) {
				//var comp:Sprite = getChildAt(i) as Sprite;
				//if (comp.visible) {
					//max = Math.max(comp.y + comp.height * comp.scaleY, max);
				//}
			//}
			//return max;
		//}
	//
		///**@inheritDoc */
		//override public function set scaleX(value:Number):void {			
			//if (super.scaleX != value) {
				//super.scaleX = value;
				//callLater(changeSize);
				//_layout.enable && resetLayoutX();
			//}			
		//}
		//
		///**@inheritDoc */			
		//override public function set scaleY(value:Number):void {
			//if (super.scaleY != value) {
				//super.scaleY = value;
				//callLater(changeSize);
				//_layout.enable && resetLayoutY();
			//}	
		//}
		//
		///**
		 //* <p>重新调整对象的大小。</p> 
		 //*/		
		//protected function changeSize():void {
			//event(Event.RESIZE);
		//}
		//
		//
		///**
		 //* <p>数据赋值，通过对UI赋值来控制UI显示逻辑。</p> 
		 //* <p>简单赋值会更改组件的默认属性，使用大括号可以指定组件的任意属性进行赋值。</p>
		 //* @example 以下示例中， <code>label1、checkbox1</code> 分别为示例的name属性值。
		 //<listing version="3.0">
		 //默认属性赋值
		 //dataSource = {label1: "改变了label", checkbox1: true};//(更改了label1的text属性值，更改checkbox1的selected属性)。
		 //任意属性赋值
		 //dataSource = {label2: {text:"改变了label",size:14}, checkbox2: {selected:true,x:10}};
		 //</listing>
		 //* @return 
		 //*/		
		//public function get dataSource():* {
			//return _dataSource;
		//}
		//
		//public function set dataSource(value:*):void {
			//_dataSource = value;
			//for (var prop:String in _dataSource) {
				//if (hasOwnProperty(prop)) {
					//this[prop] = _dataSource[prop];
				//}
			//}
		//}
		//
		///**
		 //* @private
		 //* <p>获取对象的布局样式。</p>
		 //* @return 
		 //*/		
		//private function getLayout():LayoutStyle {
			//this._layout === LayoutStyle.EMPTY && (this._layout = new LayoutStyle());
			//return this._layout;
		//}
		//
		///**
		 //* <p>从组件顶边到其内容区域顶边之间的垂直距离（以像素为单位）。</p>
		 //* @return 
		 //*/		
		//public function get top():Number {
			//return this._layout.top;
		//}
		//
		//public function set top(value:Number):void {
			//getLayout().top = value;
			//layOutEabled = true;
			//resetLayoutY();
		//}
		//
		///**
		 //* <p>从组件底边到其内容区域底边之间的垂直距离（以像素为单位）。</p>
		 //* @return 
		 //*/		
		//public function get bottom():Number {
			//return this._layout.bottom;
		//}
		//
		//public function set bottom(value:Number):void {
			//getLayout().bottom = value;
			//layOutEabled = true;
			//resetLayoutY();
		//}
		//
		///**
		 //* <p>从组件左边到其内容区域左边之间的水平距离（以像素为单位）。</p> 
		 //* @return 
		 //*/		
		//public function get left():Number {
			//return this._layout.left;
		//}
		//
		//public function set left(value:Number):void {
			//getLayout().left = value;
			//layOutEabled = true;
			//resetLayoutX();
		//}
		//
		///**
		 //* <p>从组件右边到其内容区域右边之间的水平距离（以像素为单位）。</p> 
		 //* @return 
		 //*/		
		//public function get right():Number {
			//return this._layout.right;
		//}
		//
		//public function set right(value:Number):void {
			//getLayout().right = value;
			//layOutEabled = true;
			//resetLayoutX();
		//}
		//
		///**
		 //* <p>在父容器中，此对象的水平方向中轴线与父容器的水平方向中心线的距离（以像素为单位）。</p>
		 //* @return 
		 //*/		
		//public function get centerX():Number {
			//return this._layout.centerX;
		//}
		//
		//public function set centerX(value:Number):void {
			//getLayout().centerX = value;
			//layOutEabled = true;
			//resetLayoutX();
		//}
		//
		///**
		 //* <p>在父容器中，此对象的垂直方向中轴线与父容器的垂直方向中心线的距离（以像素为单位）。</p>
		 //* @return 
		 //*/		
		//public function get centerY():Number {
			//return this._layout.centerY;
		//}
		//
		//public function set centerY(value:Number):void {
			//getLayout().centerY = value;
			//layOutEabled = true;
			//resetLayoutY();
		//}
		//
		///**
		 //* <p>对象的标签。</p> 
		 //* @return 
		 //* @internal 冗余字段，可以用来储存数据。
		 //*/		
		//public function get tag():* {
			//return _tag;
		//}
		//
		//public function set tag(value:*):void {
			//_tag = value;
		//}
		///**
		 //* <p>指定对象是否可使用布局。</p>
		 //* <p>如果值为true,则此对象可以使用布局样式，否则不使用布局样式。</p>
		 //* @param value 
		 //*/		
		//private function set layOutEabled(value:Boolean):void {
			//if (_layout.enable != value) {
				//_layout.enable = value;
				//if (!hasListener(Event.ADDED)) {
					//on(Event.ADDED, this, onAdded);
					//on(Event.REMOVED, this, onRemoved);
				//}
			//}
		//}
		///**
		 //* 对象从显示列表移除的事件侦听处理函数。
		 //*/		
		//private function onRemoved():void {
			//this.parent.off(Event.RESIZE, this, onCompResize);
		//}
		///**
		 //* 对象被添加到显示列表的事件侦听处理函数。
		 //*/		
		//private function onAdded():void {
			//this.parent.on(Event.RESIZE, this, onCompResize);
			//resetLayoutX();
			//resetLayoutY();
		//}
		///**
		 //* 父容器的 <code>Event.RESIZE</code> 事件侦听处理函数。
		 //*/		
		//private function onCompResize():void {
			//resetLayoutX();
			//resetLayoutY();
		//}
		///**
		 //* <p>重置对象的 <code>X</code> 轴（水平方向）布局。</p>
		 //*/		
		//private function resetLayoutX():void {
			//var parent:Sprite = this.parent as Sprite;
			//if (parent) {
				//var layout:LayoutStyle = _layout;
				//if (!isNaN(layout.centerX)) {
					//x = (parent.width - displayWidth) * 0.5 + layout.centerX;
				//} else if (!isNaN(layout.left)) {
					//x = layout.left;
					//if (!isNaN(layout.right)) {
						//TODO:
						//width = (parent._width - layout.left - layout.right) / scaleX;
					//}
				//} else if (!isNaN(layout.right)) {
					//x = parent.width - displayWidth - layout.right;
				//}
			//}
		//}
		///**
		 //* <p>重置对象的 <code>Y</code> 轴（垂直方向）布局。</p> 
		 //*/		
		//private function resetLayoutY():void {
			//var parent:Sprite = this.parent as Sprite;
			//if (parent) {
				//var layout:LayoutStyle = _layout;
				//if (!isNaN(layout.centerY)) {
					//y = (parent.height - displayHeight) * 0.5 + layout.centerY;
				//} else if (!isNaN(layout.top)) {
					//y = layout.top;
					//if (!isNaN(layout.bottom)) {
						//TODO:
						//height = (parent._height - layout.top - layout.bottom) / scaleY;
					//}
				//} else if (!isNaN(layout.bottom)) {
					//y = parent.height - displayHeight - layout.bottom;
				//}
			//}
		//}
		//
		//
		//
		///**
		 //* <p>鼠标悬停提示。</p> 
		 //* <p>可以赋值为文本 <code>String</code> 或函数 <code>Function</code> ，用来实现自定义样式的鼠标提示和参数携带等。</p>
		 //* @example 以下例子展示了三种鼠标提示：
		  //<listing version="3.0">
			//private var _testTips:TestTipsUI = new TestTipsUI();
			//private function testTips():void {
				//简单鼠标提示
				//btn2.toolTip = "这里是鼠标提示&lt;b&gt;粗体&lt;/b&gt;&lt;br&gt;换行";
				//自定义的鼠标提示
				//btn1.toolTip = showTips1;
				//带参数的自定义鼠标提示
				//clip.toolTip = new Handler(this,showTips2, ["clip"]);
			//}
			//private function showTips1():void {
				//_testTips.label.text = "这里是按钮[" + btn1.label + "]";
				//App.tip.addChild(_testTips);
			//}
			//private function showTips2(name:String):void {
				//_testTips.label.text = "这里是" + name;
				//App.tip.addChild(_testTips);
			//}		 
			//</listing>
		 //* @return 	
		 //*/		
		//public function get toolTip():* {
			//return _toolTip;
		//}
		///**
		 //* 
		 //* @param value
		 //*/		
		//public function set toolTip(value:*):void {
			//if (_toolTip != value) {
				//_toolTip = value;
				//if (value != null) {
					//on(Event.MOUSE_OVER, this, onMouseOver);
					//on(Event.MOUSE_OUT, this, onMouseOut);
				//} else {
					//off(Event.MOUSE_OVER, this, onMouseOver);
					//off(Event.MOUSE_OUT, this, onMouseOut);
				//}
			//}
		//}
		///**
		 //* 对象的 <code>Event.MOUSE_OVER</code> 事件侦听处理函数。
		 //*/	
		//private function onMouseOver(e:Event):void {
			//Laya.stage.event(UIEvent.SHOW_TIP, _toolTip);
		//}
		///**
		 //* 对象的 <code>Event.MOUSE_OUT</code> 事件侦听处理函数。
		 //*/	
		//private function onMouseOut(e:Event):void {
			//Laya.stage.event(UIEvent.HIDE_TIP, _toolTip);
		//}
		//public function get comXml():Object{
			//return _comXml;
		//}
		//private var _comXml:Object;
		//public function set comXml(value:Object):void{
			//_comXml =value;
		//}
		//
		//override public function set x(value:Number):void {
			//super.x = Math.round(value);
		//}
		//
		//override public function set y(value:Number):void {
			//super.y = Math.round(value);
		//}
		//
		///**是否禁用页面(变灰)*/
		//public function get disabled():Boolean {
			//return _disabled;
		//}
		//
		//public function set disabled(value:Boolean):void {
			//if (value !== _disabled) {
				//_disabled = value;
				//UIUtils.gray(this, value);
			//}
		//}
	}
}