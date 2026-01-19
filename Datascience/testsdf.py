import requests
import time  # For potential timing issues

url = "https://api.storytel.net/assets/v2/consumables/1359868/ebook"

# The original headers for the initial request
initial_headers = {
    "Host": "api.storytel.net",
    "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxOTk3NjE0Iiwic2NvcGUiOlsic3Rvcnl0ZWw6dXNlciIsInN0b3J5dGVsOmVsaXRlIl0sImlhdCI6MTc1MDA3MDcyMiwic2V4cCI6MTc1MDA3MTAyMiwiZXhwIjoxNzUwNjc1NTIyLCJpc3MiOiJTVEhQIiwiY2lkIjoiMTk5NzYxNCIsInN0b3JlIjoiU1RIUC1OTCIsImNvdW50cnlJZCI6IjEwIiwiYmFzZVByb2R1Y3RzIjpbIlVOTElNSVRFRCJdfQ.-GjSdne7qVasrrJei8JnHlszGk3hWWjD54w7O_-ZpuI",
    "User-Agent": "curl/7.81.0",  # Mimic curl's User-Agent (or a common browser UA)
}

try:
    # 1. Make the initial request without allowing redirects, to capture the redirect URL.
    # We still pass the original headers.
    initial_response = requests.get(
        url, headers=initial_headers, verify=False, allow_redirects=False
    )

    print("Initial Response Status Code:", initial_response.status_code)
    print("Initial Response Headers:")
    for header, value in initial_response.headers.items():
        print(f"  {header}: {value}")

    if (
        300 <= initial_response.status_code < 400
        and "Location" in initial_response.headers
    ):
        redirect_url = initial_response.headers["Location"]
        print(f"\nRedirected to: {redirect_url}")

        # 2. Prepare headers for the redirected request.
        # It's crucial to send the Authorization header again, and potentially the User-Agent.
        # The 'Host' header will be automatically set by requests based on the redirect_url.
        redirect_headers = {
            "Authorization": initial_headers[
                "Authorization"
            ],  # **CRITICAL: Re-send Authorization**
            "User-Agent": initial_headers["User-Agent"],  # Mimic User-Agent if needed
            # You might want to remove the 'Host' header from here and let requests manage it
            # since the host for the redirected URL is different.
            # 'Host' is automatically set by requests based on the URL provided.
        }

        # 3. Make the request to the redirected URL.
        print(f"\nAttempting request to redirected URL: {redirect_url}")
        # Note: We're not passing cookies from initial_response.cookies because the first response
        # didn't have any Set-Cookie headers.
        redirect_response = requests.get(
            redirect_url, headers=redirect_headers, verify=False
        )
        redirect_response.raise_for_status()  # This will still raise if it's a 404

        print("Redirected Response Status Code:", redirect_response.status_code)
        print("Redirected Response Headers:")
        for header, value in redirect_response.headers.items():
            print(f"  {header}: {value}")
        print("\nRedirected Response Body:")
        # If the content is binary (like an epub), you might want to save it to a file
        # or handle it as bytes: redirect_response.content
        print(
            redirect_response.text[:500]
        )  # Print first 500 chars to avoid huge output

    else:
        print("\nNo redirect found or unexpected status code in initial response.")
        print("Initial Response Body:")
        print(initial_response.text)


except requests.exceptions.HTTPError as http_err:
    print(f"HTTP error occurred: {http_err} for URL: {http_err.response.url}")
    print("Response Body (if available):")
    print(http_err.response.text)
except requests.exceptions.RequestException as e:
    print(f"An error occurred: {e}")
