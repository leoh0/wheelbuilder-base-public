# wheelbuilder-base-public

wheel 을 미리 빌딩해서 사용

```
VERSION=xenial
cd ${VERSION}
./run.sh
```

docker 에 login 한 이후에
```
./makewheel.sh
```

이후 .wheelhouse 안의 데이터를 url 로 배포가능한 위치로 이동

그 이후 global-requirements 가 필요할때 아래와 같이 인스톨
```
cd openstack/requirements
pip install --use-wheel --no-index --find-links=${URL} -c upper-constraints.txt -r global-requirements.txt
```