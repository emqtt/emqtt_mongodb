PROJECT = emq_auth_mongo
PROJECT_DESCRIPTION = Authentication/ACL with MongoDB
PROJECT_VERSION = 2.3.11

DEPS = mongodb ecpool clique
dep_mongodb = git https://github.com/emqtt/mongodb-erlang v3.0.7
dep_ecpool  = git https://github.com/emqtt/ecpool v0.2.1
dep_clique  = git https://github.com/emqtt/clique v0.3.10

BUILD_DEPS = emqttd cuttlefish
dep_emqttd = git https://github.com/emqtt/emqttd develop
dep_cuttlefish = git https://github.com/emqtt/cuttlefish v2.0.11

NO_AUTOPATCH = cuttlefish

ERLC_OPTS += +debug_info
ERLC_OPTS += +'{parse_transform, lager_transform}'

TEST_DEPS = emqttc emq_auth_username
dep_emqttc = git https://github.com/emqtt/emqttc
dep_emq_auth_username = git https://github.com/emqtt/emq-auth-username

COVER = true

include erlang.mk

app:: rebar.config

app.config::
	deps/cuttlefish/cuttlefish -l info -e etc/ -c etc/emq_auth_mongo.conf -i priv/emq_auth_mongo.schema -d data

