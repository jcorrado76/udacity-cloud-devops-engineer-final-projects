prometheus:
        sudo docker run  -p 9090:9090 -v ~/prometheus.yml:/etc/prometheus/prometheus.yml -v ~/rules.yml:/etc/prometheus/rules.yml prom/prometheus

alertmanager:
        sudo docker run -p 9093:9093 -v ~/alertmanager.yml:/etc/alertmanager/alertmanager.yml prom/alertmanager
.PHONY: prometheus alertmanager