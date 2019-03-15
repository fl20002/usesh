f = open("/sg/sg.log",'a')

from urllib2 import urlopen
ip = urlopen('https://api.ipify.org').read()
print >> f,ip

import time
now = int(time.time())
timeStruct = time.localtime(now)
strTime = time.strftime("%Y-%m-%d %H:%M:%S", timeStruct)
print >> f,strTime

text1 = '{"SecurityGroupId":"ID","SecurityGroupPolicySet":{"Egress":[{"CidrBlock":"0.0.0.0/0","Action":"ACCEPT"}],"Ingress":[{"CidrBlock":"'
text2 = '","Action":"ACCEPT"}]}}'
rule1 = text1+ip+text2

text3 = '{"SecurityGroupId":"ID","SecurityGroupPolicySet":{"Egress":[{"CidrBlock":"0.0.0.0/0","Action":"ACCEPT"}],"Ingress":[{"CidrBlock":"'
text4 = '","Action":"ACCEPT"}]}}'
rule2 = text3+ip+text4

from tencentcloud.common import credential
from tencentcloud.common.profile.client_profile import ClientProfile
from tencentcloud.common.profile.http_profile import HttpProfile
from tencentcloud.common.exception.tencent_cloud_sdk_exception import TencentCloudSDKException
from tencentcloud.vpc.v20170312 import vpc_client, models

try:

    cred = credential.Credential("ID", "KEY")
    httpProfile = HttpProfile()
    httpProfile.endpoint = "vpc.ap-shanghai.tencentcloudapi.com"
    clientProfile = ClientProfile()
    clientProfile.httpProfile = httpProfile
    client = vpc_client.VpcClient(cred, "ap-shanghai", clientProfile)
    req = models.ModifySecurityGroupPoliciesRequest()
    params = rule1
    req.from_json_string(params)
    resp = client.ModifySecurityGroupPolicies(req) 
    print >> f,resp.to_json_string()

except TencentCloudSDKException as err:
    print >> f,err

try:

    cred = credential.Credential("ID", "KEY")
    httpProfile = HttpProfile()
    httpProfile.endpoint = "vpc.ap-hongkong.tencentcloudapi.com"
    clientProfile = ClientProfile()
    clientProfile.httpProfile = httpProfile
    client = vpc_client.VpcClient(cred, "ap-hongkong", clientProfile)
    req = models.ModifySecurityGroupPoliciesRequest()
    params = rule2
    req.from_json_string(params)
    resp = client.ModifySecurityGroupPolicies(req)
    print >> f,resp.to_json_string()

except TencentCloudSDKException as err:
    print >> f,err
