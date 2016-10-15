package laya.editorUI {
	import laya.ui.IBox;
	
	
	/**
	 * <code>Box</code> 类是一个控件容器类。
	 * @author yung
	 */
	public class Box extends Component implements IBox {
		
		/**@inheritDoc */
		override public function set dataSource(value:*):void {
			_dataSource = value;
			for (var name:String in value) {
				var comp:Component = getChildByName(name) as Component;
				if (comp) comp.dataSource = value[name];
				else if (hasOwnProperty(name)) this[name] = value[name];
			}
		}
		
	}
}