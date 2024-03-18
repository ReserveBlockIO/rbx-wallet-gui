


NameSpace:
btcapi/

Methods

GET /GetDefaultAddressType
{Success: true, Message: "", AddressType: "Segwit"}


GET /GetNewAddress
{Success: true, Message: "", Address: "", PrivateKey: "", WifKey:"" }


GET /ImportPrivateKey/{privateKey}/{addressFormat}
(addressFormat = 0,1,2 [0 SegwitP2SH, 1 Segwit, 2 Toproot])

{Success: true}


GET /GetBitcoinAccountList/{true/false}
(true/false => hide private keys)
{Success: true, Message: "", BitcoinAccounts: []}



BitcoinAccount Model
{
    Id, PrivateKey, WifKey, PublicKey, Address, Balance
}


GET /GetBitcointAccount/Address/{address}/{true/false}
(true/false => hide private keys)


/GetAddressUTXOList/{address}
(this is for incoming transactions)

BitcoinUTXO Model
{
    Id, Address, TxID, Value, Vout, IsUsed
}

use IsUsed as a label ("TX Completed")



Balance = Multiplyer * value

Satoshu Multiplier:
0.00000001M


/GetAddressTXList/{address}
(this for outgoing transactions)

{
    Success,
    Result
    TXs: BitcoinTransaction[]
}

BitcoinTransaction Model
{
    Hash,
    ToAddress,
    FromAddress,
    Amount,
    Fee,
    Timestamp,
    Signature,
    TransactionType,
    FeeRate
}



GET /GetTransactionFee/{fromAddress}/{toAddress}/{amt}/{feeRate}


{
    Success: true,
    SatoshiFee: 1250 (int)
    BitcoinFee: 0.000001260 (double)
}

IF 0 comes back, there is a problem



GET /SendTransaction/{fromAddress}/{toAddress}/{amt}/{feeRate}/{overrideInteralSend?}
(
    feeRate: allow user to input (but we should add an external integration to get current value) => value is number of satashis per byte (for fee estiamte generally ~140 bytes per tx)

    override internal send: (just keep this as true)
)

https://mempool.space/api/v1/fees/recommended
(maybe have explorer sync this data)

** maybe we check if that address already exists in wallet list to confirm with the override





GET /ResetAccount
(call it "Resync Bitcoin Accounts")
* throttle once every five minutes max => aaron taking care of this, will be false with message


=====
Web Wallet
======

PART 1
generate / import address (segwet) 
- email/password
- mnumonic version


PART 2
get balances & utxos
- probably need to pay for an API key on btc explorer

vout, tx hash, balance

PART 3
send transaction
- fee rate
- look up how to create inputs and outputs
- send change back to the original address
- broadcast to CLI via explorer
- explorer service tracks this tx and 


PART 4
outputs
- transaction list (will be saved in explorer db)


