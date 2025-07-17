1，Docker 创建网络：  
docker network create --subnet=172.18.1.0/24 --gateway 172.18.1.1 MyNET

2，部署固定IP的 ADGuard Home：  
docker run -d --name AdGuard-Home1 -v /opt/docker/AGH_Docker1:/opt/adguardhome/work -v /opt/docker/AGH_Docker1:/opt/adguardhome/conf -p 3001:3000 --restart always --net MyNET --ip 172.18.1.10 adguard/adguardhome:latest
