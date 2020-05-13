import re
import datetime
from ftplib import FTP


# getting download parameters
# TODO: GET FROM SHELL ARGS
start = '1/10/2019'
end = '5/10/2019'
base_cwd = f'Core/IBI_ANALYSIS_FORECAST_PHYS_005_001/dataset-ibi-analysis-forecast-phys-005-001-daily/'

# getting ftp connection parameters
domain = r'nrt.cmems-du.eu'
user = r'lmendonca1'
passwd = r'Lfm241083@'

# settting up ftp connection
ftp = FTP(domain)
ftp.login(user=user, passwd=passwd)

# getting date list to download
start_dmy = re.findall(r'/?(\d+)/?', start)
end_dmy = re.findall(r'/?(\d+)/?', end)
start_date = datetime.datetime(*[int(i) for i in reversed(start_dmy)])
end_date = datetime.datetime(*[int(i) for i in reversed(end_dmy)])
interval = end_date - start_date
list_of_dates = [ start_date + datetime.timedelta(days=i) for i in range(interval.days)]

# downloading data
for date in list_of_dates:
    # getting to ftp folder
    cwd = base_cwd + f'{date.year}/{date.month}/'
    ftp.cwd(cwd)

    # listing directory
    files = []
    try:
        files = ftp.nlst()
    except(ftplib.error_perm, resp):
        if str(resp) == "550 No files found":
            print("No files in this directory")
        else:
            raise

    for f in files:
        print(f)

    ftp.close()


def download(filename):
    localfile = open(filename, 'wb')
    ftp.retrbinary('RETR ' + filename, localfile.write, 1024)
    ftp.quit()
    localfile.close()
