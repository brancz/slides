PromCon 2017 HA Alertmanager Talk
=================================

This repository contains the demo to the talk "Alertmanager and high
availability" that I gave at PromCon 2017.

Slides can be found at [`slides.pdf`](slides.pdf). Unfortunately converting to
PDF drops the transitions/animations.

Demo
----

Clone this repository

```bash
git clone https://github.com/brancz/slides.git
cd slides/promcon-2017-munich-alertmanager-ha
```

For the demo I compiled Alertmanager version `v0.8.0`.

Drop the Alertmanager binary into this directory and install
[goreman](https://github.com/mattn/goreman). You will need a go compiler
installed. At the time of the demo I used version 1.8.

Start the demo with

```bash
goreman start
```

This starts 3 Alertmanager instances and a webhook server which will receive
notifications. The webhook server is located in `echo.go`, and is a simple http
server that prints the body of an incoming request. The Alertmanager instances
are available under:

* http://localhost:9093/
* http://localhost:9094/
* http://localhost:9095/

The demo included creating a silence from one of the instances which is then
gossiped to the other instances.

The second part is running a script that behaves like a Prometheus server when
it fires alerts against Alertmanager instances. The script is:

```bash
./send_alerts.sh
```

And because the Alertmanager gossiped the sent notification to the other
Alertmanager instances, the notification is only sent once to the webhook
server.
