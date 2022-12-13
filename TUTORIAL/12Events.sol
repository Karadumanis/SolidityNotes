//SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.0;

contract Modifier {

    enum Status {   
        Taken,       //0
        Preparing,   //1
        Boxed,       //2
        Shipped     //3
    }
    
    struct Order {
        address customer;    
        string zipCode;      
        uint256[] products; 
        Status status;       
    }

    Order[] public orders;  
    address public owner;   
    uint256 public txCount;


    constructor() {            
        owner = msg.sender ;
    } 


    function creatorOrder(string memory _zipCode, uint256[] memory _products) checkProducts(_products) incTx external returns(uint256) {  
       
        Order memory order; 
        order.customer = msg.sender;
        order.zipCode = _zipCode;
        order.products = _products;
        order.status = Status.Taken;
    
        orders.push(order);         
        return orders.length - 1;   
                                    

    
    }

   function advancedOrder(uint256 _orderId) checkOrderId(_orderId) onlyOwner external {   

       Order storage order = orders[_orderId] ; 
       require (order.status != Status.Shipped, "Order is already shipped") ;   
   
       if (order.status == Status.Taken) {
           order.status = Status.Preparing;

       } else if (order.status == Status.Preparing) {
           order.status = Status.Boxed;
       
       }else if (order.status == Status.Boxed) {
           order.status = Status.Shipped;
       }
   
   } 
    

    function getOrder(uint256 _orderId) checkOrderId (_orderId) external view returns(Order memory) {
        
        return orders[_orderId];
    }


    function updateZip (uint256 _orderId, string memory _zip) onlyCustomer (_orderId) incTx external {  
        
        Order storage order = orders[_orderId];

        order.zipCode = _zip ;    
    }

    modifier checkProducts (uint256[] memory _products) {
        require (_products.length > 0, "No Stocked");
        _; 
    }

    modifier checkOrderId (uint256 _orderId) {
        require (_orderId < orders.length, "Invalid Order Id");
        _;
    }

    modifier incTx {
        _;  
        txCount++ ;
    }

    modifier onlyOwner {
        require (owner == msg.sender, "Invalid User") ;
        _;
    }

    modifier onlyCustomer (uint256 _orderId) {
        require (orders[_orderId].customer == msg.sender, "You are not owner.") ;
        _;
    }

}