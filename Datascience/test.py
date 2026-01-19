from Crypto.Cipher import AES
import requests
import urllib3

urllib3.disable_warnings()


# AES key (16 bytes) from gh.b.f67608a
KEY = bytes([86, 81, 90, 66, 74, 54, 84, 68, 56, 77, 57, 87, 66, 85, 87, 84])

# Corrected AES IV (16 bytes) from gh.b.f67609b – note the added 105 for ‘i’:
IV = bytes([106, 111, 105, 119, 101, 102, 48, 56, 117, 50, 51, 106, 51, 52, 49, 97])


def encrypt_password(raw_password: str) -> str:
    """
    Replicates the app's:
      Cipher.getInstance("AES/CBC/PKCS5Padding")
      cipher.init(ENCRYPT_MODE, key, new IvParameterSpec(iv))
      cipher.doFinal(rawPassword.getBytes("UTF-8"))
      to hex string via gh.c.a(byte[])
    """
    data = raw_password.encode("utf-8")
    # PKCS#7 padding to 16-byte blocks
    pad_len = 16 - (len(data) % 16)
    data += bytes([pad_len]) * pad_len

    cipher = AES.new(KEY, AES.MODE_CBC, IV)
    encrypted = cipher.encrypt(data)

    return encrypted.hex().upper()


def get_book_details(book_id: str, token: str) -> dict:
    """
    Returns book details for the given book ID.
    """

    headers = {
        "Host": "api.storytel.net",
        "Accept": "application/vnd.storytel.bookdetails-v4+json",
        "User-Agent": "Storytel/25.22 (Android 10; Google Android SDK built for arm64) Release/2288934",
        "Authorization": f"Bearer {token}",
        "Accept-Language": "en-US",
        "X-Storytel-Previewstore": "STHP-NL",
        "X-Storytel-Terminal": "android",
        # 'Accept-Encoding': 'gzip, deflate, br',
    }

    params = {
        "kidsMode": "false",
        "configVariant": "default",
    }

    response = requests.get(
        f"https://api.storytel.net/book-details/consumables/{book_id}",
        params=params,
        headers=headers,
        verify=False,
    )

    if response.status_code == 200:
        return response.json()
    else:
        raise Exception(
            f"Failed to get book details: {response.status_code} - {response.text}"
        )


def get_token(email: str, password: str) -> str:
    """
    Returns a token for the given email and password.
    """

    headers = {
        "Host": "www.storytel.com",
        "User-Agent": "Storytel/25.22 (Android 10; Google Android SDK built for arm64) Release/2288934",
        "Content-Type": "application/x-www-form-urlencoded",
        # 'Content-Length': '90',
        # 'Accept-Encoding': 'gzip, deflate, br',
    }

    params = {
        "m": "1",
    }

    data = {
        "uid": email,
        "pwd": encrypt_password(password),
    }

    response = requests.post(
        "https://www.storytel.com/api/login.action",
        params=params,
        headers=headers,
        data=data,
        verify=False,
    )
    # token is at accountInfo.jwt
    if response.status_code == 200:
        json_response = response.json()
        return json_response.get("accountInfo", {}).get("jwt", "")
    else:
        raise Exception(
            f"Failed to get token: {response.status_code} - {response.text}"
        )


# headers = {
#     'Host': 'api.storytel.net',
#     'User-Agent': 'Storytel/25.22 (Android 10; Google Android SDK built for arm64) Release/2288934',
#     'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxOTk3NjE0Iiwic2NvcGUiOlsic3Rvcnl0ZWw6dXNlciIsInN0b3J5dGVsOmVsaXRlIl0sImlhdCI6MTc1MDA2ODY5OSwic2V4cCI6MTc1MDA2ODk5OSwiZXhwIjoxNzUwNjczNDk5LCJpc3MiOiJTVEhQIiwiY2lkIjoiMTk5NzYxNCIsInN0b3JlIjoiU1RIUC1OTCIsImNvdW50cnlJZCI6IjEwIiwiYmFzZVByb2R1Y3RzIjpbIlVOTElNSVRFRCJdfQ.c_uVojV91LrcIeSAkLf3OsirnkoC2mh0nNCllN08ni0',
#     'Accept-Language': 'en-US',
#     'X-Storytel-Previewstore': 'STHP-NL',
#     'X-Storytel-Terminal': 'android',
#     'Content-Type': 'application/json; charset=UTF-8',
#     # 'Content-Length': '35',
#     # 'Accept-Encoding': 'gzip, deflate, br',
# }

# json_data = {
#     'consumableFormatIds': [
#         '2084928',
#     ],
# }

# response = requests.post('https://api.storytel.net/assets/leases/obtain', headers=headers, json=json_data, verify=False)


def obtain_lease(id: str, token: str):
    """
    Obtains a lease for the given ID.
    """

    headers = {
        "Host": "api.storytel.net",
        "User-Agent": "Storytel/25.22 (Android 10; Google Android SDK built for arm64) Release/2288934",
        "Authorization": f"Bearer {token}",
        "Accept-Language": "en-US",
        "X-Storytel-Previewstore": "STHP-NL",
        "X-Storytel-Terminal": "android",
        "Content-Type": "application/json; charset=UTF-8",
    }

    json_data = {
        "consumableFormatIds": [id],
    }

    response = requests.post(
        "https://api.storytel.net/assets/leases/obtain",
        headers=headers,
        json=json_data,
        verify=False,
    )

    if response.status_code == 200:
        return response.json()
    else:
        raise Exception(
            f"Failed to obtain lease: {response.status_code} - {response.text}"
        )


