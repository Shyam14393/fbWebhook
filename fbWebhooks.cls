@RestResource(urlMapping='/rainbowwebhook/*')
global with sharing class fbWebhooks {

  @HttpPost
    global static String doPost() {
        String mode ='subscribe';
        integer challenge =1158201444;
        String verify_token ='verify_token';
        RestRequest request = RestContext.request;
        RestResponse response = restContext.response;
        system.debug('99');
        String res = request.headers.get('X-Hub-Signature-256');
        system.debug('100:'+res);
        Account account = new Account();
        account.Name = 'shyam123';
        system.debug('@@@@@@@@@@:'+account);
        insert account;
        return account.Id;
    }
}