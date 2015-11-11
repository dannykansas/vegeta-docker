# vegeta-docker
A modified [Vegeta](https://github.com/tsenart/vegeta), implemented in Docker and running on the ultra-lightweight Alpine Linux. Vegeta is a load-testing tool )

## General Notes

The Dockerfile is very simple, with the primary point of interest being that `ENTRYPOINT` is set to `/go/bin/vegeta`, such that all instances of `vegeta` in documentation may be replaced with the standard `docker run` invocation. 

Accordingly, this means all standard vegeta commands may be issued simply as the "command" parameter of the `docker run` CLI control tool, like so:

Example (using the `attack` command with target echo'ed from stdin):

`echo "GET http://localhost/" | docker run --rm vertigomedia/vegeta attack -duration=5s > results.bin`

Other examples below may be implemented in a similar fashion. 

## Usage manual
```
Usage: vegeta [global flags] <command> [command flags]

global flags:
  -cpus=8: Number of CPUs to use
  -profile="": Enable profiling of [cpu, heap]
  -version=false: Print version and exit

attack command:
  -body="": Requests body file
  -cert="": x509 Certificate file
  -connections=10000: Max open idle connections per target host
  -duration=10s: Duration of the test
  -header=: Request header
  -keepalive=true: Use persistent connections
  -laddr=0.0.0.0: Local IP address
  -lazy=false: Read targets lazily
  -output="stdout": Output file
  -rate=50: Requests per second
  -redirects=10: Number of redirects to follow. -1 will not follow but marks as success
  -targets="stdin": Targets file
  -timeout=30s: Requests timeout
  -workers=10: Initial number of workers

report command:
  -inputs="stdin": Input files (comma separated)
  -output="stdout": Output file
  -reporter="text": Reporter [text, json, plot, hist[buckets]]

dump command:
  -dumper="json": Dumper [json, csv]
  -inputs="stdin": Input files (comma separated)
  -output="stdout": Output file

examples:
  echo "GET http://localhost/" | vegeta attack -duration=5s | tee results.bin | vegeta report
  vegeta attack -targets=targets.txt > results.bin
  vegeta report -inputs=results.bin -reporter=json > metrics.json
  cat results.bin | vegeta report -reporter=plot > plot.html
  cat results.bin | vegeta report -reporter="hist[0,100ms,200ms,300ms]"
```
