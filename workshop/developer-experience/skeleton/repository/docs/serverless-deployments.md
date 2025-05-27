# Module 4: Creating and Deploying Your First Serverless Function

## Git Repositories

- **Python:** https://github.com/na-launch/developer-experience-workshop/tree/module4-python  
- **Dotnet:** https://github.com/na-launch/developer-experience-workshop/tree/module4-dotnet

## Objectives

Instead of managing servers directly, your applications can scale automatically in response to events, scaling down to zero when idle, which can improve resource efficiency and cost management. In this workspace, you will quickly build an application image, upload it to the internal repository, and load balance it with Red Hat Serverless!

## Guided Exercise

1. Create a new project/namespace from the OpenShift UI and name it `<username>-serverless`
2. From the OpenShift UI, start a new terminal  
   - Type in `oc project` to see which project you have enabled  
   - Type in `kn` to download the Knative CLI
3. Create your first Knative service:

    ```sh
    kn service create module4-helloworld \
      --image quay.io/pknezevich/module4-dotnet-hellolang \
      --autoscale-window 20s \
      --env countryCode=DE
    ```

4. Verify your service has been created and you can `curl` or navigate to your application
5. Tag the revision to green  
   **Note:** We will update with an environment variable, but typically you would use:  
   `kn service update <service-name> --image <new-image>`

    ```sh
    kn service update module4-helloworld \
      --env countryCode=DE \
      --tag module4-helloworld-00001=blue --untag green \
      --tag @latest=green \
      --traffic blue=100,green=0
    ```

6. Tag the blue revision to *inactive*
7. To create a third revision:  
   - From OpenShift Console, change the tag from `module4-helloworld-00002` green to blue  
   - Create a new revision  
     - Change the environment variable (quick revision; this is usually done via an image change)  
     - Set a different country code  
     - Tag the old revision to blue  
     - Do not allow any traffic to the new revision until you're ready

    ```sh
    kn service update module4-helloworld \
      --env countryCode=FR \
      --tag module4-helloworld-00002=blue --untag green \
      --tag @latest=green \
      --traffic blue=100,green=0
    ```

## Self-Paced Exercise

- Build a 3-revision load-balanced environment with 3 different country languages, distribute the traffic evenly between each (33%)
- Add a new image as a revision: `quay.io/pknezevich/helloworld-v2`

    ```sh
    kn service update module4-helloworld \
      --image quay.io/pknezevich/helloworld-v2 \
      --env countryCode=IT \
      --tag module4-helloworld-00001=blue --untag green \
      --tag @latest=green \
      --traffic blue=100,green=0
    ```

## Bonus Tasks

- Design your current environment: canary, blue/green, knife-edge
- You can rename the revision tags to whatever you'd like them to be

## Takeaways

- First time approach to Red Hat's Serverless Scale-to-zero and auto-scaling
- Understanding Revisions and introduced **image tagging** to your container image
- Demonstrated **blue-green deployment**
- Demonstrated **canary deployments** (using traffic distribution)
- Demonstrated a **knife-edge cutover**
