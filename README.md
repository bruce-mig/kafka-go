# Kafka-Go

Using Apache Kafka  for event streaming for a Go client application .


### Kafka setup

To need a Kafka Cluster for the client application to operate with.  
To run Kafka in Docker via the Confluent CLI, first, install and start Docker Desktop or Docker Engine if you don't already have it.  
Verify that Docker is set up properly by ensuring that no errors are output when you run docker info in your terminal.

Install the Confluent CLI if you don't already have it. In your terminal:

```bash
brew install confluentinc/tap/cli
```


### To start Kafka broker

```bash
confluent local kafka start
```

Note the Plaintext Ports printed in your terminal, which you will use when configuring the client in the next step.
### Config
Paste the following configuration data into a file named getting-started.properties, substituting the plaintext port(s) output when you started Kafka.

```
bootstrap.servers=localhost:<PLAINTEXT PORTS>
```

### Create Topic

A topic is an immutable, append-only log of events.  
Usually, a topic is comprised of the same kind of events.

Create a new topic, e.g. purchases, which you will use to produce and consume events.

```bash
confluent local kafka topic create purchases
```

### Produce events:

In order to run the producer, execute the compiled binary passing in the configuration file 

```bash
make run-prod
```

### Consume events:

From another terminal, run the following command to run the consumer application which will read the events from the purchases topic and write the information to the terminal.

```bash
make run-con
```

Rerun the producer to see more events, or feel free to modify the code as necessary to create more or different events.

Once you are done with the consumer, enter `Ctrl-C` to terminate the consumer application.

### To stop Kafka

```bash
confluent local kafka stop
```