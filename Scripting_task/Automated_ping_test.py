import subprocess

def ping_servers(server_list):
    for server in server_list:
        try:
            subprocess.run(["ping", "-c", "1", server], check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            print(f"{server}: Reachable")
        except subprocess.CalledProcessError:
            print(f"{server}: Unreachable")

# Example Usage
servers_to_ping = ["server1", "server2", "server3"]
ping_servers(servers_to_ping)
