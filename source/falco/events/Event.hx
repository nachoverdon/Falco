package falco.events;

/**
 * Defines events names
 * @see starling.events.Event
**/
class Event {
	/**
	 * Event type that is dispatched by Scene when the root Starling Sprite is
	 * added.
	**/
	public static inline var ROOT_ADDED:String = 'ROOT_ADDED';

	/**
	 * Event type that is dispatched by the Scene when the current Scene gets
	 * removed.
	**/
	public static inline var SCENE_REMOVED:String = 'SCENE_REMOVED';

	/**
	 * Event type that is dispatched by the Scene when a new Scene gets added.
	**/
	public static inline var SCENE_ADDED:String = 'SCENE_ADDED';
}
