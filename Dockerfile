# Imagen base de Odoo 17
FROM odoo:17

# Copia de módulos personalizados (opcional)
COPY ./extra-addons /mnt/extra-addons

# Puerto por defecto de PostgreSQL
ENV PGPORT=5432

# Comando de inicio
CMD ["bash", "-lc", "\
echo '==> Starting Odoo server on port $PORT' && \
odoo -d $PGDATABASE \
--db_host=$PGHOST --db_port=$PGPORT \
--db_user=$PGUSER --db_password=$PGPASSWORD \
--addons-path=/usr/lib/python3/dist-packages/odoo/addons,/mnt/extra-addons \
--db-filter=$PGDATABASE \
--http-port=$PORT \
--limit-time-real=100000"]
