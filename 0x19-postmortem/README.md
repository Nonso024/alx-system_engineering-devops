![funnyimage](image.png)

# **POSTMOTERM(Incident Report) for GLENO**

## **Issue Summary**

Yesterday, it was reported that from 16:24pm (WAT UTC+1) to 17:58pm (WAT UTC+1) the Gleno E-commerce platform was returning 500 error messages on all made requests on platform api routes, all services were down and 85% of users experienced some sort of difficulty, the root cause of this outage was the failure of our web-01 server.

## **Timeline**

- 16:24 PM: Outage begins
- 16:26 PM: Pagers alerted teams
- 16:54 PM: Failed configuration change rollback
- 17:15 PM: Successful configuration change rollback
- 17:19 PM: Server restarts begin
- 17:58 PM: 100% of traffic back online

## **Root cause and Resolution**

The Gleno E-commerce platform is served by two web servers. The master web server web-01 was connected to handle all requests, due to a memory outage as a result of so many requests it stopped functioning because the client web server web-02 was temporarily disconnected for testing and was not connected back to the load balancer afterwards.

The issue was resolved after we disconnected the master web server temporarily for a memory clean up after which we connected back to the load-balancer and the algorithm was configured to ensure that both master and client web servers can handle equal number of requests at the same time.

## **Preventive measures**

- Having a load of backup web-servers
- Choosing the best load-balancing algorithm for programs and ensuring that they are configured properly
- Constantly keeping watch over the web servers to ensure that constantly perform properly
