all: simple

simple:
	crystal build --release simple_query.cr -o simple_query

