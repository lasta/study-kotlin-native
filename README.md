# study-kotlin-native
## TL;DR
Sample project of Kotlin/Native runs on Mac OS X and Amazon Linux 2

## Article
[Kotlin/Native on AWS Lambda その1 - Amazon Linux 2 上でビルド・実行](https://qiita.com/lasta/items/9169727d89829cf007c3)

## Build and Run
### Mac OS X (Host)
```shell
# build
./gradlew build
# run
for kexe in $(find build -name '*.kexe' | grep -v 'dSYM'); do echo "Run: ${kexe}"; "./${kexe}"; done
```

### Amazon Linux 2 (on Docker)
```shell
# build image
docker build -t gradle-on-amazonlinux2:1.0 .
# run image
docker run --memory=3g -v "$(pwd)":/root/work -itd gradle-on-amazonlinux2:1.0
# build
docker exec -it $(docker ps | grep 'gradle-on-amazonlinux' | awk '{print $1}') /root/work/gradlew -p /root/work/ clean build
# run
docker exec -it $(docker ps | grep 'gradle-on-amazonlinux' | awk '{print $1}') /root/work/build/bin/native/me.lasta.entrypointReleaseExecutable/me.lasta.entrypoint.kexe
docker exec -it $(docker ps | grep 'gradle-on-amazonlinux' | awk '{print $1}') /root/work/build/bin/native/rootReleaseExecutable/root.kexe
```
