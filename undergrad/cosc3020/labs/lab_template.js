// lab XX - COSC 3020 - Fall 2019
// Jacob Tuttle
// answers to written portions of the assignment

// 1. XXX
function main() {

}


// Testing

// main test driver program
// verb is a bool that denotes whether testing yields verbose output
function testMain(verb) {

    func f = mainFunction;

    // a set of test inputs and their expected outputs

    // print out verbose testing

    if (verb) {
        console.log("\nVerbose Testing: ");
        console.log("-----------------");

        /* verbose printing template
        console.log("\nData:");
        console.log();
        console.log("Expected Return Value:");
        console.log();
        console.log("Return Value:");
        console.log(f());
        */
    }

    // print out non-verbose testing
    if (true) {
        console.log("\n\nAll tests passed.");
    } else {
        console.log("\n\nTesting failed. Run verbose to see where.");
    }

}

// check for verbose output and begin testing
if (process.argv.length == 3) {
    if (process.argv[2] == 'true') {
        testDijkstra(true);
    } else {
        testDijkstra(false);
    }
} else {
    console.log("To see more verbose settings, pass true as a command line argument:\n`node lab_07_tuttle.js true`");
    console.log("To avoid seeing this message again, pass false as a command line argument instead.");
    testDijkstra(false);
}
