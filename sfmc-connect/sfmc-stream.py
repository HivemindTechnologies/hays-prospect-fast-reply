import FuelSDK
import ET_Client

#define local variables
clientid= '<Your Client Id>'
clientsecret='<Your Client Secret>'
subdomain = '<Your Domain Name>'
auth_base_url = f'https://{subdomain}.auth.marketingcloudapis.com/' rest_url = f'https://{subdomain}.rest.marketingcloudapis.com/'
soap_url=f'https://{subdomain}.soap.marketingcloudapis.com/'
#Passing config as a parameter to ET_Client constructor:
myClient = FuelSDK.ET_Client(True, False,
                             {'clientid': clientid,
                              'clientsecret':clientsecret,
                              'useOAuth2Authentication': 'True',
                              'authenticationurl': auth_base_url,
                              'applicationType': 'server',
                              'baseapiurl': rest_url,
                              'soapendpoint': soap_url})
# Next, create an instance of the ET_Client class:
myClient = FuelSDK.ET_Client()

# Create an instance of the object type we want to work with:
list = FuelSDK.ET_List()

# Associate the ET_Client- object using the auth_stub property:
list.auth_stub = myClient

# Utilize one of the ET_List methods:
response = list.get()

# Print out the results for viewing
print 'Post Status: ' + str(response.status)
print 'Code: ' + str(response.code)
print 'Message: ' + str(response.message)
print 'Result Count: ' + str(len(response.results))
print 'Results: ' + str(response.results)

#import pandas library package
import pandas as pd
#define dataframe to read response into dataframe
df=pd.DataFrame(response.results)
#load data into csv data file
df.to_csv('salesforce_marketing_cloud_sample.csv', index=False)