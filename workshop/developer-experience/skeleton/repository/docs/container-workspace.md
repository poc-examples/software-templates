# Module 3: Managing Your Container Workspace

## Git Repositories

- **Python:** https://github.com/na-launch/developer-experience-workshop/tree/module3-python  
- **Dotnet:** https://github.com/na-launch/developer-experience-workshop/tree/module3-dotnet

## Objectives

Inside this workspace is a Python application that connects to an OpenShift Kafka Cluster. There are three commands you can run from within the application:

```sh
# Run the Producer
python producer.py --topic <name_of_topic>
```

```sh
# Run the Consumer
python consumer.py --topic <name_of_topic>
```

```sh
# Run the WebApp
uvicorn main:app --host 0.0.0.0 --port 8000 --reload
```

## Self Paced Exercise

The application has some problems that we would like you to fix:

1. Run the following to install the necessary dependencies:

    ```sh
    pip install -r requirements.txt
    ```

2. Set the `KAFKA_BOOTSTRAP_SERVERS` environment variable based on the Kafka cluster you created.

3. Open the following link in a separate browser window as a reference:  
   https://devfile.io/docs/2.3.0/quickstart-che

4. Create a new `devfile.yaml` in the project root.

5. Configure the following:
   - Point to the Python UBI image: `registry.access.redhat.com/ubi9/python-39:1-1739420387`
   - Set memory and CPU limits
   - Do not rely on CLI anymore

6. Define the following devfile tasks:
   - Create a build task for installation
   - Create a run task for `consumer.py`
   - Create a run task for `producer.py`
   - Create a run task for `main.py`

7. Create a new topic in the producer command named `workshop-today`
   - Add 7–8 messages in there

8. Run the consumer command and point it to the topic `workshop-today`
   - Verify that messages are funnelling through

9. Run the web application (If you have created a run command for `main.py`, you can use that)
   - In the topics input, enter `workshop-today` and verify the messages are funnelling through

## Bonus Tasks

- Add your devfile tasks to `tasks.json`
- Load 3 Python extensions into `.vscode/extensions.json`
- Write a few small unit tests using mocks for the Kafka producer to verify that your logic (like input handling and retry mechanisms) works as expected without needing a real Kafka cluster

## Easter Eggs!

- There is an easter egg in the code
- Be thorough! Look through the code

## Takeaways

- Built your first devfile
- Configured your devspaces / odo workspace
- Customized your VSCode environment
- First interaction with **Streams for Apache Kafka**
- Introductory patterns around **Event Driven Architecture**
