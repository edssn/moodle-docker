FROM edissonsigua/almalinux8-php74:latest

# Copy crontab file
ADD moodle-cron /etc/cron.d/moodle-cron

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/moodle-cron

# Enable Crontab file
RUN crontab /etc/cron.d/moodle-cron

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# Run the command on container startup
CMD [ "crond", "-n" ]

# docker build -t edissonsigua/moodle-cron .