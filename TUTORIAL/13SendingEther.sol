//SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.0;

contract Bank {
    mapping (address => uint) balances;      //bir mapping yarattık adı balances, adres karşılığı rakam tutulması söylendi.

    function sendEthertoContract () payable external {     //bir func adı sendEther,dışarıdan veri alacağı için external, ödeme alabilmesi için payable
        balances[msg.sender] = msg.value;        //balances isimli mappingi/array için [] kullandık, bu array gönderenin adresi msg.sender = gönderilen değer msg.value
    }
    
    function showBalance() external view returns(uint) {   //showBalance isminde bir function, dışarıdan etkileşim alacak(external), sadece görüntüleme yapacak(view), dönüş olarak rakamsal(uint)
        return balances[msg.sender];         //döndür msg.sender'ın balance'ı
    }

//transfer() komutu eğer yeterli amount yoksa revert mesajı verir.
    function withdraw(address payable to, uint amount) external { 
        require(balances[msg.sender] >= amount, "insufficient amount");        
        to.transfer(amount);
        balances[msg.sender] -= amount;
    }

//send() komutu bize true veya false döndürür. Örneğin yukarıda withdraw func.ı send ile yazsaydık şöyle yazacaktık:

// function withdraw(address payable to, uint amount) external returns(bool) { 
//         require(balances[msg.sender] >= amount, "insufficient amount");        
//         bool ok = to.send(amount);
//         balances[msg.sender] -= amount;
//         return ok;    

//call{} komutu ile de gönderim yapabiliriz. o halde şu şekilde yazılır:

// function withdraw(address payable to, uint amount) external returns(bool) { 
//         require(balances[msg.sender] >= amount, "insufficient amount");        
//         (bool sent, bytes memory data) = to.call{value: amount} ("...");  //bytes memory data kısmı önceden tanımlanmadığı için hata verecektir, "," yerinde kalmak şartı ile tanımlanmayan kısmı silip compile edebiliriz.
//         balances[msg.sender] -= amount;
//         return sent; 

/*--------------------------------------------*/

//bir kontratın ether alabilmesi için iki türlü tanımlamaya ihtiyacı vardır:
// 1)receive: bu komut dışarıdan kontrata ether geldiğinde çalışacak.
    uint public receiveCount = 0;
    uint public fallbackCount = 0;
    receive () external payable {
        receiveCount +=1;
    }

// 2) fallback: bu komut ile kontrata data gönderebiliriz.
    fallback () external payable {
        fallbackCount += 1;
    }
//fallback ile data göndermek istediğimizde bunu doğrudan string olarak gönderemeyiz, hexadecimal cinsinden yazmalıyız.ascii table a bak
}