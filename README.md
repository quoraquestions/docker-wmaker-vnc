#shenjinti/docker-wmaker-vnc

Manual Build:
--
    git clone https://github.com/shenjinti/docker-wmaker-vnc.git
    cd docker-wmaker-vnc
    docker build .
    
Run:
--
    docker run --name wmaker_vnc -p 5900:5900 shenjinti/docker-wmaker-vnc
