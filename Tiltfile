allow_k8s_contexts('osm-admin')

SOURCE_IMAGE = os.getenv("SOURCE_IMAGE", default='hub.docker.com/repository/docker/showpune/zhiyong2-tanzu-java-web-app-tap-developer')
LOCAL_PATH = os.getenv("LOCAL_PATH", default='.')
NAMESPACE = os.getenv("NAMESPACE", default='tap-developer')

k8s_custom_deploy(
    'zhiyong2-tanzu-java-web-app',
    apply_cmd="tanzu apps workload apply -f config/workload.yaml " +
                " --live-update" +
                " --local-path " + LOCAL_PATH +
                " --source-image " + SOURCE_IMAGE +
                " --namespace " + NAMESPACE +
                " -y " +
              "&& kubectl get workload zhiyong2-tanzu-java-web-app --namespace " + NAMESPACE + " -o yaml",
    delete_cmd="tanzu apps workload delete -f config/workload.yaml --namespace " + NAMESPACE + " --yes",
    deps=['pom.xml', './target/classes'],
    image_selector='index.docker.io/showpune/zhiyong2-tanzu-java-web-app-' + NAMESPACE,
    live_update=[
      sync('./target/classes', '/workspace/BOOT-INF/classes')
    ]
)

k8s_resource('zhiyong2-tanzu-java-web-app', port_forwards=["8080:8080"],
            extra_pod_selectors=[{'serving.knative.dev/service': 'zhiyong2-tanzu-java-web-app'}])