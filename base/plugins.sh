#!/bin/bash
echo -e "\e[36mENABLING PLUGINS\e[0m"
. ~/.bashrc # as exported path is not updted here
rabbitmq-plugins list <<< "y"
rabbitmq-plugins enable --offline rabbitmq_mqtt rabbitmq_stomp rabbitmq_management rabbitmq_management_agent rabbitmq_federation rabbitmq_federation_management <<< "y"