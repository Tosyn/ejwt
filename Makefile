all: deps compile

start:
	./rebar get-deps
	./rebar compile
	erl -pa deps/*/ebin ebin

citest:
	./rebar get-deps
	./rebar compile
	./script/run_test

compile:
	./rebar compile

deps:
	./rebar get-deps

clean:
	./rebar clean
	rm -fr ebin

include docker/docker.mk
