
/api/V1/
    CheckStatus
    CheckPasswordNeeded
    GetIsWalletEncrypted
    GetIsEncryptedPasswordStored
    GetEncryptWallet/{password}
    GetDecryptWallet/{password}
    GetEncryptLock
    GetCLIVersion
    GetWalletInfo
    GetAllAddresses
    GetValidatorAddresses
    getgenesisblock
    ImportPrivateKey
    GetNewAddress
    SendTransaction/{from}/{to}/{amount}
    StartValidating/{address}/{username}
    TurnOnValidator/{id}
    TurnOffValidator/{id}
    GetValidatorInfo/{address}
    SendBlock/{height}
    GetMasternodes
    GetPeerInfo
    GetDebugInfo
    GetRollbackBlocks/{id}
    SendExit
    ClearRBXLog
    ChangeValidatorName/{name}

===================

/voapi/VOV1/
    GetAllTopics
    GetActiveTopics
    GetInactiveTopics
    GetMyTopics
    GetSearchTopics/{search}

    GetTopicDetails/{topicUid}
    GetMyVotes
    GetTopicVotes/{topicUid}
    CastTopicVote/{topicUid}/{vote}

===================

/scapi/scv1/
    GetAllSmartContracts
    GetAllSmartContracts/{page}/{search}
    GetMintedSmartContracts/{page}/{search}
    GetSingleSmartContract/{id}
    ChangeNFTPublicState/{id}
    GetSmartContractData/{id}
    CreateSmartContract
    MintSmartContract/{id}
    TransferNFT/{id}/{address}
    TransferNFT/{id}/{address}/{url}
    EvolveSpecific/{id}/{address}/{stage}
    Burn/{id}
    AssociateNFTAsset/{id}/{path}
    DownloadNftAssets/{id}
    GetNFTAssetLocation/{id}/{filename}


===================

/bcapi/BCV1/
    GetBeacons
    AddBeacon/{name}/{port}/{ip}
    CreateBeacon/{name}/{port}
    DeleteBeacon/{id}

==== 

/txapi/txV1/
    CreateAdnr/{address}/{name}
    TransferAdnr/{from}/{to}/
    DeleteAdnr/{address}
