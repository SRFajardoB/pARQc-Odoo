FROM odoo:17

USER root

RUN apt-get update && apt-get install -y \
    nano \
    git \
    && rm -rf /var/lib/apt/lists/*

COPY ./addons /mnt/extra-addons
COPY ./odoo.conf /etc/odoo/odoo.conf
COPY ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

USER odoo
ENTRYPOINT ["/entrypoint.sh"]
