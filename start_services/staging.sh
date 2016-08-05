#!/usr/bin/env bash
docker-compose -f docker-compose.yml -f docker-compose.staging.yml up --build -d