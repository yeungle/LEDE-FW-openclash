1，Docker 创建网络：  
docker network create --subnet=172.18.1.0/24 --gateway 172.18.1.1 MyNET

2，部署固定IP的 ADGuard Home：  
docker run -d --name AdGuard-Home1 -v /opt/docker/AGH_Docker1:/opt/adguardhome/work -v /opt/docker/AGH_Docker1:/opt/adguardhome/conf -p 3001:3000 --restart always --net MyNET --ip 172.18.1.10 adguard/adguardhome:latest

最新增强版模型 Model-ML-Enhance.bin 使用方法：将 Model-ML-Enhance.bin 改名为 Model.bin：
1，openclash上传到：/etc/openclash

ZashBoard 配置导入：https://gh-proxy.com/raw.githubusercontent.com/liandu2024/little/refs/heads/main/zashboard/zashboard-20250417.json
