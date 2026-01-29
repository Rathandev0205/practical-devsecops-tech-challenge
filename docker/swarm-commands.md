docker swarm init --advertise-addr 10.0.1.204
docker swarm join --token SWMTKN-1-5s5e4xna2ssgx35wpcbetaxf9ak30ynqcelf4ckn5avp5f84w4-ea0z7utys0d8cc7ni737wyqug 10.0.1.204:2377
docker node ls
