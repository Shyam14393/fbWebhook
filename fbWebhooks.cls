@RestResource(urlMapping='/rainbowwebhook/*')
global with sharing class fbWebhooks {

  @HttpPost
    global static String doPost() {
        Account account = new Account();
        account.Name = 'shyam123';
        system.debug('@@@@@@@@@@:'+account);
        insert account;
        return account.Id;
    }
}