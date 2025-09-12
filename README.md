# Vulnacle
A deliberately misconfigured database training appliance

Vulnacle — a deliberately misconfigured database training appliance for security demos and sysadmin hardening workshops.
Use it to demonstrate how common configuration mistakes can be discovered and fixed by defenders — and tested by ethical pentesters — in a controlled, legal, and auditable environment.

⚠️ IMPORTANT: Vulnacle is for education, training, and research only. Do not run it on public networks or use it to attack systems you do not own or have explicit permission to test. See Legal & Safety below.

# Before you begin
- To download and run Oracle Database, regardless whether inside or outside a container, you must download the binaries from the Oracle website and accept the license indicated at that page.


# Legal, licensing & safety — read carefully

- Do not redistribute vendor binaries unless the vendor license explicitly allows it. This project uses a build-locally approach to avoid redistributing proprietary code.

- Oracle and other vendors have trademark and redistribution rules. If you plan to distribute binary-containing images outside a controlled environment, seek legal review or vendor permission.

- Use only for lawful, authorized testing. Do not use Vulnacle to facilitate unauthorized access or attacks. You are responsible for complying with local laws and organizational policies.

- No offensive tooling included. Vulnacle documents weaknesses and remediation; it does not include exploit code or step-by-step attack recipes.

# To build docker

```
git clone https://github.com/fevosec/Vulnacle.git
cd Vulnacle
./build.sh
```

# Connect to the docker to exploit the database

```
docker exec -it vulnacledb bash
sqlplus vuln01@127.0.0.1:1521/XEPDB1
```

The passwords for each user is the same as the username (vuln01/vuln01 for example)

# To restart the docker simply run

```
docker start -i vulnacledb
```

if there's any errors or issues, remove the docker and recreate it. The database is persistent and this will run quickly. Run these commands inside the Vulnacle directory

```
docker rm vulnacledb
docker run --name vulnacledb -p 1521:1521 --ulimit nofile=1024:65536 --ulimit nproc=2047:16384 --ulimit stack=10485760:33554432 --ulimit memlock=3221225472 -e ORACLE_PWD=FunStuff1 -e INIT_SGA_SIZE=2048 -e INIT_PGA_SIZE=500 -e INIT_CPU_COUNT=1 -e INIT_PROCESSES=100 -v ./oradata:/opt/oracle/oradata -v ./setup:/opt/oracle/scripts/setup  vulnacle

```

# Playing with vulnerabilities

Currently, there are 5 vulnerabilities each in it's own user. The users are VULN01, VULN02, VULN03, VULN04 and VULN05. Although it is possible to use odat to exploit all of these vulnerabilities, it is highly recommended to perform all of it manually as you might not have access to odat or access to the oracle listener (port 1521 or whichever port it is running on).

