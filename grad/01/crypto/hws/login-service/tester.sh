#!/bin/bash

# assumes that docker compose up has already been run

echo
echo "Create First Account"
curl -X POST http://localhost:8080/register -d '{"username": "andeyrobins", "password": "super-secure-password"}' -H 'Content-Type: application/json'

echo
echo "Attempt to Create Second Account with Identical Credentials"
curl -X POST http://localhost:8080/register -d '{"username": "andeyrobins", "password": "super-secure-password"}' -H 'Content-Type: application/json'

echo
echo "Send Wrong HTTP Type"
curl -X PUT http://localhost:8080/register -d '{"username": "andeyrobins", "password": "super-secure-password"}' -H 'Content-Type: application/json'

echo
echo "Login with Incorrect Password"
curl -X PUT http://localhost:8080/login -d '{"username": "andeyrobins", "password": "my-other-wrong-password"}' -H 'Content-Type: application/json'

echo
echo "Login with Incorrect Username"
curl -X PUT http://localhost:8080/login -d '{"username": "cooldude7", "password": "super-secure-password"}' -H 'Content-Type: application/json'

echo
echo "Attempt Valid Login"
curl -X PUT http://localhost:8080/login -d '{"username": "andeyrobins", "password": "super-secure-password"}' -H 'Content-Type: application/json'


