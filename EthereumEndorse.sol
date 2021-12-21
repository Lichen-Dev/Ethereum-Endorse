pragma solidity ^0.8.10;

interface NFT{
    
    function ownerOf(uint256 tokenId) external view returns (address) ;

}

contract EthereumEndorse {

    struct SignObject{

     address[99] Signatures;
     uint ArrayPosition;
     bool setvalues;

    }

 mapping(bytes => SignObject) public SignObjects;

function sign(address NFTAddress, uint256 tokenId) public returns(bytes memory){
     uint a;
     bool SenderSigned;
     address owner;
     bytes memory Concatenated;

    owner = NFT(NFTAddress).ownerOf(tokenId);

    Concatenated = abi.encodePacked(NFTAddress, tokenId);
    SignObject storage SignObject_ = SignObjects[Concatenated];

    if (SignObject_.setvalues!=true){
            SignObject_.setvalues=true;
    }

    for(a=1; a<99; a++){

        if (SignObject_.Signatures[a]==msg.sender){
            SenderSigned=true;
        }
    }

    if(SenderSigned != true){
        
        SignObject_.ArrayPosition++;
        SignObject_.Signatures[SignObject_.ArrayPosition]=msg.sender;
    
    }
    return (Concatenated);


    }

 
 function GetSignatures(bytes memory Concatenated) public returns(address[99] memory){
     SignObject storage SignObject_ = SignObjects[Concatenated];
     return SignObject_.Signatures;
 }

}


