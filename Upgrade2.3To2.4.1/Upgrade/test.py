import hashlib
import os
import re
import urlparse

import requests
from urllib3.exceptions import InsecureRequestWarning

requests.packages.urllib3.disable_warnings(InsecureRequestWarning)


__all__ = ["get_root_password"]


def get_root_password(seed):
    md5 = hashlib.md5()
    md5.update(seed + "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAq0h/Q/6RiecEyeByhjJf")

    return md5.hexdigest()[2:12]


def auth_check(func):
    def func_wrapper(self, *args, **kwargs):
        if not self.session:
            self._login()

        return func(self, *args, **kwargs)

    return func_wrapper

class SboxApi(object):
    def __init__(self, base_url, username, password):
        self.base_url = base_url
        self.username = username
        self.password = password
        self.session = None

    def _login(self):
        session = requests.Session()
        login_url = "PLATFORM/auth/signin"

        def do_login(comeback=''):
            url = urlparse.urljoin(self.base_url, login_url)
            return session.post(url,
                                {"username": self.username, "password": self.password, "comeback": comeback},
                                verify=False)

        response = do_login()
        if response.url.endswith("PLATFORM/auth/login"):
            match = re.search(r'name="comeback"\s+value="([\d\w]+)"', response.content)
            if match:
                comeback = match.group(1)
                do_login(comeback)
                self.session = session

    @auth_check
    def download_splunk_file(self):
        url = urlparse.urljoin(self.base_url, "SPLUNK/apps/do_pack/SplunkForwarder")
        response = self.session.get(url, stream=True, verify=False)

        import re
        match = re.search(r'filename="([\S]+)"', response.headers["Content-Disposition"])
        if not match:
            raise RuntimeError("No diagnostic file name found")

        file_path = os.path.join("output", match.group(1))
        with open(file_path, 'wb') as fd:
            for chunk in response.iter_content(2048):
                fd.write(chunk)

        return os.path.basename(file_path)

    def download_splunk_tgz_version(self, version):
        try:
            url="http://download.splunk.com/releases/7.0.0/linux/"+version
            r = requests.get(url)
            file_path = os.path.join("Upgrade2.3To2.4.1/Upgrade/Keywords", version)
            with open(file_path, 'wb') as f:  
                f.write(r.content)
            return os.path.basename(file_path)
        except requests.exceptions.HTTPError as errh:
            print("Http Error:",errh)
        except requests.exceptions.ConnectionError as errc:
            print("Error Connecting:",errc)
        except requests.exceptions.Timeout as errt:
            print("Timeout Error:",errt)
        except requests.exceptions.RequestException as err:
            print("Undefined error",err) 
   
    def download_upgrade_pack(self):
        try:
            url="https://downloads.geminidata.com/appliance/pack/2/4/1/gemini-appliance-2.3-to-2.4.1.pack.v6"
            r = requests.get(url)
            file_path = os.path.join("Upgrade2.3To2.4.1/Upgrade/Keywords/2.2.3to2.3", "gemini-appliance-2.3-to-2.4.1.pack.v6")
            with open(file_path, 'wb') as f:  
                f.write(r.content)
            return os.path.basename(file_path)
        except requests.exceptions.HTTPError as errh:
            print("Http Error:",errh)
        except requests.exceptions.ConnectionError as errc:
            print("Error Connecting:",errc)
        except requests.exceptions.Timeout as errt:
            print("Timeout Error:",errt)
        except requests.exceptions.RequestException as err:
            print("Undefined error",err)

    
