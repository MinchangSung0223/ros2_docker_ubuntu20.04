# ros2_docker_ubuntu20.04

1. Docker 설치
```bash
curl https://get.docker.com | sh \
  && sudo systemctl --now enable docker
 
    sudo usermod -aG docker $USER # 현재 접속중인 사용자에게 권한주기
    sudo usermod -aG docker your-user # your-user 사용자에게 권한주기

distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
   && curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
   && curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

sudo apt-get update

sudo apt-get install -y nvidia-docker2
```


2. Docker build

Docker는 Dokerfile을 이용하여 설치명령어를 작성합니다. Dokerfile을 build 과정을 수행하여 docker image로 변환되며 변환된 이후 docker를 사용할 수 있습니다.

```bash
    git clone https://github.com/tjdalsckd/ros2_docker_ubuntu20.04.git
    bash build.sh
```
