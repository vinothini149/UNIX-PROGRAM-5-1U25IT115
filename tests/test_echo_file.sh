#!/bin/bash

echo "=========================================="
echo " Linux echo Command - Automated Testing"
echo "=========================================="

PASS=0
FAIL=0

# Test Case 1
echo ""
echo "Test Case 1: Checking sample.txt"

if [ -f "sample.txt" ]; then
    echo "PASS: sample.txt exists"
    PASS=$((PASS + 1))
else
    echo "FAIL: sample.txt does not exist"
    FAIL=$((FAIL + 1))
fi


# Test Case 2
echo ""
echo "Test Case 2: Checking first line"

if [ -f "sample.txt" ] && grep -Fxq "This is a sample file." sample.txt; then
    echo "PASS: First line is correct"
    PASS=$((PASS + 1))
else
    echo "FAIL: First line is incorrect or missing"
    FAIL=$((FAIL + 1))
fi


# Test Case 3
echo ""
echo "Test Case 3: Checking appended text"

if [ -f "sample.txt" ] && grep -Fxq "This text will be appended." sample.txt; then
    echo "PASS: Appended text is correct"
    PASS=$((PASS + 1))
else
    echo "FAIL: Appended text is incorrect or missing"
    FAIL=$((FAIL + 1))
fi


# Test Case 4
echo ""
echo "Test Case 4: Checking complete file content"

EXPECTED=$'This is a sample file.\nThis text will be appended.'

if [ -f "sample.txt" ] && [ "$(cat sample.txt)" = "$EXPECTED" ]; then
    echo "PASS: Complete file content is correct"
    PASS=$((PASS + 1))
else
    echo "FAIL: Complete file content is incorrect"
    echo ""
    echo "Expected:"
    printf '%s\n' "$EXPECTED"
    echo ""
    echo "Actual:"
    cat sample.txt 2>/dev/null
    FAIL=$((FAIL + 1))
fi


# Final result
echo ""
echo "=========================================="
echo " Test Result"
echo "=========================================="

echo "Passed: $PASS"
echo "Failed: $FAIL"

if [ "$FAIL" -eq 0 ]; then
    echo ""
    echo "ALL TEST CASES PASSED!"
    exit 0
else
    echo ""
    echo "SOME TEST CASES FAILED!"
    exit 1
fi
