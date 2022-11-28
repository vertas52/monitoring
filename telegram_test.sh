#!/bin/sh

curl \
--request POST \
--data '{"receiver":"telegram","status":"resolved","alerts":[{"status":"resolved","labels":{"alertname":"Fire","severity":"critical"},"annotations":{"message":"Everything is OK, just testing bot"},"startsAt":"2018-11-04T22:43:58.283995108+01:00","endsAt":"2018-11-04T22:48:13.283995108+01:00","generatorURL":"http://localhost:9090/graph?g0.expr=vector%28666%29\u0026g0.tab=1"}],"groupLabels":{"alertname":"Fire"},"commonLabels":{"alertname":"Fire","severity":"critical"},"commonAnnotations":{"message":"Nothing is on fire"},"externalURL":"http://localhost:9093","version":"4","groupKey":"{}:{alertname=\"Fire\"}"}' \
localhost:9116
