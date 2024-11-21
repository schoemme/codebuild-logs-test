#!/bin/bash

# Function to generate some sample output
generate_output() {
    echo "This is standard output (stdout)"
    echo "This is standard error (stderr)" >&2
}

# Function to generate some errors
generate_error() {
    ls /nonexistent/directory 2>&1
}

echo "=== Test 1: Regular output (no redirection) ==="
generate_output

echo -e "\n=== Test 2: Redirecting stdout to /dev/null ==="
generate_output 1>/dev/null

echo -e "\n=== Test 3: Redirecting stderr to /dev/null ==="
generate_output 2>/dev/null

echo -e "\n=== Test 4: Redirecting both stdout and stderr to /dev/null ==="
generate_output >/dev/null 2>&1

echo -e "\n=== Test 5: Redirecting stdout to /dev/stdout ==="
generate_output >/dev/stdout

# echo -e "\n=== Test 6: Explicitly redirecting stderr to stdout using 2>&1 ==="
# generate_error 2>&1

# echo -e "\n=== Test 7: Saving both stdout and stderr to a file ==="
# generate_output &> output.log
# echo "Check output.log for results"

# echo -e "\n=== Test 8: Redirecting stdout to one file and stderr to another ==="
# generate_output 1>stdout.log 2>stderr.log
# echo "Check stdout.log and stderr.log for results"

# # Cleanup
# rm -f output.log stdout.log stderr.log
