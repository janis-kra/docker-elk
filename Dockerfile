FROM sebp/elk:520

WORKDIR ${LOGSTASH_HOME}
RUN gosu logstash bin/logstash-plugin install logstash-filter-de_dot

COPY postgresql-9.4.1212.jre6.jar /lib

WORKDIR /etc/logstash/conf.d/
RUN rm 30-output.conf
COPY simple-out.conf 30-contacts-postgres-import.conf