# curl --path-as-is -i -s -k -X $'HEAD' \
#     -H $'Host: api.storytel.net' -H $'User-Agent: Storytel/25.22 (Android 10; Google Android SDK built for arm64) Release/2288934' -H $'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxOTk3NjE0Iiwic2NvcGUiOlsic3Rvcnl0ZWw6dXNlciIsInN0b3J5dGVsOmVsaXRlIl0sImlhdCI6MTc1MDA2ODY5OSwic2V4cCI6MTc1MDA2ODk5OSwiZXhwIjoxNzUwNjczNDk5LCJpc3MiOiJTVEhQIiwiY2lkIjoiMTk5NzYxNCIsInN0b3JlIjoiU1RIUC1OTCIsImNvdW50cnlJZCI6IjEwIiwiYmFzZVByb2R1Y3RzIjpbIlVOTElNSVRFRCJdfQ.c_uVojV91LrcIeSAkLf3OsirnkoC2mh0nNCllN08ni0' -H $'X-Storytel-Terminal: android' -H $'Accept-Encoding: gzip, deflate, br' \
#     $'https://api.storytel.net/assets/v2/consumables/2086033/ebook'


def get_asset(book_id: str, token: str) -> str:
    headers = {
        "Host": "api.storytel.net",
        "User-Agent": "Storytel/25.22 (Android 10; Google Android SDK built for arm64) Release/2288934",
        "Authorization": "Bearer " + token,
        "X-Storytel-Terminal": "android",
        # 'Accept-Encoding': 'gzip, deflate, br',
    }

    response = requests.get(
        f"https://api.storytel.net/assets/v2/consumables/{book_id}/ebook",
        headers=headers,
        verify=False,
    )

    if response.status_code == 200:
        return response.content
    else:
        raise Exception(
            f"Failed to get asset: {response.status_code} - {response.text}"
        )


def get_storytel_ebook(book_id: str, auth_token: str) -> requests.Response | None:
    """
    Fetches an ebook from Storytel given a book ID and an authorization token.

    Args:
        book_id: The ID of the book to fetch (e.g., "1359868").
        auth_token: The Bearer authorization token (e.g., "eyJhbGciOiJIUzI1NiJ9...").

    Returns:
        A requests.Response object if successful, None otherwise.
    """

    initial_url = f"https://api.storytel.net/assets/v2/consumables/{book_id}/ebook"

    initial_headers = {
        "Host": "api.storytel.net",
        "Authorization": f"Bearer {auth_token}",
        "User-Agent": "curl/7.81.0",  # Mimic curl's User-Agent
    }

    try:
        # 1. Make the initial request without allowing redirects, to capture the redirect URL.
        initial_response = requests.get(
            initial_url, headers=initial_headers, verify=False, allow_redirects=False
        )

        # Print initial response details for debugging (optional)
        print(f"--- Initial Request for Book ID: {book_id} ---")
        print("Initial Response Status Code:", initial_response.status_code)
        # print("Initial Response Headers:")
        # for header, value in initial_response.headers.items():
        #     print(f"  {header}: {value}")

        if (
            300 <= initial_response.status_code < 400
            and "Location" in initial_response.headers
        ):
            redirect_url = initial_response.headers["Location"]
            print(f"Redirected to: {redirect_url}")

            # 2. Prepare headers for the redirected request.
            # It's crucial to send the Authorization header again, and potentially the User-Agent.
            redirect_headers = {
                "Authorization": f"Bearer {auth_token}",  # Re-send Authorization
                "User-Agent": initial_headers["User-Agent"],  # Mimic User-Agent
            }

            # 3. Make the request to the redirected URL.
            print(f"Attempting request to redirected URL: {redirect_url}")
            redirect_response = requests.get(
                redirect_url, headers=redirect_headers, verify=False
            )
            redirect_response.raise_for_status()  # Raise an HTTPError for bad responses (4xx or 5xx)

            print(f"--- Redirected Response for Book ID: {book_id} ---")
            print("Redirected Response Status Code:", redirect_response.status_code)
            # print("Redirected Response Headers:")
            # for header, value in redirect_response.headers.items():
            #     print(f"  {header}: {value}")
            # print("\nRedirected Response Body (first 500 chars):")
            # print(redirect_response.text[:500]) # Print first 500 chars

            return redirect_response

        else:
            print(
                f"No redirect found or unexpected status code ({initial_response.status_code}) in initial response for book ID {book_id}."
            )
            # print("Initial Response Body:")
            # print(initial_response.text)
            return None

    except requests.exceptions.HTTPError as http_err:
        print(
            f"HTTP error occurred for book ID {book_id}: {http_err} for URL: {http_err.response.url}"
        )
        # print("Response Body (if available):")
        # print(http_err.response.text)
        return None
    except requests.exceptions.RequestException as e:
        print(f"An error occurred for book ID {book_id}: {e}")
        return None


if __name__ == "__main__":
    pwd = "a&rdtkW@jb3R8fob"
    email = "mol.lgj@gmail.com"
    book_id = input("Enter the book ID: ")  # e.g., "1359868"

    token = get_token(email, pwd)
    print(f"Token: {token}")
    book_details = get_book_details(book_id, token)
    leaseID = book_details["formats"][0]["id"]
    title = book_details["title"]
    print(f"Lease ID: {leaseID}")
    print("Obtaining lease...")
    lease = obtain_lease(leaseID, token)
    print("Lease obtained:")
    print(lease)
    asset = get_storytel_ebook(book_id, token)

    if asset is None:
        print("Failed to obtain the ebook.")
    else:
        print(f"Asset content length: {len(asset.content)} bytes")
        # Save the ebook to a file
        with open(f"{title}.epub", "wb") as f:
            f.write(asset.content)
        print("Book downloaded successfully.")
