import requests, json, urllib.request
from flask import Flask, request, jsonify, abort
import sys
application = Flask(__name__)

@application.route("/mylotto", methods=['POST'])
def getLotto():
    resPonseMsg = ''
    url = 'https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo='
    lottourl = 'https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo='
    drwNo = '1'
    try:
        body = request.get_json()
        print(body)
        drwNo = body['action']['detailParams']['Lotto']['origin']
        print('drwNo 값!')
        print(drwNo)
        lottourl = url + drwNo
    except: #로또 최신이라고 입력한 경우
        print('로또 최신 검색 중...')
        try:
            mymsg = body['userRequest']['utterance']
            if mymsg.split()[1] == '최신':
                drwNo = 1110
                while True:
                    print('...')
                    lottourl = url + str(drwNo)
                    res = urllib.request.urlopen(lottourl)
                    res_msg = res.read().decode('utf8')
                    jres = json.loads(res_msg)
                    print(lottourl)
                    print(jres)
                    if jres['returnValue'] == 'success':
                        print('@drwNo ' + str(drwNo))
                        drwNo += 1
                        print('-drwNo ' + str(drwNo))
                    else:
                        drwNo -= 1
                        lottourl = url + str(drwNo)
                        break
            else:
                lottourl = url+drwNo
        except:
            lottourl = url+drwNo
        
    res = urllib.request.urlopen(lottourl)
    res_msg = res.read().decode('utf8')
    jres = json.loads(res_msg) #읽어온 메시지를 json화
    if jres['returnValue'] != 'success':
        print(lottourl)
        resPonseMsg = '잘못된 입력입니다.'
    else:
        resPonseMsg = f"""
        {jres['drwtNo1']} {jres['drwtNo2']} {jres['drwtNo3']}
        {jres['drwtNo4']} {jres['drwtNo5']} {jres['drwtNo6']}
        보너스 : {jres['bnusNo']}
        """
    responseBody = {
        'version':'2.0',
        'template' : {
            'outputs' : [
                {
                    'simpleText' : {
                        'text' : resPonseMsg
                    }
                },
                {
                    'simpleImage' : {
                        'imageUrl':'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlhPa-bfqWN69U5NnkX0NuE4yz-UmLGHtNCSVmc_hnQw&s',
                        'altText' : 'Lotto이미지'
                    }
                }
            ]
        }
    }
    return responseBody

if __name__ == "__main__":
    application.run(host='0.0.0.0', port=80)
