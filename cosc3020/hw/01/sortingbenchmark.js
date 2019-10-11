const microtime = require('microtime')

class Comparator {
  /**
   * @param {function(a: *, b: *)} [compareFunction]
   */
  constructor(compareFunction) {
    this.compare = compareFunction || Comparator.defaultCompareFunction;
  }

  /**
   * @param {(string|number)} a
   * @param {(string|number)} b
   * @returns {number}
   */
  static defaultCompareFunction(a, b) {
    if (a === b) {
      return 0;
    }

    return a < b ? -1 : 1;
  }

  equal(a, b) {
    return this.compare(a, b) === 0;
  }

  lessThan(a, b) {
    return this.compare(a, b) < 0;
  }

  greaterThan(a, b) {
    return this.compare(a, b) > 0;
  }

  lessThanOrEqual(a, b) {
    return this.lessThan(a, b) || this.equal(a, b);
  }

  greaterThanOrEqual(a, b) {
    return this.greaterThan(a, b) || this.equal(a, b);
  }

  reverse() {
    const compareOriginal = this.compare;
    this.compare = (a, b) => compareOriginal(b, a);
  }
}
/**
 * @typedef {Object} SorterCallbacks
 * @property {function(a: *, b: *)} compareCallback - If provided then all elements comparisons
 *  will be done through this callback.
 * @property {function(a: *)} visitingCallback - If provided it will be called each time the sorting
 *  function is visiting the next element.
 */

class Sort {
  constructor(originalCallbacks) {
    this.callbacks = Sort.initSortingCallbacks(originalCallbacks);
    this.comparator = new Comparator(this.callbacks.compareCallback);
  }

  /**
   * @param {SorterCallbacks} originalCallbacks
   * @returns {SorterCallbacks}
   */
  static initSortingCallbacks(originalCallbacks) {
    const callbacks = originalCallbacks || {};
    const stubCallback = () => {};

    callbacks.compareCallback = callbacks.compareCallback || undefined;
    callbacks.visitingCallback = callbacks.visitingCallback || stubCallback;

    return callbacks;
  }

  sort() {
    throw new Error('sort method must be implemented');
  }
}

class QuickSort extends Sort {
  /**
   * @param {*[]} originalArray
   * @return {*[]}
   */
  sort(originalArray) {
    // Clone original array to prevent it from modification.
    const array = [...originalArray];

    // If array has less than or equal to one elements then it is already sorted.
    if (array.length <= 1) {
      return array;
    }

    // Take the first element of array as a pivot.
    var pivotElement = array[0];
    const mid = Math.floor(array.length/2);
    if((array[mid] < array[array.length-1] && array[mid] > array[0]) ||
       (array[mid] > array[array.length-1] && array[mid] < array[0])) {
        pivotElement = array[mid];
    } else if((array[array.length-1] < array[mid] && array[array.length-1] > array[0]) ||
       (array[array.length-1] > array[mid] && array[array.length-1] < array[0])) {
        pivotElement = array[array.length-1];
    }

    // Split all array elements between left, center and right arrays.
    const leftArray = array.filter(function(currentElement) {
      this.callbacks.visitingCallback(currentElement);
      return this.comparator.lessThan(currentElement, pivotElement);
    }, this);
    const centerArray = array.filter(function(currentElement) {
      this.callbacks.visitingCallback(currentElement);
      return this.comparator.equal(currentElement, pivotElement);
    }, this);
    const rightArray = array.filter(function(currentElement) {
      this.callbacks.visitingCallback(currentElement);
      return this.comparator.greaterThan(currentElement, pivotElement);
    }, this);

    // Sort left and right arrays.
    const leftArraySorted = this.sort(leftArray);
    const rightArraySorted = this.sort(rightArray);

    // Let's now join sorted left array with center array and with sorted right array.
    return leftArraySorted.concat(centerArray, rightArraySorted);
  }
}


