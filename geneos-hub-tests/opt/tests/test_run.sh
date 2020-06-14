#!bin/bash
echo "Executing $1 Tests..."

#Execute robot tests
robot -d reports -i $1 robot-tests

#Publish Results to Hub

