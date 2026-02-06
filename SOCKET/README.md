# Socket Programming in Perl

This directory contains examples of network programming using Perl's `IO::Socket::INET` module. It demonstrates the fundamental logic behind TCP Client-Server communication.

## Core Concepts

### 1. What is a Socket?
A **socket** is an endpoint for communication between two machines. It acts like a door: one machine opens a door (server) and waits, while the other (client) knocks to enter.
- **Components**: IP Address (Machine) + Port Number (Application).

### 2. The Server (`server.pl`)
The server's job is to **bind** to a specific port and **listen** for incoming connections.
- **Module**: `IO::Socket::INET`
- **Steps**:
    1. **Create Socket**: Define Protocol (TCP), Local Port (e.g., 7777), and set `Listen` queue.
    2. **Accept Connection**: The `$server->accept()` method blocks (pauses) execution until a client connects.
    3. **Handle Data**: Once connected, it reads from the client socket handle (`<$client_socket>`) just like a file.
    4. **Close**: Close the connection and wait for the next one.

```perl
my $socket = new IO::Socket::INET (
    LocalHost => '127.0.0.1',
    LocalPort => '7777',
    Proto => 'tcp',
    Listen => 5,
    Reuse => 1
);
```

### 3. The Client (`client.pl`)
The client's job is to **connect** to a known server address and port.
- **Steps**:
    1. **Connect**: Create a socket specifying the `PeerAddr` (Server's IP) and `PeerPort`.
    2. **Send Data**: Write to the socket handle (`print $socket "Hello!"`).
    3. **Receive Response**: Read from the socket handle.

## Running the Example
1. **Start the Server** (Window 1):
   ```bash
   perl server.pl
   ```
   *It will hang, waiting for a connection.*

2. **Run the Client** (Window 2):
   ```bash
   perl client.pl
   ```
   *It will send a message, and the server will receive and display it.*
