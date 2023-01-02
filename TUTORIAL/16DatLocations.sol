//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


/*
           Kontrat           <----                  Kontrata yapılan çağrı
           -------                                      -------------
    Kontrat depolama alanı           Fonksiyon için ayrılan hafıza ve çağrıdaki data alanı
    memory:          Geçici hafıza
    storage:         Kalıcı hafıza
    calldata:        Çağrıdaki argümanlar
    bytes, string, array, struct
    * Değer tipleri (uint, int, bool, bytes32) kontrat üzerinde storage, 
      fonksiyon içinde memory'dir
    
    * mapping'ler her zaman kontrat üzerinde tanımlanır ve storage'dadır.
*/

contract dataLocation{


}