class InsertionSort extends Sort {
  sort(originalArray) {
    const array = [...originalArray];

    // Go through all array elements...
    for (let i = 0; i < array.length; i += 1) {
      let currentIndex = i;

      // Call visiting callback.
      this.callbacks.visitingCallback(array[i]);

      // Go and check if previous elements and greater then current one.
      // If this is the case then swap that elements.
      while (
        array[currentIndex - 1] !== undefined
        && this.comparator.lessThan(array[currentIndex], array[currentIndex - 1])
      ) {
        // Call visiting callback.
        this.callbacks.visitingCallback(array[currentIndex - 1]);

        // Swap the elements.
        const tmp = array[currentIndex - 1];
        array[currentIndex - 1] = array[currentIndex];
        array[currentIndex] = tmp;

        // Shift current index left.
        currentIndex -= 1;
      }
    }

    return array;
  }
}

class QuickSortInPlace extends Sort {
  /** Sorting in place avoids unnecessary use of additional memory, but modifies input array.
   *
   * This process is difficult to describe, but much clearer with a visualization:
   * @see: http://www.algomation.com/algorithm/quick-sort-visualization
   *
   * @param {*[]} originalArray
   * @param {number} inputLowIndex
   * @param {number} inputHighIndex
   * @return {*[]}
   */
  sort(originalArray, inputLowIndex, inputHighIndex) {
    // Destructures array on initial passthrough, and then sorts in place.
    const array = inputLowIndex === undefined ? [...originalArray] : originalArray;

    /**
     * Partition array segment and return index of last swap
     *
     * @param {number} lowIndex
     * @param {number} highIndex
     * @return {number}
     */
    const partition = (lowIndex, highIndex) => {
      /**
       * @param {number} leftIndex
       * @param {number} rightIndex
       */
      const swap = (leftIndex, rightIndex) => {
        const tempVariable = array[leftIndex];
        array[leftIndex] = array[rightIndex];
        array[rightIndex] = tempVariable;
      };

      let pivot = array[lowIndex];
      const mid = Math.floor((highIndex - lowIndex) / 2 + lowIndex);
      if((array[mid] < array[highIndex] && array[mid] > array[lowIndex]) ||
         (array[mid] > array[highIndex] && array[mid] < array[lowIndex])) {
          pivot = array[mid];
      } else if((array[highIndex] < array[mid] && array[highIndex] > array[lowIndex]) ||
         (array[highIndex] > array[mid] && array[highIndex] < array[lowIndex])) {
          pivot = array[highIndex];
      }

      let left = lowIndex;
      let right = highIndex;
      while(left <= right) {
          while(this.comparator.lessThan(array[left], pivot)) left += 1;
          while(this.comparator.greaterThan(array[right], pivot)) right -= 1;
          if(left <= right) {
            swap(left, right);
            left += 1;
            right -= 1;
          }
      }

      return [right, left];
    };

    /*
     * While we can use a default parameter to set `low` to 0, we would
     * still have to set `high`'s default within the function as we
     * don't have access to `array.length - 1` when declaring parameters
     */
    const lowIndex = inputLowIndex === undefined ? 0 : inputLowIndex;
    const highIndex = inputHighIndex === undefined ? array.length - 1 : inputHighIndex;

    // Base case is when low and high converge
    if (lowIndex < highIndex) {
      const partitionIndices = partition(lowIndex, highIndex);
      /*
       * `partition()` swaps elements of the array based on their comparison to the `hi` parameter,
       * and then returns the index where swapping is no longer necessary, which can be best thought
       * of as the pivot used to split an array in a non-in-place quicksort
       */
      this.sort(array, lowIndex, partitionIndices[0]);
      this.sort(array, partitionIndices[1], highIndex);
    }

    return array;
  }
}

class MinHeap {
  /**
   * @param {Function} [comparatorFunction]
   */
  constructor(comparatorFunction) {
    // Array representation of the heap.
    this.heapContainer = [];
    this.compare = new Comparator(comparatorFunction);
  }

  /**
   * @param {number} parentIndex
   * @return {number}
   */
  getLeftChildIndex(parentIndex) {
    return (2 * parentIndex) + 1;
  }

