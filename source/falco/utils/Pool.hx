package falco.utils;

/**
 * Generic item pool to easily manage several items of the same type.
**/
class Pool<T> {
	var array: Array<PoolItem<T>>;

	public function new() {
		array = [];
	}

	/**
	 * Adds an item to the pool, immediatelly available.
	 * @param item
	**/
	public function add(item: T) {
		array.push({
			item: item,
			available: true
		});
	}

	/**
	 * Removes an item from the pool.
	 * @param item
	 * @return Bool
	**/
	public function remove(item: T): Bool {
		for (it in array) {
			if (it.item == item) {
				return array.remove(it);
			}
		}

		return false;
	}

	/**
	 * Gets the first available item from the pool or null in case nothing is
	 * found.
	 * @return T
	**/
	public function getFirstAvailable(): Null<T> {
		for (item in array) {
			if (item.available) {
				item.available = false;
				return item.item;
			}
		}

		return null;
	}

	/**
	 * Makes the item available.
	 * @param item
	**/
	public function free(item: T) {
		for (it in array) {
			if (it.item == item) {
				it.available = true;
			}
		}
	}

	/**
	 * Returns the amount of items in the pool, available or unavailable.
	 * @return  Int
	**/
	public function length(): Int {
		return array.length;
	}
}

/**
 * Generic item that holds the value and a flag that tells if it's available.
**/
typedef PoolItem<T> = {
	/**
	 * The item itself.
	**/
	var item: T;

	/**
	 * A flag that tells if the item is available for consumption.
	**/
	var available: Bool;
}
