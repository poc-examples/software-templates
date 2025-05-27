# Module 5: Using Red Hat build of OpenTelemetry

## Git Repositories

- **Python:** https://github.com/na-launch/developer-experience-workshop/tree/module5-python  
- **Dotnet:** https://github.com/na-launch/developer-experience-workshop/tree/module5-dotnet

## Objectives

We will set up *auto instrumentation*, a tracing framework with minimal code changes that automatically injects and configures instrumentation libraries in various supported languages.  
We will explore the *Kubernetes Sidecar* design pattern, which deploys an agent sidecar container within an application pod that sends traces to a centralized Grafana Tempo.  
The application will send tracing data to a *collector agent* (sidecar), which offloads responsibility by forwarding the data to a storage backend—in this case, the central Grafana Tempo instance.  
For this workshop in Python and .NET, the auto instrumentation libraries send data on port `4318` using the `OTLP/HTTP` protocol.

## Guided Exercise

Inside your workspace is a Python application that listens on `/api/check` for web requests and returns an HTTP `200` or `500` status code based on the payload.

1. From the Terminal, build the Python Application in your project using:

    ```sh
    oc new-build --binary --name workshop-<your username>
    oc start-build workshop-<your username> --from-dir=.
    ```

    After a few seconds, an imagestream should be available and you can deploy the Python Application:

    ```sh
    oc new-app workshop-<your username> --name workshop-<your username>
    ```

    > **Note:** Please ensure your application name is unique from others in the workshop. Otherwise, you may not be able to find your web requests in the Jaeger UI.

2. Deploy the sidecar with the OpenTelemetry Collector sidecar manifest:

    ```sh
    oc apply -f manifests/sidecar.yaml
    ```

3. Create an *Instrumentation* manifest in your project to be used by the OpenTelemetry Operator:

    ```sh
    oc apply -f manifests/instrumentation.yaml
    ```

4. Edit your deployment to add annotations for .NET auto instrumentation:

    ```sh
    oc edit deployment workshop-<your username>
    ```

    Add the following under `spec.template.metadata.annotations`:

    ```yaml
    spec:
      template:
        metadata:
          annotations:
            instrumentation.opentelemetry.io/inject-python: "true"
            sidecar.opentelemetry.io/inject: sidecar
    ```

## Self-Paced Exercise

The application has some problems that we would like you to fix:

1. There is a cronjob located at `curl-cron/cronjob.yaml` that will poll the application at service port `5000` every minute.

2. Modify the environment variable `ENDPOINT` to match your service name `workshop-<your username>` and deploy it:

    ```sh
    oc apply -f curl-cron/cronjob.yaml
    ```

    > **Note:** The cron job sends a request once per minute, so there might be a delay before seeing web requests in the Jaeger UI.  
    > You will also see requests from other users.

3. A centralized Grafana Tempo instance has been deployed for the workshop.  
   To view web requests, navigate to the OpenShift web console → **Application Menu** → **Jaeger UI**

4. The cron job is currently returning an HTTP `500`. Fix the application so that it returns an HTTP `200`.

5. *(Optional)* To generate additional traffic without waiting for the cron job, run the following script in your Dev Spaces terminal:

    ```sh
    sh traffic-generator.sh workshop-<your username>:5000
    ```

6. You can trigger a new build of your application with:

    ```sh
    oc start-build workshop-<your username> --from-dir=.
    ```

## Easter Eggs!

- There is an easter egg in the code.  
- Be thorough! Look through the code.

## Takeaways

- Explored Kubernetes Sidecar design pattern  
- Auto-instrumented an application to collect tracing data  
- Generated application traffic to produce tracing data  
- Used tracing data to troubleshoot the application