  /**
   * @param {number} parentIndex
   * @return {number}
   */
  getRightChildIndex(parentIndex) {
    return (2 * parentIndex) + 2;
  }

  /**
   * @param {number} childIndex
   * @return {number}
   */
  getParentIndex(childIndex) {
    return Math.floor((childIndex - 1) / 2);
  }

  /**
   * @param {number} childIndex
   * @return {boolean}
   */
  hasParent(childIndex) {
    return this.getParentIndex(childIndex) >= 0;
  }

  /**
   * @param {number} parentIndex
   * @return {boolean}
   */
  hasLeftChild(parentIndex) {
    return this.getLeftChildIndex(parentIndex) < this.heapContainer.length;
  }

  /**
   * @param {number} parentIndex
   * @return {boolean}
   */
  hasRightChild(parentIndex) {
    return this.getRightChildIndex(parentIndex) < this.heapContainer.length;
  }

  /**
   * @param {number} parentIndex
   * @return {*}
   */
  leftChild(parentIndex) {
    return this.heapContainer[this.getLeftChildIndex(parentIndex)];
  }

  /**
   * @param {number} parentIndex
   * @return {*}
   */
  rightChild(parentIndex) {
    return this.heapContainer[this.getRightChildIndex(parentIndex)];
  }

  /**
   * @param {number} childIndex
   * @return {*}
   */
  parent(childIndex) {
    return this.heapContainer[this.getParentIndex(childIndex)];
  }

  /**
   * @param {number} indexOne
   * @param {number} indexTwo
   */
  swap(indexOne, indexTwo) {
    const tmp = this.heapContainer[indexTwo];
    this.heapContainer[indexTwo] = this.heapContainer[indexOne];
    this.heapContainer[indexOne] = tmp;
  }

  /**
   * @return {*}
   */
  peek() {
    if (this.heapContainer.length === 0) {
      return null;
    }

    return this.heapContainer[0];
  }

  /**
   * @return {*}
   */
  poll() {
    if (this.heapContainer.length === 0) {
      return null;
    }

    if (this.heapContainer.length === 1) {
      return this.heapContainer.pop();
    }

    const item = this.heapContainer[0];

    // Move the last element from the end to the head.
    this.heapContainer[0] = this.heapContainer.pop();
    this.heapifyDown();

    return item;
  }

  /**
   * @param {*} item
   * @return {MinHeap}
   */
  add(item) {
    this.heapContainer.push(item);
    this.heapifyUp();
    return this;
  }

  /**
   * @param {*} item
   * @param {Comparator} [customFindingComparator]
   * @return {MinHeap}
   */
  remove(item, customFindingComparator) {
    // Find number of items to remove.
    const customComparator = customFindingComparator || this.compare;
    const numberOfItemsToRemove = this.find(item, customComparator).length;

    for (let iteration = 0; iteration < numberOfItemsToRemove; iteration += 1) {
      // We need to find item index to remove each time after removal since
      // indices are being change after each heapify process.
      const indexToRemove = this.find(item, customComparator).pop();

      // If we need to remove last child in the heap then just remove it.
      // There is no need to heapify the heap afterwards.
      if (indexToRemove === (this.heapContainer.length - 1)) {
        this.heapContainer.pop();
      } else {
        // Move last element in heap to the vacant (removed) position.
        this.heapContainer[indexToRemove] = this.heapContainer.pop();

        // Get parent.
        const parentItem = this.hasParent(indexToRemove) ? this.parent(indexToRemove) : null;
        const leftChild = this.hasLeftChild(indexToRemove) ? this.leftChild(indexToRemove) : null;

        // If there is no parent or parent is less then node to delete then heapify down.
        // Otherwise heapify up.
        if (
          leftChild !== null
          && (
            parentItem === null
            || this.compare.lessThan(parentItem, this.heapContainer[indexToRemove])
          )
        ) {
          this.heapifyDown(indexToRemove);
        } else {
          this.heapifyUp(indexToRemove);
        }
      }
    }

    return this;
  }

