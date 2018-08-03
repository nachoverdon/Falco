package falco.utils;

class Pool<T> {
    var array: Array<PoolItem>;

    public function new() {
        array = new Array<PoolItem>();
    }

    public function add(item: T): Void {
        array.push({item: item, available: true});
    }

    public function remove(item: T): Bool {
        for (it in array) {
            if (it.item == item) return array.remove(it);
        }

        return false;
    }

    public function getFirstAvailable(): T {
        for (item in array) {
            if (item.available) {
                item.available = false;
                return item.item;
            }
        }

        return null;
    }

    public function free(item: T): Void {
        for (it in array) {
            if (it.item == item) it.available = true;
        }
    }

}

typedef PoolItem = {
    var item: Dynamic;
    var available: Bool;
}