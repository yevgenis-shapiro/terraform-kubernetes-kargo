
![P5esNo604TwM3IYa7vyksyaJQ](https://github.com/user-attachments/assets/ad74e54b-7f4c-46e2-a12e-8036c0707956)

 
## Terraform Module - Kargo | 🚀🚀🚀 
Kargo is a next-generation continuous delivery and application lifecycle orchestration platform for Kubernetes. It builds upon GitOps principles and integrates with existing technologies, like Argo CD, to streamline and automate the progressive rollout of changes across the many stages of an application's lifecycle.

🎯 Features
```

```

🔨 Example : Config

```
apiVersion: kargo.akuity.io/v1alpha1
kind: Stage
metadata:
  name: test
  namespace: kargo-demo
spec:
  requestedFreight:
  - origin:
      kind: Warehouse
      name: my-warehouse
    sources:
      direct: true
---

apiVersion: kargo.akuity.io/v1alpha1
kind: Stage
metadata:
  name: uat
  namespace: kargo-demo
spec:
  requestedFreight:
  - origin:
      kind: Warehouse
      name: my-warehouse
    sources:
      stages:
      - test
```
