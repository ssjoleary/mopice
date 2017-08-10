#!/bin/bash

function prop {
    grep "${1}" mopice.properties|cut -d'=' -f2
}

echo "Updating mopidy.conf...."

sed -e "s/{{spotify_username}}/$(prop 'spotify_username')/" \
    -e "s/{{spotify_password}}/$(prop 'spotify_password')/" \
    -e "s/{{client_id}}/$(prop 'client_id')/" \
    -e "s/{{client_secret}}/$(prop 'client_secret')/" \
    -e "s/{{source_password}}/$(prop 'source_password')/" \
    -e "s/{{icecast_mount_name}}/$(prop 'icecast_mount_name')/" \
    -e "s/{{icecast_source_password}}/$(prop 'icecast_source_password')/" \
    resources/sample/mopidy.sample.conf > resources/mopidy.conf
