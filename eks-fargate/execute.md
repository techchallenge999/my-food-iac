# Run the following command to remove the eks.amazonaws.com/compute-type : ec2 annotation from the CoreDNS pods.
kubectl patch deployment coredns \
    -n kube-system \
    --type json \
    -p='[{"op": "remove", "path": "/spec/template/metadata/annotations/eks.amazonaws.com~1compute-type"}]'

# Delete & Recreate CoreDNS Pods so that they can get scheduled on Fargate
kubectl rollout restart -n kube-system deployment coredns