#!/bin/bash

# Email details
recipient="spam4cali@gmail.com"
subject="Testing Shell Script"
body="Hello world."

# Send the email
echo "$body" | mail -s "$subject" "$recipient"

# Output a success message
echo "Email sent to $recipient with subject: $subject"