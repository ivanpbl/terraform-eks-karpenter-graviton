resource "kubectl_manifest" "karpenter_provisioner_x86" {
  yaml_body = <<-YAML
    apiVersion: karpenter.sh/v1alpha5
    kind: Provisioner
    metadata:
      name: x86-spot
    spec:
      requirements:
        - key: "kubernetes.io/arch"
          operator: In
          values: ["amd64"]
        - key: "karpenter.sh/capacity-type"
          operator: In
          values: ["spot", "on-demand"]
      providerRef:
        name: default
      ttlSecondsAfterEmpty: 30
  YAML
}

resource "kubectl_manifest" "karpenter_provisioner_arm64" {
  yaml_body = <<-YAML
    apiVersion: karpenter.sh/v1alpha5
    kind: Provisioner
    metadata:
      name: arm64-spot
    spec:
      requirements:
        - key: "kubernetes.io/arch"
          operator: In
          values: ["arm64"]
        - key: "karpenter.sh/capacity-type"
          operator: In
          values: ["spot", "on-demand"]
      providerRef:
        name: default
      ttlSecondsAfterEmpty: 30
  YAML
}
