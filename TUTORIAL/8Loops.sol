//SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.0;

contract Loops {
    uint256[15] public numbers0;
    uint256[15] public numbers1;

    function listbyFor() public{
        uint256[15] memory nums = numbers0;

        for(uint256 i = 0; i < nums.length; i++ ) {       /*bir değişken tanımlandı (uint256 i=0), değişkene dair koşullar yazıldı (1 < num.length), ve değişkeninin artması söylendi (i++).*/
            if(i==9) continue;     /* fonksiyon bu şekilde çalıştırıldığında dizinde 9 yerine 0 yazılı olacak. yani 9 ise atla ve devam et dedik.*/
            /* Yukarıda if continue yerine "if(i==9) break" şeklinde yazarsak dizinde 9 dahil sonraki sayılar gösterilmez yani döngü sonlanır.*/
            nums[i] = i;           /*eğer nums[i] = i*2 yazsadım array 0,2,4,6... şeklinde 15 elemanlı dizilecekti.*/
        } 

        numbers0 = nums;
    }

    function getArr0() public view returns(uint256[15] memory) {
        return numbers0;
    }

    function listbyWhile() public {
        uint256 i = 0; /*değişken belirledik*/
        while (i < numbers1.length) {
            numbers1[i] = i;
            i++; /*değişkeniarttırdık yoksa sonsuz bir while döngüye girer ve çöker.*/
        }
    }

    function getArr1() public view returns(uint256[15] memory) {
        return numbers1;
    }           /*bu fonksiyon arrayi görüntüleyebilmek için.*/


}