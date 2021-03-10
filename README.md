This is a demonstration of an haproxy 2.2 bug reported at https://github.com/haproxy/haproxy/issues/1176.

This demonstration:

- starts up an haproxy 2.1 and an haproxy 2.2.10 container with an nginx pod as a server
- a netcat-based implementation of agent-check that always returns ready,up
- prints the CSV output from the stats page of each showing the server as UP for both 2.1 and 2.2
- stops the nginx container
- prints the CSV output from the stats page of each showing that haproxy 2.1 sees the backend as DOWN and haproxy 2.2 sees it as UP
