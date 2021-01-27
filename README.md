# scfinder

A very very simple way to find http 401 and 403 urls.
 
## Why?

Maybe you want to bypass some 401/403 subs or urls and try to access forbidden content ...

## How?

```
$ cat <subs.txt> | ./scfinder.sh <status code>
```

(*) <subs.txt>: is a file with one url per line.
(*) <status code>: 401 (unauthorized) or 403 (forbidden)

# How it works?

Very simple: it makes a curl request and test the http code result.

# Install

Download the scfinder.sh and:

```
chmod +x scfinder.sh
```

# Step by step

Enumerate all subdomains from a target using [subfinder](https://github.com/projectdiscovery/subfinder):

```
$ subfinder -d yourtarget.com -o subfinder.txt
```

Probe for the working subs with [httprobe](https://github.com/tomnomnom/httprobe):

```
$ cat subfinder.txt | httprobe > httprobe.txt
```

Get the 401:

```
$ cat httprobe.txt | ./scfinder.sh 401 > 401.txt
```

Get the 403:

```
$ cat httprobe.txt | ./scfinder.sh 403 > 403.txt
```
