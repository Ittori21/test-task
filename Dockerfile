FROM nginx:1.29.6
ENV TZ="Europe/Moscow"
RUN rm /etc/nginx/conf.d/default.conf
RUN mkdir -p /etc/nginx/ssl

COPY nginx.conf /etc/nginx/conf.d/nginx.conf
COPY index.html /usr/share/nginx/html/index.html

COPY nginx-selfsigned.crt /etc/nginx/ssl/
COPY nginx-selfsigned.key /etc/nginx/ssl/

RUN chown -R nginx:nginx /usr/share/nginx/html && \
    chown -R nginx:nginx /etc/nginx/conf.d && \
    chown -R nginx:nginx /etc/nginx/ssl && \
    chown -R nginx:nginx /var/cache/nginx && \
    chown -R nginx:nginx /var/log/nginx && \
    touch /var/run/nginx.pid && \
    chown -R nginx:nginx /var/run/nginx.pid

USER nginx
CMD ["nginx", "-g", "daemon off;"]