  /**
   * @param {*} item
   * @param {Comparator} [customComparator]
   * @return {Number[]}
   */
  find(item, customComparator) {
    const foundItemIndices = [];
    const comparator = customComparator || this.compare;

    for (let itemIndex = 0; itemIndex < this.heapContainer.length; itemIndex += 1) {
      if (comparator.equal(item, this.heapContainer[itemIndex])) {
        foundItemIndices.push(itemIndex);
      }
    }

    return foundItemIndices;
  }

  /**
   * @param {number} [customStartIndex]
   */
  heapifyUp(customStartIndex) {
    // Take last element (last in array or the bottom left in a tree) in
    // a heap container and lift him up until we find the parent element
    // that is less then the current new one.
    let currentIndex = customStartIndex || this.heapContainer.length - 1;

    while (
      this.hasParent(currentIndex)
      && this.compare.lessThan(this.heapContainer[currentIndex], this.parent(currentIndex))
    ) {
      this.swap(currentIndex, this.getParentIndex(currentIndex));
      currentIndex = this.getParentIndex(currentIndex);
    }
  }

  /**
   * @param {number} [customStartIndex]
   */
  heapifyDown(customStartIndex) {
    // Compare the root element to its children and swap root with the smallest
    // of children. Do the same for next children after swap.
    let currentIndex = customStartIndex || 0;
    let nextIndex = null;

    while (this.hasLeftChild(currentIndex)) {
      if (
        this.hasRightChild(currentIndex)
        && this.compare.lessThan(this.rightChild(currentIndex), this.leftChild(currentIndex))
      ) {
        nextIndex = this.getRightChildIndex(currentIndex);
      } else {
        nextIndex = this.getLeftChildIndex(currentIndex);
      }

      if (this.compare.lessThan(this.heapContainer[currentIndex], this.heapContainer[nextIndex])) {
        break;
      }

      this.swap(currentIndex, nextIndex);
      currentIndex = nextIndex;
    }
  }

  /**
   * @return {boolean}
   */
  isEmpty() {
    return !this.heapContainer.length;
  }

  /**
   * @return {string}
   */
  toString() {
    return this.heapContainer.toString();
  }
}

class HeapSort extends Sort {
  sort(originalArray) {
    const sortedArray = [];
    const minHeap = new MinHeap(this.callbacks.compareCallback);

    // Insert all array elements to the heap.
    originalArray.forEach((element) => {
      // Call visiting callback.
      this.callbacks.visitingCallback(element);

      minHeap.add(element);
    });

    // Now we have min heap with minimal element always on top.
    // Let's poll that minimal element one by one and thus form the sorted array.
    while (!minHeap.isEmpty()) {
      const nextMinElement = minHeap.poll();

      // Call visiting callback.
      this.callbacks.visitingCallback(nextMinElement);

      sortedArray.push(nextMinElement);
    }

    return sortedArray;
  }
}


class MergeSort extends Sort {
  sort(originalArray) {
    // Call visiting callback.
    this.callbacks.visitingCallback(null);

    // If array is empty or consists of one element then return this array since it is sorted.
    if (originalArray.length <= 1) {
      return originalArray;
    }

    // Split array on two halves.
    const middleIndex = Math.floor(originalArray.length / 2);
    const leftArray = originalArray.slice(0, middleIndex);
    const rightArray = originalArray.slice(middleIndex, originalArray.length);

    // Sort two halves of split array
    const leftSortedArray = this.sort(leftArray);
    const rightSortedArray = this.sort(rightArray);

    // Merge two sorted arrays into one.
    return this.mergeSortedArrays(leftSortedArray, rightSortedArray);
  }

