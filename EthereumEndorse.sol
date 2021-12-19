pragma solidity ^0.8.10;

contract EthereumEndorse {

    struct SignObject{

     string URI;
     address[99] Signatures;
     uint ArrayPosition;
     bool setvalues;

    }

 mapping(string => SignObject) public SignObjects;

 function sign(string memory URI) public {
     uint a;
     bool SenderSigned;
    SignObject storage SignObject_ = SignObjects[URI];

    if (SignObject_.setvalues!=true){
            SignObject_.setvalues=true;
            SignObject_.URI=URI;

    }
    for(a=0; a<100; a++){
        if (SignObject_.Signatures[a]==msg.sender){
            SenderSigned=true;
        }
    }
    if (SenderSigned!= true){
        SignObject_.ArrayPosition++;
        SignObject_.Signatures[SignObject_.ArrayPosition]=msg.sender;
    }
    }

 function GetSignatures(string memory URI) public returns(address[99] memory){
     SignObject storage SignObject_ = SignObjects[URI];
     return SignObject_.Signatures;
 }

}
