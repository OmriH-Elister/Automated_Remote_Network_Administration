from http.server import BaseHTTPRequestHandler, HTTPServer
import subprocess

# Set the nameserver
NS = '8.8.8.8'

def resolve_domain(domain, NS):
    # Run the nslookup command with the domain and nameserver, querying only for A records (IPv4)
    result = subprocess.run(['nslookup', '-type=A', domain, NS], capture_output=True, text=True)
    
    if result.returncode == 0:
        # Extract the IP address from the nslookup result
        answers = result.stdout.split('\n')
        ip = [line for line in answers if 'Address:' in line][-1].split(':')[1].strip()
        return ip
    else:
        print(f"Error resolving domain: {result.stderr}")
        return None

# Define the HTTP request handler
class RequestHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-type", "text/html")
        self.end_headers()

        # Read the web page content and serve it
        with open("c:\\windows\\temp\\weboutput.html", "rb") as file:
            self.wfile.write(file.read())

# Start the HTTP server
server = HTTPServer(("localhost", 8000), RequestHandler)
print("Serving at http://localhost:8000")

# Main loop to resolve domain and fetch webpage using curl
while True:
    domain = input("Enter URL: ")
    ip = resolve_domain(domain, NS)

    if ip:
        # Fetch the webpage using curl, specifying the resolved IP directly
        curl_command = ['curl', '-L', f'http://{ip}', '-H', f'Host: {domain}']
        
        # Run the curl command and capture the response
        response = subprocess.run(curl_command, capture_output=True)

        # Check if curl command was successful
        if response.returncode == 0:
            # Write the fetched content to the file
            with open("c:\\windows\\temp\\weboutput.html", "wb") as file:
                file.write(response.stdout)
            print(f"Fetched {domain} successfully!")
        else:
            print(f"Error fetching the webpage: {response.stderr.decode()}")
    
    server.serve_forever()

