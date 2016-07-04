all: simple

simple:
	crystal build --release src/simple_query.cr -o simple_query

