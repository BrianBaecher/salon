# salon

Uses a sh file to insert data into the salon database with customer information and appointment details.

It'd be a good idea to come back and revisit this project to come up with a more elegant solution. I listed a nearly identical function five times in the switch case and only changed the "service" variable within each one. Resulting in an unnecessarily long and redundant script.

UPDATE : Changed the switch case to have the service as an argument to the PRC function -- which is then read by the variable. If only I realised that 5 days ago XD