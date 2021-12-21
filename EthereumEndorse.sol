pragma solidity ^0.8.10;


interface NFT{
    
    function tokenURI(uint256 tokenId) external view returns (string memory);
    function ownerOf(uint256 tokenId) external view returns (address) ;

}


contract EthereumEndorse {

    struct SignObject{

     string URI;
     address[99] Signatures;
     uint ArrayPosition;
     bool setvalues;

    }

 mapping(string => SignObject) public SignObjects;





function GetOwner(uint256 tokenId, address NFTAddress) public returns (address){

   return NFT(NFTAddress).ownerOf(tokenId);
}

function sign(address NFTAddress, uint256 tokenId, string memory Concatenated) public {
     uint a;
     bool SenderSigned;
     address owner;

    owner = NFT(NFTAddress).ownerOf(tokenId);

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
    }

 
 function GetSignatures(string memory Concatenated) public returns(address[99] memory){
     SignObject storage SignObject_ = SignObjects[Concatenated];
     return SignObject_.Signatures;
 }

}