  mergeSortedArrays(leftArray, rightArray) {
    let sortedArray = [];

    // In case if arrays are not of size 1.
    while (leftArray.length && rightArray.length) {
      let minimumElement = null;

      // Find minimum element of two arrays.
      if (this.comparator.lessThanOrEqual(leftArray[0], rightArray[0])) {
        minimumElement = leftArray.shift();
      } else {
        minimumElement = rightArray.shift();
      }

      // Call visiting callback.
      this.callbacks.visitingCallback(minimumElement);

      // Push the minimum element of two arrays to the sorted array.
      sortedArray.push(minimumElement);
    }

    // If one of two array still have elements we need to just concatenate
    // this element to the sorted array since it is already sorted.
    if (leftArray.length) {
      sortedArray = sortedArray.concat(leftArray);
    }

    if (rightArray.length) {
      sortedArray = sortedArray.concat(rightArray);
    }

    return sortedArray;
  }
}

class MergeSortInPlace extends Sort {
  sort(originalArray) {
    const array = [...originalArray];
    const n = array.length;

    // outer loop: number of elements to merge
    for(let j = 2; j < 2 * n; j *= 2) {
      // inner loop: merge chunks of size j
      for(let i = 0; i < n; i += j) {
        let right = Math.min(i + j - 1, n - 1);
        // mid is the last index of the sorted first part
        let mid = i + j/2 - 1;
        if(mid < right) this.merge(array, i, mid, right);
      }
    }
    return array;
  }

  merge(array, lo, mid, hi) {
    let a = lo, b = mid + 1, tmp;
    while(a <= mid && b <= hi) {
      if(this.comparator.lessThanOrEqual(array[a], array[b])) {
        a++;
      } else {
        tmp = array[a];
        array[a++] = array[b++];
        for(let i = a; i < b; i++) {
          let tmptmp = array[i];
          array[i] = tmp;
          tmp = tmptmp;
        }
        mid++;
      }
    }
  }

}

console.log("n,sort,it,time");

[ 1000, 2000, 4000, 8000, 16000, 32000, 64000, 128000, 256000, 512000, 1024000 ].forEach(function(n) {
    as = [ Array.from({length: n}, () => Math.floor(Math.random() * n * 10)).sort(function(a, b) { return a - b; }),
           Array.from({length: n}, () => Math.floor(Math.random() * n * 10)).sort(function(a, b) { return a - b; }).reverse(),
           Array.from({length: n}, () => Math.floor(Math.random() * n * 3)),
           Array.from({length: n}, () => Math.floor(Math.random() * n * 4)),
           Array.from({length: n}, () => Math.floor(Math.random() * n * 5)),
           Array.from({length: n}, () => Math.floor(Math.random() * n * 6)),
           Array.from({length: n}, () => Math.floor(Math.random() * n * 7)),
           Array.from({length: n}, () => Math.floor(Math.random() * n * 8)),
           Array.from({length: n}, () => Math.floor(Math.random() * n * 9)),
           Array.from({length: n}, () => Math.floor(Math.random() * n * 10)) ]

    as.forEach(function(a, i) {
        var qs = new QuickSort();
        var qsi = new QuickSortInPlace();
        var is = new InsertionSort();
        var hs = new HeapSort();
        var ms = new MergeSort();
        var msi = new MergeSortInPlace();

        var t = microtime.now();
        qs.sort(a);
        console.log(n + ",quick," + i + "," + (microtime.now() - t));

        t = microtime.now();
        b = qsi.sort(a);
        console.log(n + ",quick-in-place," + i + "," + (microtime.now() - t));

        t = microtime.now();
        is.sort(a);
        console.log(n + ",insertion," + i + "," + (microtime.now() - t));

        t = microtime.now();
        hs.sort(a);
        console.log(n + ",heap," + i + "," + (microtime.now() - t));

        t = microtime.now();
        ms.sort(a);
        console.log(n + ",merge," + i + "," + (microtime.now() - t));

        t = microtime.now();
        msi.sort(a);
        console.log(n + ",merge-in-place," + i + "," + (microtime.now() - t));

        t = microtime.now();
        a.sort(function(a, b) { return a - b; });
        console.log(n + ",lib," + i + "," + (microtime.now() - t));
    });
});
