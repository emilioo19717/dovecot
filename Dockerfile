FROM instrumentisto/dovecot

ADD ./dovecot.conf /etc/dovecot/dovecot.conf
ADD ./conf.d/10-auth.conf /etc/dovecot/conf.d/10-auth.conf
ADD ./conf.d/10-mail.conf /etc/dovecot/conf.d/10-mail.conf
ADD ./conf.d/10-master.conf /etc/dovecot/conf.d/10-master.conf
ADD ./conf.d/20-lmtp.conf /etc/dovecot/conf.d/20-lmtp.conf
ADD ./auth-sql.conf.ext /etc/dovecot/auth-sql.conf.ext
ADD ./dovecot-sql.conf.ext /etc/dovecot/dovecot-sql.conf.ext
ADD ./conf.d/10-logging.conf /etc/dovecot/conf.d/10-logging.conf

RUN mkdir -p /var/mail/vhosts/web.mail
RUN groupadd -g 5000 vmail
RUN useradd -g vmail -u 5000 vmail -d /var/mail
RUN chown -R vmail:vmail /var/mail/vhosts/web.mail
RUN chown -R vmail:dovecot /etc/dovecot
RUN chmod -R o-rwx /etc/dovecot

EXPOSE 110 143 


