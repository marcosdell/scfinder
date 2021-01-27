# scfinder

A very very simple way to find the http status code for a set of urls.
 
## Why?

Maybe you want to bypass some 401 or 403 urls and try to access forbidden content ... \o/

## How?

```
$ cat <urls> | ./scfinder.sh <status code>
```

- urls: a file with one url per line
- status code: 401 (unauthorized), 403 (forbidden), or ...?

# How it works?

Very simple: it makes a curl request and tests the http code result.

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

Get all the 403 urls:

```
$ cat httprobe.txt | ./scfinder.sh 403 > 403.txt
```
