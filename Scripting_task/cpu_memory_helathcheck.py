import psutil
import smtplib
from email.mime.text import MIMEText

def monitor_system_resource():
    cpu_usage = psutil.cpu_percent()
    memory_usage = psutil.virtual_memory().percent

    if cpu_usage > 90:
        send_alert_email("High CPU usage", f"Current cpu usage: {cpu_usage}%")

    if memory_usage > 90:
        send_alert_email("High memory usage", f"Current memory usage: {memory_usage}%")


def send_alert_email(subject, body):
    sender_email = "your_email@example.com"
    receiver_email = "admin@example.com"

    msg = MIMEText(body)
    msg["Subject"] = subject
    msg["From"] = sender_email
    msg["To"] = receiver_email

    with smtplib.SMTP("smtp.example.com", 587) as server:
        server.starttls()
        server.login(sender_email, "your_password")
        server.sendmail(sender_email, receiver_email, msg.as_string())

#Example Usage
        monitor_system_resource